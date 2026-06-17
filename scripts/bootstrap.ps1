#Requires -Version 5.1
<#
.SYNOPSIS
    WriteTextAmp Workspace — Bootstrap Script (Unificado)

.DESCRIPTION
    Script unificado de bootstrap que orquestra todo o processo de instalação:
    1. Verifica prerequisites (Node.js, Python, Git, OpenCode)
    2. Executa configuração interativa (GUI ou CLI)
    3. Instala dependências e MCPs
    4. Inicializa git (se não inicializado)
    5. Valida instalação completa
    
    Este é o PONTO DE ENTRADA ÚNICO para instalação do workspace.

.PARAMETER UseCLI
    Usa configuração CLI em vez de GUI (para ambientes sem display)

.PARAMETER SkipOpenDesign
    Pula instalação do Open Design (mesmo se habilitado no .env)

.PARAMETER Force
    Força reinstalação de todos os componentes

.PARAMETER SkipValidation
    Pula validação final (não recomendado)

.EXAMPLE
    .\bootstrap.ps1
    Executa bootstrap completo com GUI

.EXAMPLE
    .\bootstrap.ps1 -UseCLI
    Executa bootstrap com configuração CLI

.EXAMPLE
    .\bootstrap.ps1 -SkipOpenDesign
    Executa bootstrap sem instalar Open Design
#>

[CmdletBinding()]
param(
    [switch]$UseCLI,
    [switch]$SkipOpenDesign,
    [switch]$Force,
    [switch]$SkipValidation
)

$ErrorActionPreference = 'Stop'
$WorkspaceRoot = $PSScriptRoot | Split-Path -Parent

# ═══════════════════════════════════════════════════════════════
# Helper Functions
# ═══════════════════════════════════════════════════════════════

function Write-BootstrapHeader {
    Write-Host "`n" -NoNewline
    Write-Host ("=" * 70) -ForegroundColor Cyan
    Write-Host "  WriteTextAmp Workspace — Bootstrap" -ForegroundColor Cyan
    Write-Host ("=" * 70) -ForegroundColor Cyan
    Write-Host "  Workspace Root: $WorkspaceRoot" -ForegroundColor Gray
    Write-Host ("=" * 70) -ForegroundColor Cyan
    Write-Host "`n" -NoNewline
}

function Write-Step {
    param(
        [int]$Step,
        [string]$Title,
        [string]$Description
    )
    Write-Host "`n" -NoNewline
    Write-Host "  [$Step/5] " -ForegroundColor Yellow -NoNewline
    Write-Host $Title -ForegroundColor Yellow
    Write-Host "  $Description" -ForegroundColor Gray
    Write-Host ("  " + ("─" * 66)) -ForegroundColor Gray
}

function Write-Success {
    param([string]$Message)
    Write-Host "  ✓ " -ForegroundColor Green -NoNewline
    Write-Host $Message
}

function Write-Warning {
    param([string]$Message)
    Write-Host "  ⚠ " -ForegroundColor Yellow -NoNewline
    Write-Host $Message
}

function Write-Error-Custom {
    param([string]$Message)
    Write-Host "  ✗ " -ForegroundColor Red -NoNewline
    Write-Host $Message
}

function Test-Command {
    param([string]$Command)
    $null -ne (Get-Command $Command -ErrorAction SilentlyContinue)
}

function Get-CommandVersion {
    param([string]$Command)
    try {
        $version = & $Command --version 2>$null
        if ($version) {
            return $version.Trim()
        }
    } catch {
        return $null
    }
    return $null
}

# ═══════════════════════════════════════════════════════════════
# Step 1: Verify Prerequisites
# ═══════════════════════════════════════════════════════════════

