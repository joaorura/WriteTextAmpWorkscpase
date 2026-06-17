#!/usr/bin/env pwsh
#Requires -Version 7.0

<#
.SYNOPSIS
    Bootstrap script para WriteTextAmp Workspace
    
.DESCRIPTION
    Este script configura completamente o workspace de marketing:
    1. Verifica e instala prerequisites (Node.js, Python, Git)
    2. Instala OpenCode CLI
    3. Configura MCPs via GUI interativa
    4. Instala dependências
    5. Inicializa repositório git
    6. Valida instalação completa
    
.PARAMETER SkipGUI
    Pula a GUI de configuração (usa valores padrão)
    
.PARAMETER Force
    Força reinstalação mesmo se já estiver configurado
    
.EXAMPLE
    .\bootstrap.ps1
    
.EXAMPLE
    .\bootstrap.ps1 -SkipGUI
    
.EXAMPLE
    .\bootstrap.ps1 -Force
#>

[CmdletBinding()]
param(
    [switch]$SkipGUI,
    [switch]$Force
)

$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

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

function Test-Command {
    param([string]$Command)
    $null -ne (Get-Command $Command -ErrorAction SilentlyContinue)
}

function Install-Chocolatey {
    Write-Step "Instalando Chocolatey (Package Manager)"
    
    if (Test-Command 'choco') {
        Write-Success "Chocolatey já está instalado"
        return
    }
    
    Write-Info "Instalando Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    
    if (Test-Command 'choco') {
        Write-Success "Chocolatey instalado com sucesso"
    } else {
        throw "Falha ao instalar Chocolatey"
    }
}

function Install-NodeJS {
    Write-Step "Verificando Node.js"
    
    if (Test-Command 'node') {
        $version = node --version
        Write-Success "Node.js já está instalado ($version)"
        return
    }
    
    Write-Info "Instalando Node.js LTS..."
    choco install nodejs-lts -y
    
    if (Test-Command 'node') {
        $version = node --version
        Write-Success "Node.js $version instalado com sucesso"
    } else {
        throw "Falha ao instalar Node.js"
    }
}

function Install-Python {
    Write-Step "Verificando Python"
    
    if (Test-Command 'python') {
        $version = python --version
        Write-Success "Python já está instalado ($version)"
        return
    }
    
    Write-Info "Instalando Python..."
    choco install python -y
    
    if (Test-Command 'python') {
        $version = python --version
        Write-Success "Python $version instalado com sucesso"
    } else {
        throw "Falha ao instalar Python"
    }
}

function Install-Git {
    Write-Step "Verificando Git"
    
    if (Test-Command 'git') {
        $version = git --version
        Write-Success "Git já está instalado ($version)"
        return
    }
    
    Write-Info "Instalando Git..."
    choco install git -y
    
    if (Test-Command 'git') {
        $version = git --version
        Write-Success "Git $version instalado com sucesso"
    } else {
        throw "Falha ao instalar Git"
    }
}

function Install-OpenCode {
    Write-Step "Verificando OpenCode CLI"
    
    if (Test-Command 'opencode') {
        $version = opencode --version
        Write-Success "OpenCode CLI já está instalado ($version)"
        return
    }
    
    Write-Info "Instalando OpenCode CLI..."
    npm install -g opencode-ai
    
    if (Test-Command 'opencode') {
        $version = opencode --version
        Write-Success "OpenCode CLI $version instalado com sucesso"
    } else {
        throw "Falha ao instalar OpenCode CLI"
    }
}

function Initialize-Configuration {
    Write-Step "Configurando Workspace"
    
    $envFile = Join-Path $PSScriptRoot '.env'
    $envTemplate = Join-Path $PSScriptRoot '.env.template'
    
    if ((Test-Path $envFile) -and (-not $Force)) {
        Write-Success "Arquivo .env já existe"
        return
    }
    
    if (-not (Test-Path $envTemplate)) {
        throw "Template .env.template não encontrado"
    }
    
    if ($SkipGUI) {
        Write-Info "Copiando .env.template para .env (modo sem GUI)"
        Copy-Item $envTemplate $envFile -Force
        Write-Success "Arquivo .env criado (configure manualmente depois)"
    } else {
        Write-Info "Executando GUI de configuração..."
        $guiScript = Join-Path $PSScriptRoot 'scripts\configure-gui.py'
        
        if (-not (Test-Path $guiScript)) {
            throw "Script configure-gui.py não encontrado"
        }
        
        python $guiScript
        
        if (Test-Path $envFile) {
            Write-Success "Configuração concluída via GUI"
        } else {
            throw "GUI não criou arquivo .env"
        }
    }
}

