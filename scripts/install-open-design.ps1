#!/usr/bin/env pwsh
#Requires -Version 7.0

<#
.SYNOPSIS
    Instala e configura o Open Design a partir da última release do GitHub
    
.DESCRIPTION
    Este script baixa a última release do Open Design do GitHub,
    instala localmente e configura os modelos de imagem definidos no workspace.
    
.PARAMETER InstallDir
    Diretório de instalação (padrão: tools/open-design)
    
.PARAMETER Force
    Força reinstalação mesmo se já estiver instalado
    
.PARAMETER Version
    Versão específica para instalar (padrão: latest)
    
.EXAMPLE
    .\install-open-design.ps1
    
.EXAMPLE
    .\install-open-design.ps1 -InstallDir "C:\tools\open-design"
    
.EXAMPLE
    .\install-open-design.ps1 -Force
    
.EXAMPLE
    .\install-open-design.ps1 -Version "v1.2.3"
#>

[CmdletBinding()]
param(
    [string]$InstallDir = (Join-Path $PSScriptRoot '..\tools\open-design'),
    [switch]$Force,
    [string]$Version = "latest"
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

Write-Step "Instalação do Open Design (Release do GitHub)"

# Verifica se já está instalado
if ((Test-Path $InstallDir) -and (-not $Force)) {
    Write-Success "Open Design já está instalado em: $InstallDir"
    Write-Info "Use -Force para reinstalar"
    exit 0
}

# Cria diretório de instalação
$parentDir = Split-Path $InstallDir -Parent
if (-not (Test-Path $parentDir)) {
    Write-Info "Criando diretório: $parentDir"
    New-Item -ItemType Directory -Path $parentDir -Force | Out-Null
}

# Remove instalação anterior se Force
if ((Test-Path $InstallDir) -and $Force) {
    Write-Info "Removendo instalação anterior..."
    Remove-Item -Path $InstallDir -Recurse -Force
}

# Obtém informações da release do GitHub
Write-Step "Obtendo Última Release do GitHub"

$repoOwner = "opendesign-sh"
$repoName = "opendesign"
$apiUrl = if ($Version -eq "latest") {
    "https://api.github.com/repos/$repoOwner/$repoName/releases/latest"
} else {
    "https://api.github.com/repos/$repoOwner/$repoName/releases/tags/$Version"
}

Write-Info "Consultando API do GitHub..."

try {
    $release = Invoke-RestMethod -Uri $apiUrl -Method Get -Headers @{
        "Accept" = "application/vnd.github.v3+json"
        "User-Agent" = "WriteTextAmp-Bootstrap"
    }
    
    Write-Success "Release encontrada: $($release.tag_name)"
    Write-Info "Nome: $($release.name)"
    Write-Info "Publicada em: $($release.published_at)"
} catch {
    Write-Error-Custom "Falha ao obter release do GitHub: $_"
    Write-Info "Verifique sua conexão com internet e tente novamente"
    exit 1
}

# Encontra o asset apropriado para Windows
Write-Step "Selecionando Asset para Windows"

$windowsAsset = $release.assets | Where-Object { 
    $_.name -match '\.exe$|windows.*\.zip$|win.*\.zip$' 
} | Select-Object -First 1

if (-not $windowsAsset) {
    Write-Error-Custom "Nenhum asset para Windows encontrado na release"
    Write-Info "Assets disponíveis:"
    $release.assets | ForEach-Object { Write-Info "  - $($_.name)" }
    exit 1
}

Write-Success "Asset selecionado: $($windowsAsset.name)"
Write-Info "Tamanho: $([math]::Round($windowsAsset.size / 1MB, 2)) MB"

# Baixa o asset
Write-Step "Baixando Open Design"

$tempDir = Join-Path $env:TEMP "open-design-download"
$downloadPath = Join-Path $tempDir $windowsAsset.name

if (Test-Path $tempDir) {
    Remove-Item -Path $tempDir -Recurse -Force
}
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

Write-Info "Baixando de: $($windowsAsset.browser_download_url)"

try {
    Invoke-WebRequest -Uri $windowsAsset.browser_download_url -OutFile $downloadPath -UseBasicParsing
    Write-Success "Download concluído"
} catch {
    Write-Error-Custom "Falha ao baixar asset: $_"
    exit 1
}

# Extrai ou instala
Write-Step "Instalando Open Design"

New-Item -ItemType Directory -Path $InstallDir -Force | Out-Null

if ($windowsAsset.name -match '\.zip$') {
    Write-Info "Extraindo arquivo ZIP..."
    try {
        Expand-Archive -Path $downloadPath -DestinationPath $InstallDir -Force
        Write-Success "Arquivo extraído com sucesso"
    } catch {
        Write-Error-Custom "Falha ao extrair arquivo: $_"
        exit 1
    }
} elseif ($windowsAsset.name -match '\.exe$') {
    Write-Info "Copiando executável..."
    try {
        Copy-Item -Path $downloadPath -Destination $InstallDir -Force
        Write-Success "Executável copiado com sucesso"
    } catch {
        Write-Error-Custom "Falha ao copiar executável: $_"
        exit 1
    }
} else {
    Write-Error-Custom "Formato de arquivo não suportado: $($windowsAsset.name)"
    exit 1
}

# Limpa arquivos temporários
Write-Info "Limpando arquivos temporários..."
Remove-Item -Path $tempDir -Recurse -Force -ErrorAction SilentlyContinue

# Cria script de inicialização
Write-Step "Criando Scripts de Inicialização"

$startScript = Join-Path $InstallDir 'start.ps1'
@"
#!/usr/bin/env pwsh
# Script de inicialização do Open Design

Write-Host "🚀 Iniciando Open Design..." -ForegroundColor Cyan
Write-Host "🌐 Acesse: http://localhost:3333" -ForegroundColor Green
Write-Host "`nPressione Ctrl+C para parar`n" -ForegroundColor Yellow

# Verifica se é executável ou diretório
`$exePath = Get-ChildItem -Path "$InstallDir" -Filter "*.exe" -Recurse | Select-Object -First 1

if (`$exePath) {
    Write-Host "Executando: `$(`$exePath.FullName)" -ForegroundColor Gray
    & `$exePath.FullName
} else {
    # Tenta iniciar via npm se for projeto Node
    `$packageJson = Join-Path "$InstallDir" "package.json"
    if (Test-Path `$packageJson) {
        Push-Location "$InstallDir"
        npm start
        Pop-Location
    } else {
        Write-Error "Não foi possível encontrar executável ou package.json"
        exit 1
    }
}
"@ | Out-File -FilePath $startScript -Encoding UTF8

Write-Success "Script de inicialização criado: $startScript"

# Cria arquivo de configuração de modelos
Write-Step "Configurando Modelos de Imagem"

$configFile = Join-Path $InstallDir 'models.config.json'
@"
{
  "models": {
    "flux": {
      "enabled": true,
      "provider": "black-forest-labs",
      "api_key_env": "FLUX_API_KEY",
      "default_model": "flux-1.1-pro",
      "options": {
        "flux-1.1-pro": {
          "description": "Alta qualidade, rápido",
          "resolution": "1024x1024"
        },
        "flux-1.1-pro-ultra": {
          "description": "Ultra alta qualidade",
          "resolution": "2048x2048"
        },
        "flux-1.1-dev": {
          "description": "Modelo de desenvolvimento",
          "resolution": "1024x1024"
        }
      }
    },
    "pictify": {
      "enabled": true,
      "provider": "pictify",
      "api_key_env": "PICTIFY_API_KEY",
      "description": "Templates HTML para imagens"
    },
    "changeimageto": {
      "enabled": true,
      "provider": "changeimageto",
      "description": "Edição de imagem (16 ferramentas)"
    },
    "chompute": {
      "enabled": true,
      "provider": "chompute",
      "description": "Remoção de fundo"
    },
    "nano-banana": {
      "enabled": true,
      "provider": "nano-banana",
      "description": "Edição com Google Gemini"
    }
  },
  "defaults": {
    "image_generation": "flux",
    "image_editing": "changeimageto",
    "background_removal": "chompute"
  }
}
"@ | Out-File -FilePath $configFile -Encoding UTF8

Write-Success "Configuração de modelos criada: $configFile"

# Cria documentação
Write-Step "Criando Documentação"

$readmeFile = Join-Path $InstallDir 'README-USO.md'
@"
# Open Design - Guia de Uso

## ℹ️ Informações da Instalação

- **Versão instalada:** $($release.tag_name)
- **Data de instalação:** $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
- **Diretório:** $InstallDir

## 🚀 Iniciar o Open Design

### PowerShell
````powershell
cd $InstallDir
.\start.ps1
````

## 🌐 Acessar

Após iniciar, acesse: **http://localhost:3333**

## 🎨 Modelos de Imagem Configurados

### FLUX (Black Forest Labs)
- **flux-1.1-pro**: Alta qualidade, rápido (1024x1024)
- **flux-1.1-pro-ultra**: Ultra alta qualidade (2048x2048)
- **flux-1.1-dev**: Modelo de desenvolvimento (1024x1024)

**Requer:** FLUX_API_KEY no arquivo .env

### Pictify
- Templates HTML para imagens
- Ideal para banners, social media cards

**Requer:** PICTIFY_API_KEY no arquivo .env

### ChangeImageTo
- 16 ferramentas de edição
- Resize, crop, upscale, denoise, OCR, etc.

### Chompute
- Remoção de fundo automática

### Nano Banana
- Edição de imagem com Google Gemini

## 📝 Configurar API Keys

Edite o arquivo `.env` na raiz do workspace:

````env
FLUX_API_KEY=sua_chave_aqui
PICTIFY_API_KEY=sua_chave_aqui
````

## 🔧 Configuração Avançada

Edite `models.config.json` para:
- Habilitar/desabilitar modelos
- Alterar modelos padrão
- Configurar resoluções

## 🔄 Atualizar para Nova Versão

````powershell
# Baixa e instala a última release
.\scripts\install-open-design.ps1 -Force

# Ou instala versão específica
.\scripts\install-open-design.ps1 -Version "v1.2.3" -Force
````

## 🆘 Troubleshooting

### Porta 3333 já está em uso
````powershell
# Mate o processo na porta 3333
Get-NetTCPConnection -LocalPort 3333 | Select-Object -ExpandProperty OwningProcess | ForEach-Object { Stop-Process -Id `$_ -Force }
````

### Erro de permissão
````powershell
# Execute como Administrador
# Ou ajuste permissões:
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
````

### Executável não encontrado
````powershell
# Reinstale
.\scripts\install-open-design.ps1 -Force
````
"@ | Out-File -FilePath $readmeFile -Encoding UTF8

Write-Success "Documentação criada: $readmeFile"

# Sucesso
Write-Step "Instalação Concluída"

Write-Host @"

✅ Open Design instalado com sucesso!

📦 Versão: $($release.tag_name)
📁 Localização: $InstallDir
🚀 Iniciar: .\start.ps1 (dentro do diretório)
🌐 URL: http://localhost:3333

📚 Documentação: $readmeFile

⚠️  Lembre-se de configurar as API keys no arquivo .env:
   - FLUX_API_KEY
   - PICTIFY_API_KEY

"@ -ForegroundColor $Colors.Success

exit 0