function Test-Prerequisites {
    Write-Step 1 "Verificando Prerequisites" "Checando Node.js, Python e Git"
    
    $allGood = $true
    $missing = @()
    
    # Node.js (obrigatório)
    if (Test-Command 'node') {
        $nodeVersion = Get-CommandVersion 'node'
        Write-Success "Node.js instalado ($nodeVersion)"
    } else {
        Write-Error-Custom "Node.js não encontrado (OBRIGATÓRIO)"
        Write-Host "      → Instale em: https://nodejs.org/" -ForegroundColor Gray
        $allGood = $false
        $missing += "Node.js"
    }
    
    # npm (obrigatório)
    if (Test-Command 'npm') {
        $npmVersion = Get-CommandVersion 'npm'
        Write-Success "npm instalado (v$npmVersion)"
    } else {
        Write-Error-Custom "npm não encontrado (OBRIGATÓRIO)"
        $allGood = $false
        $missing += "npm"
    }
    
    # Python (opcional, mas recomendado)
    if (Test-Command 'python') {
        $pythonVersion = Get-CommandVersion 'python'
        Write-Success "Python instalado ($pythonVersion)"
    } elseif (Test-Command 'python3') {
        $pythonVersion = Get-CommandVersion 'python3'
        Write-Success "Python instalado ($pythonVersion)"
    } else {
        Write-Warning "Python não encontrado (opcional, mas recomendado para GUI)"
        Write-Host "      → Instale em: https://www.python.org/" -ForegroundColor Gray
    }
    
    # Git (opcional, mas recomendado)
    if (Test-Command 'git') {
        $gitVersion = Get-CommandVersion 'git'
        Write-Success "Git instalado ($gitVersion)"
    } else {
        Write-Warning "Git não encontrado (opcional, mas recomendado para versionamento)"
        Write-Host "      → Instale em: https://git-scm.com/" -ForegroundColor Gray
    }
    
    # Nota: OpenCode CLI deve ser instalado ANTES de executar o bootstrap
    # Ver documentação: .opencode/instructions/installation-guide.instructions.md
    
    if (-not $allGood) {
        Write-Host "`n" -NoNewline
        Write-Error-Custom "Prerequisites obrigatórios faltando: $($missing -join ', ')"
        Write-Host "  Por favor, instale os componentes acima e execute o bootstrap novamente." -ForegroundColor Red
        Write-Host "`n" -NoNewline
        exit 1
    }
    
    Write-Success "Todos os prerequisites obrigatórios estão instalados"
    Write-Host "  ℹ OpenCode CLI deve ser instalado separadamente (veja installation-guide.instructions.md)" -ForegroundColor Cyan
}

# ═══════════════════════════════════════════════════════════════
# Step 2: Configure Workspace
# ═══════════════════════════════════════════════════════════════

function Invoke-Configuration {
    Write-Step 2 "Configurando Workspace" "Selecionando MCPs e preenchendo API keys"
    
    $envPath = Join-Path $WorkspaceRoot ".env"
    $envTemplatePath = Join-Path $WorkspaceRoot ".env.template"
    
    # Verifica se .env já existe
    if ((Test-Path $envPath) -and -not $Force) {
        Write-Success "Arquivo .env já existe"
        $reconfigure = Read-Host "  Deseja reconfigurar? (s/N)"
        if ($reconfigure -notmatch '^[sSyY]') {
            Write-Host "  Mantendo configuração existente" -ForegroundColor Gray
            return
        }
    }
    
    # Copia template se .env não existe
    if (-not (Test-Path $envPath)) {
        if (Test-Path $envTemplatePath) {
            Copy-Item -Path $envTemplatePath -Destination $envPath
            Write-Success "Arquivo .env criado a partir do template"
        } else {
            Write-Error-Custom "Template .env.template não encontrado"
            exit 1
        }
    }
    
    # Executa configuração
    if ($UseCLI) {
        # Configuração CLI
        $configureScript = Join-Path $PSScriptRoot "configure.py"
        if (Test-Path $configureScript) {
            Write-Host "  Executando configuração CLI..." -ForegroundColor Gray
            python $configureScript
        } else {
            Write-Warning "Script configure.py não encontrado"
            Write-Host "  Editando .env manualmente..." -ForegroundColor Gray
            notepad $envPath
        }
    } else {
        # Configuração GUI
        $guiScript = Join-Path $PSScriptRoot "configure-gui.py"
        if (Test-Path $guiScript) {
            Write-Host "  Executando GUI de configuração..." -ForegroundColor Gray
            python $guiScript
        } else {
            Write-Warning "Script configure-gui.py não encontrado"
            Write-Host "  Editando .env manualmente..." -ForegroundColor Gray
            notepad $envPath
        }
    }
    
    Write-Success "Configuração concluída"
}

# ═══════════════════════════════════════════════════════════════
# Step 3: Install Dependencies
# ═══════════════════════════════════════════════════════════════

function Install-Dependencies {
    Write-Step 3 "Instalando Dependências" "Executando setup.ps1 para instalar MCPs e ferramentas"
    
    $setupScript = Join-Path $PSScriptRoot "setup.ps1"
    
    if (-not (Test-Path $setupScript)) {
        Write-Error-Custom "Script setup.ps1 não encontrado"
        exit 1
    }
    
    $setupArgs = @()
    if ($SkipOpenDesign) {
        $setupArgs += "-SkipOpenDesign"
    }
    if ($Force) {
        $setupArgs += "-Force"
    }
    
    Write-Host "  Executando: setup.ps1 $($setupArgs -join ' ')" -ForegroundColor Gray
    & $setupScript @setupArgs
    
    if ($LASTEXITCODE -ne 0) {
        Write-Error-Custom "Setup falhou com código $LASTEXITCODE"
        exit 1
    }
    
    Write-Success "Dependências instaladas com sucesso"
}

