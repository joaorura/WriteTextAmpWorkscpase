#!/usr/bin/env pwsh
#Requires -Version 7.0

<#
.SYNOPSIS
    Configura o Docling para iniciar automaticamente no Windows
    
.DESCRIPTION
    Este script cria uma entrada no Task Scheduler do Windows para
    iniciar o servidor Docling HTTP automaticamente no login.
    
.PARAMETER Port
    Porta do servidor Docling (padrão: 8000)
    
.PARAMETER Remove
    Remove a tarefa de inicialização automática
    
.PARAMETER Status
    Verifica o status da tarefa de inicialização
    
.EXAMPLE
    .\setup-docling-startup.ps1
    
.EXAMPLE
    .\setup-docling-startup.ps1 -Port 9000
    
.EXAMPLE
    .\setup-docling-startup.ps1 -Remove
    
.EXAMPLE
    .\setup-docling-startup.ps1 -Status
#>

[CmdletBinding()]
param(
    [int]$Port = 8000,
    [switch]$Remove,
    [switch]$Status
)

$ErrorActionPreference = 'Stop'

# Cores para output
$Colors = @{
    Success = 'Green'
    Warning = 'Yellow'
    Error = 'Red'
    Info = 'Cyan'
    Header = 'Magenta'
}

function Write-Step {
    param([string]$Message)
    Write-Host "`n=== $Message ===" -ForegroundColor $Colors.Header
}

function Write-Success {
    param([string]$Message)
    Write-Host "✓ $Message" -ForegroundColor $Colors.Success
}

function Write-Warning {
    param([string]$Message)
    Write-Host "⚠ $Message" -ForegroundColor $Colors.Warning
}

function Write-Error-Custom {
    param([string]$Message)
    Write-Host "✗ $Message" -ForegroundColor $Colors.Error
}

function Write-Info {
    param([string]$Message)
    Write-Host "ℹ $Message" -ForegroundColor $Colors.Info
}

$TaskName = "Docling HTTP Server"
$WorkspaceRoot = Split-Path $PSScriptRoot -Parent
$PythonScript = Join-Path $PSScriptRoot "start-docling-server.py"

# Verifica se o script Python existe
if (-not (Test-Path $PythonScript)) {
    Write-Error-Custom "Script start-docling-server.py não encontrado em: $PythonScript"
    exit 1
}

# Verifica status
if ($Status) {
    Write-Step "Status da Tarefa de Inicialização"
    
    $task = Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue
    
    if ($task) {
        Write-Success "Tarefa encontrada: $TaskName"
        Write-Info "Status: $($task.State)"
        Write-Info "Última execução: $($task.LastRunTime)"
        Write-Info "Próxima execução: $($task.NextRunTime)"
    } else {
        Write-Warning "Tarefa não encontrada"
        Write-Info "Execute .\setup-docling-startup.ps1 para criar"
    }
    
    exit 0
}

# Remove tarefa
if ($Remove) {
    Write-Step "Removendo Tarefa de Inicialização"
    
    $task = Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue
    
    if ($task) {
        Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false
        Write-Success "Tarefa removida: $TaskName"
    } else {
        Write-Warning "Tarefa não encontrada"
    }
    
    exit 0
}

# Cria tarefa
Write-Step "Configurando Inicialização Automática do Docling"

# Verifica se já existe
$existingTask = Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue

if ($existingTask) {
    Write-Warning "Tarefa já existe: $TaskName"
    Write-Info "Removendo tarefa existente..."
    Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false
}

# Configura a ação
$pythonPath = (Get-Command python).Source
$action = New-ScheduledTaskAction -Execute $pythonPath -Argument "`"$PythonScript`" --port $Port" -WorkingDirectory $WorkspaceRoot

# Configura o trigger (no login)
$trigger = New-ScheduledTaskTrigger -AtLogOn

# Configura opções
$settings = New-ScheduledTaskSettingsSet `
    -AllowStartIfOnBatteries `
    -DontStopIfGoingOnBatteries `
    -StartWhenAvailable `
    -ExecutionTimeLimit (New-TimeSpan -Hours 0) `
    -RestartCount 3 `
    -RestartInterval (New-TimeSpan -Minutes 1)

# Registra a tarefa
try {
    Register-ScheduledTask `
        -TaskName $TaskName `
        -Action $action `
        -Trigger $trigger `
        -Settings $settings `
        -Description "Inicia o servidor HTTP do Docling automaticamente no login" `
        -RunLevel Highest `
        | Out-Null
    
    Write-Success "Tarefa criada com sucesso: $TaskName"
    Write-Info "O Docling iniciará automaticamente no próximo login"
    Write-Info "Porta: $Port"
    Write-Info "Script: $PythonScript"
    
    # Pergunta se quer iniciar agora
    Write-Host "`n" -NoNewline
    $startNow = Read-Host "Deseja iniciar o Docling agora? (S/n)"
    
    if ($startNow -ne 'n' -and $startNow -ne 'N') {
        Write-Info "Iniciando Docling..."
        Start-ScheduledTask -TaskName $TaskName
        Write-Success "Docling iniciado"
        Write-Info "Acesse: http://localhost:$Port"
        Write-Info "Documentação: http://localhost:$Port/docs"
    }
    
} catch {
    Write-Error-Custom "Falha ao criar tarefa: $_"
    exit 1
}

Write-Step "Configuração Concluída"

Write-Host @"

✅ Docling configurado para iniciar automaticamente!

📋 Detalhes:
   - Tarefa: $TaskName
   - Porta: $Port
   - Trigger: No login do usuário
   - Script: $PythonScript

🔧 Comandos úteis:
   - Ver status: .\setup-docling-startup.ps1 -Status
   - Remover: .\setup-docling-startup.ps1 -Remove
   - Iniciar manualmente: Start-ScheduledTask -TaskName "$TaskName"
   - Parar: Stop-ScheduledTask -TaskName "$TaskName"

🌐 Acesso:
   - API: http://localhost:$Port
   - Docs: http://localhost:$Port/docs
   - Health: http://localhost:$Port/health

"@ -ForegroundColor $Colors.Success

exit 0