function Install-Dependencies {
    Write-Step "Instalando Dependências"
    
    $setupScript = Join-Path $PSScriptRoot 'scripts\setup.ps1'
    
    if (-not (Test-Path $setupScript)) {
        throw "Script setup.ps1 não encontrado"
    }
    
    Write-Info "Executando setup.ps1..."
    & $setupScript
    
    Write-Success "Dependências instaladas"
}

function Initialize-Git {
    Write-Step "Inicializando Repositório Git"
    
    $gitDir = Join-Path $PSScriptRoot '.git'
    
    if (Test-Path $gitDir) {
        Write-Success "Repositório git já inicializado"
        return
    }
    
    Write-Info "Inicializando repositório git..."
    Push-Location $PSScriptRoot
    
    try {
        git init
        git add .
        git commit -m "bootstrap: inicialização do workspace"
        Write-Success "Repositório git inicializado"
    } finally {
        Pop-Location
    }
}

function Test-Installation {
    Write-Step "Validando Instalação"
    
    $checks = @(
        @{ Name = 'Node.js'; Command = 'node' },
        @{ Name = 'Python'; Command = 'python' },
        @{ Name = 'Git'; Command = 'git' },
        @{ Name = 'OpenCode CLI'; Command = 'opencode' }
    )
    
    $allPassed = $true
    
    foreach ($check in $checks) {
        if (Test-Command $check.Command) {
            Write-Success "$($check.Name) instalado"
        } else {
            Write-Error-Custom "$($check.Name) não encontrado"
            $allPassed = $false
        }
    }
    
    $requiredFiles = @(
        '.env',
        'opencode.jsonc',
        '.opencode/agents/marketing-orchestrator.agent.md',
        '.opencode/instructions/using-marketing-workspace.instructions.md',
        'projetos/_modelo/PROJETO.md'
    )
    
    foreach ($file in $requiredFiles) {
        $path = Join-Path $PSScriptRoot $file
        if (Test-Path $path) {
            Write-Success "Arquivo $file existe"
        } else {
            Write-Error-Custom "Arquivo $file não encontrado"
            $allPassed = $false
        }
    }
    
    if ($allPassed) {
        Write-Success "Todas as validações passaram!"
        return $true
    } else {
        Write-Error-Custom "Algumas validações falharam"
        return $false
    }
}

function Show-NextSteps {
    Write-Step "Próximos Passos"
    
    Write-Host @"

🎉 Bootstrap concluído com sucesso!

Próximos passos:

1. Crie seu primeiro projeto:
   Copy-Item -Path "projetos\_modelo" -Destination "projetos\meu-projeto" -Recurse

2. Entre no diretório do projeto:
   cd projetos\meu-projeto

3. Inicie o OpenCode:
   opencode

4. Comece a criar conteúdo:
   @marketing-orchestrator "Preciso de uma campanha de lançamento"

Documentação:
- README.md - Visão geral
- WORKSPACE.md - Guia completo
- docs/USER-GUIDE.md - Guia do usuário
- docs/ORCHESTRATOR-GUIDE.md - Guia do orquestrador

"@ -ForegroundColor $Colors.Info
}

# Main execution
try {
    Write-Host @"

╔═══════════════════════════════════════════════════════════════╗
║                                                               ║
║   WriteTextAmp Workspace - Bootstrap                          ║
║   Marketing Content Studio                                    ║
║                                                               ║
╚═══════════════════════════════════════════════════════════════╝

"@ -ForegroundColor $Colors.Header

    # Verifica se está executando como administrador (necessário para Chocolatey)
    $isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
    
    if (-not $isAdmin) {
        Write-Warning "Este script precisa ser executado como Administrador para instalar dependências"
        Write-Info "Clique com botão direito no PowerShell e selecione 'Executar como Administrador'"
        exit 1
    }

    # Instala prerequisites
    Install-Chocolatey
    Install-NodeJS
    Install-Python
    Install-Git
    Install-OpenCode

    # Configura workspace
    Initialize-Configuration
    Install-Dependencies
    Initialize-Git

    # Valida instalação
    $success = Test-Installation

    if ($success) {
        Show-NextSteps
        
        # Cria arquivo de marcação
        $bootstrapFile = Join-Path $PSScriptRoot '.bootstrap-complete'
        Get-Date | Out-File $bootstrapFile
        
        exit 0
    } else {
        Write-Error-Custom "Bootstrap falhou. Verifique os erros acima."
        exit 1
    }
}
catch {
    Write-Error-Custom "Erro durante bootstrap: $_"
    Write-Host $_.ScriptStackTrace -ForegroundColor $Colors.Error
    exit 1
}