# ═══════════════════════════════════════════════════════════════
# Step 4: Initialize Git
# ═══════════════════════════════════════════════════════════════

function Initialize-GitRepository {
    Write-Step 4 "Inicializando Git" "Configurando repositório local para versionamento"
    
    if (-not (Test-Command 'git')) {
        Write-Warning "Git não instalado, pulando inicialização"
        return
    }
    
    $gitDir = Join-Path $WorkspaceRoot ".git"
    
    if (Test-Path $gitDir) {
        Write-Success "Repositório git já inicializado"
        return
    }
    
    Write-Host "  Inicializando repositório git..." -ForegroundColor Gray
    Push-Location $WorkspaceRoot
    try {
        git init | Out-Null
        git add . | Out-Null
        git commit -m "bootstrap: inicialização do workspace" | Out-Null
        Write-Success "Repositório git inicializado com commit inicial"
    } catch {
        Write-Warning "Falha ao inicializar git: $_"
    } finally {
        Pop-Location
    }
}

# ═══════════════════════════════════════════════════════════════
# Step 5: Validate Installation
# ═══════════════════════════════════════════════════════════════

function Install-Docling {
    Write-Step "Instalando Docling"
    
    if (Test-Command 'docling-serve') {
        Write-Success "Docling já está instalado"
        return
    }
    
    Write-Info "Instalando docling-serve..."
    pip install docling-serve
    
    if (Test-Command 'docling-serve') {
        Write-Success "Docling instalado com sucesso"
    } else {
        Write-Warning "Falha ao instalar Docling (opcional)"
    }
}

function Setup-DoclingStartup {
    Write-Step "Configurando Inicialização Automática do Docling"
    
    $setupScript = Join-Path $PSScriptRoot "setup-docling-startup.ps1"
    
    if (-not (Test-Path $setupScript)) {
        Write-Warning "Script setup-docling-startup.ps1 não encontrado"
        return
    }
    
    Write-Info "Configurando Docling para iniciar no login..."
    
    try {
        & $setupScript -Port 8000
        Write-Success "Docling configurado para iniciar automaticamente"
    } catch {
        Write-Warning "Falha ao configurar inicialização automática: $_"
    }
}

function Install-OpenDesign {
    Write-Step "Instalando Open Design"
    
    $installScript = Join-Path $PSScriptRoot "install-open-design.ps1"
    
    if (-not (Test-Path $installScript)) {
        Write-Warning "Script install-open-design.ps1 não encontrado"
        return
    }
    
    Write-Info "Instalando Open Design..."
    
    try {
        & $installScript
        Write-Success "Open Design instalado com sucesso"
    } catch {
        Write-Warning "Falha ao instalar Open Design: $_"
    }
}

function Test-Installation {
    if ($SkipValidation) {
        Write-Step 5 "Validando Instalação" "Validação pulada (-SkipValidation)"
        return
    }
    
    Write-Step 5 "Validando Instalação" "Verificando se todos os componentes estão funcionais"
    
    $allGood = $true
    
    # Verifica .env
    $envPath = Join-Path $WorkspaceRoot ".env"
    if (Test-Path $envPath) {
        Write-Success "Arquivo .env existe"
    } else {
        Write-Error-Custom "Arquivo .env não encontrado"
        $allGood = $false
    }
    
    # Verifica opencode.jsonc
    $configPath = Join-Path $WorkspaceRoot "opencode.jsonc"
    if (Test-Path $configPath) {
        Write-Success "Arquivo opencode.jsonc existe"
    } else {
        Write-Error-Custom "Arquivo opencode.jsonc não encontrado"
        $allGood = $false
    }
    
    # Verifica diretórios críticos
    $criticalDirs = @(
        ".opencode/agents",
        ".opencode/skills",
        ".opencode/instructions",
        "projetos/_modelo",
        "_templates"
    )
    
    foreach ($dir in $criticalDirs) {
        $dirPath = Join-Path $WorkspaceRoot $dir
        if (Test-Path $dirPath) {
            Write-Success "Diretório $dir existe"
        } else {
            Write-Error-Custom "Diretório $dir não encontrado"
            $allGood = $false
        }
    }
    
    # Verifica Open Design (se habilitado)
    $envContent = Get-Content $envPath -Raw
    if ($envContent -match 'OPEN_DESIGN_ENABLED=true') {
        $openDesignPath = Join-Path $WorkspaceRoot "tools/open-design"
        if (Test-Path $openDesignPath) {
            Write-Success "Open Design instalado"
        } else {
            Write-Warning "Open Design habilitado mas não instalado"
        }
    }
    
    if (-not $allGood) {
        Write-Host "`n" -NoNewline
        Write-Error-Custom "Validação falhou. Alguns componentes estão faltando."
        Write-Host "  Execute o bootstrap novamente com -Force para reinstalar." -ForegroundColor Yellow
        Write-Host "`n" -NoNewline
        exit 1
    }
    
    Write-Success "Todos os componentes validados com sucesso"
}

function Show-CostsInfo {
    Write-Step "Informações sobre Custos e Contas"
    
    Write-Host @"

╔═══════════════════════════════════════════════════════════════╗
║  💰 INFORMAÇÕES IMPORTANTES SOBRE CUSTOS                      ║
╚═══════════════════════════════════════════════════════════════╝

✅ SERVIÇOS 100% GRATUITOS (sem conta):
   • document-generator - Geração de Word/PDF
   • pdf-toolkit - Operações avançadas em PDF
   • Docling - Processamento de documentos
   • Open Design - Prototipagem visual local

⚠️  SERVIÇOS COM FREE TIER (precisa criar conta grátis):
   • FLUX - ~100 imagens/mês
   • Pictify - 50 renders/mês
   • ChangeImageTo - 100 operações/mês
   • Chompute - 50 imagens/mês
   • Nano Banana - 100 edições/mês
   • Brave Search - 2000 queries/mês

✅ SERVIÇOS GRATUITOS COM OAUTH (conta que você já tem):
   • LinkedIn, Instagram, Facebook
   • Google Drive, Slack

📚 DOCUMENTAÇÃO COMPLETA SOBRE CUSTOS:
   docs/COSTS-AND-ACCOUNTS.md

💡 Você pode usar o workspace 100% GRÁTIS!

"@ -ForegroundColor $Colors.Info
}

# ═══════════════════════════════════════════════════════════════
# Main Bootstrap Flow
# ═══════════════════════════════════════════════════════════════

try {
    Write-BootstrapHeader
    
    Show-CostsInfo
    Test-Prerequisites
    Invoke-Configuration
    Install-Dependencies
    Install-Docling
    Setup-DoclingStartup
    Install-OpenDesign
    Initialize-GitRepository
    Test-Installation
    
    # Success message
    Write-Host "`n" -NoNewline
    Write-Host ("=" * 70) -ForegroundColor Green
    Write-Host "  Bootstrap Concluído com Sucesso!" -ForegroundColor Green
    Write-Host ("=" * 70) -ForegroundColor Green
    Write-Host "`n" -NoNewline
    Write-Host "  Próximos passos:" -ForegroundColor Cyan
    Write-Host "    1. Crie seu primeiro projeto:" -ForegroundColor White
    Write-Host "       Copy-Item -Path 'projetos\_modelo' -Destination 'projetos\meu-projeto' -Recurse" -ForegroundColor Gray
    Write-Host "`n" -NoNewline
    Write-Host "    2. Entre no diretório do projeto:" -ForegroundColor White
    Write-Host "       cd projetos\meu-projeto" -ForegroundColor Gray
    Write-Host "`n" -NoNewline
    Write-Host "    3. Inicie o OpenCode:" -ForegroundColor White
    Write-Host "       opencode" -ForegroundColor Gray
    Write-Host "`n" -NoNewline
    Write-Host "    4. Comece a criar conteúdo:" -ForegroundColor White
    Write-Host "       @marketing-orchestrator 'Preciso de uma campanha de lançamento'" -ForegroundColor Gray
    Write-Host "`n" -NoNewline
    Write-Host ("=" * 70) -ForegroundColor Green
    Write-Host "`n" -NoNewline
    
} catch {
    Write-Host "`n" -NoNewline
    Write-Error-Custom "Bootstrap falhou: $_"
    Write-Host "`n" -NoNewline
    Write-Host "  Para troubleshooting:" -ForegroundColor Yellow
    Write-Host "    - Verifique se todos os prerequisites estão instalados" -ForegroundColor Gray
    Write-Host "    - Execute novamente com -Force para reinstalar" -ForegroundColor Gray
    Write-Host "    - Consulte QUICKSTART.md para instalação manual" -ForegroundColor Gray
    Write-Host "`n" -NoNewline
    exit 1
}
