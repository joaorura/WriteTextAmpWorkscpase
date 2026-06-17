#Requires -Version 5.1
<#
.SYNOPSIS
    WriteTextAmp Workspace — Automated Setup Script

.DESCRIPTION
    Installs and configures the WriteTextAmp Marketing Content Studio workspace.
    - Checks prerequisites (Node.js, Python)
    - Installs Open Design (optional)
    - Configures MCP services based on .env
    - Validates installation

.PARAMETER SkipOpenDesign
    Skip Open Design installation

.PARAMETER Force
    Force reinstallation of components

.EXAMPLE
    .\scripts\setup.ps1
    
.EXAMPLE
    .\scripts\setup.ps1 -SkipOpenDesign
    
.EXAMPLE
    .\scripts\setup.ps1 -Force
#>

[CmdletBinding()]
param(
    [switch]$SkipOpenDesign,
    [switch]$Force
)

$ErrorActionPreference = 'Stop'

# ═══════════════════════════════════════════════════════════════
# Helper Functions
# ═══════════════════════════════════════════════════════════════

function Write-Header {
    Write-Host "`n" -NoNewline
    Write-Host ("=" * 60) -ForegroundColor Cyan
    Write-Host "  WriteTextAmp Workspace — Setup" -ForegroundColor Cyan
    Write-Host ("=" * 60) -ForegroundColor Cyan
    Write-Host "`n" -NoNewline
}

function Write-Section {
    param([string]$Title)
    Write-Host "`n" -NoNewline
    Write-Host ("─" * 60) -ForegroundColor Gray
    Write-Host "  $Title" -ForegroundColor Yellow
    Write-Host ("─" * 60) -ForegroundColor Gray
    Write-Host "`n" -NoNewline
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

function Write-Error {
    param([string]$Message)
    Write-Host "  ✗ " -ForegroundColor Red -NoNewline
    Write-Host $Message
}

function Test-Command {
    param([string]$Command)
    $null -ne (Get-Command $Command -ErrorAction SilentlyContinue)
}

function Read-EnvFile {
    param([string]$Path)
    
    $envVars = @{}
    
    if (Test-Path $Path) {
        Get-Content $Path | ForEach-Object {
            $line = $_.Trim()
            if ($line -and -not $line.StartsWith('#') -and $line.Contains('=')) {
                $parts = $line -split '=', 2
                if ($parts.Count -eq 2) {
                    $envVars[$parts[0].Trim()] = $parts[1].Trim()
                }
            }
        }
    }
    
    return $envVars
}

# ═══════════════════════════════════════════════════════════════
# Prerequisites Check
# ═══════════════════════════════════════════════════════════════

function Test-Prerequisites {
    Write-Section "Checking Prerequisites"
    
    $allGood = $true
    
    # Node.js
    if (Test-Command 'node') {
        $nodeVersion = node --version
        Write-Success "Node.js installed ($nodeVersion)"
    } else {
        Write-Error "Node.js not found"
        Write-Host "      Install from: https://nodejs.org/"
        $allGood = $false
    }
    
    # npm
    if (Test-Command 'npm') {
        $npmVersion = npm --version
        Write-Success "npm installed (v$npmVersion)"
    } else {
        Write-Error "npm not found"
        $allGood = $false
    }
    
    # Python
    if (Test-Command 'python') {
        $pythonVersion = python --version
        Write-Success "Python installed ($pythonVersion)"
    } elseif (Test-Command 'python3') {
        $pythonVersion = python3 --version
        Write-Success "Python installed ($pythonVersion)"
    } else {
        Write-Warning "Python not found (optional, for configuration script)"
    }
    
    # Git
    if (Test-Command 'git') {
        $gitVersion = git --version
        Write-Success "Git installed ($gitVersion)"
    } else {
        Write-Warning "Git not found (optional, for Open Design)"
    }
    
    return $allGood
}

# ═══════════════════════════════════════════════════════════════
# Open Design Installation
# ═══════════════════════════════════════════════════════════════

function Install-OpenDesign {
    param([switch]$Force)
    
    Write-Section "Open Design Installation"
    
    $openDesignPath = Join-Path $PSScriptRoot "..\tools\open-design"
    
    if ((Test-Path $openDesignPath) -and -not $Force) {
        Write-Success "Open Design already installed at: $openDesignPath"
        return
    }
    
    Write-Host "  Installing Open Design from GitHub..."
    Write-Host "  Repository: https://github.com/nexu-io/open-design"
    Write-Host ""
    
    # Create tools directory
    $toolsDir = Join-Path $PSScriptRoot "..\tools"
    if (-not (Test-Path $toolsDir)) {
        New-Item -ItemType Directory -Path $toolsDir -Force | Out-Null
    }
    
    # Clone repository
    try {
        if (Test-Path $openDesignPath) {
            Remove-Item -Path $openDesignPath -Recurse -Force
        }
        
        Write-Host "  Cloning repository..."
        git clone https://github.com/nexu-io/open-design.git $openDesignPath
        
        if ($LASTEXITCODE -ne 0) {
            throw "Git clone failed"
        }
        
        Write-Success "Repository cloned"
        
        # Install dependencies
        Write-Host "  Installing dependencies (this may take a few minutes)..."
        Push-Location $openDesignPath
        try {
            npm install
            
            if ($LASTEXITCODE -ne 0) {
                throw "npm install failed"
            }
            
            Write-Success "Dependencies installed"
        } finally {
            Pop-Location
        }
        
        Write-Host ""
        Write-Success "Open Design installed successfully!"
        Write-Host ""
        Write-Host "  To start Open Design:"
        Write-Host "    cd $openDesignPath"
        Write-Host "    npm start"
        Write-Host ""
        
    } catch {
        Write-Error "Failed to install Open Design: $_"
        Write-Host ""
        Write-Host "  Manual installation:"
        Write-Host "    1. git clone https://github.com/nexu-io/open-design"
        Write-Host "    2. cd open-design"
        Write-Host "    3. npm install"
        Write-Host "    4. npm start"
        Write-Host ""
    }
}

# ═══════════════════════════════════════════════════════════════
# MCP Configuration
# ═══════════════════════════════════════════════════════════════

function Update-OpenCodeConfig {
    param([hashtable]$EnvVars)
    
    Write-Section "Updating OpenCode Configuration"
    
    $configPath = Join-Path $PSScriptRoot "..\opencode.jsonc"
    
    if (-not (Test-Path $configPath)) {
        Write-Error "opencode.jsonc not found"
        return
    }
    
    Write-Host "  Reading configuration from: $configPath"
    
    # Read current config
    $config = Get-Content $configPath -Raw
    
    # Update FLUX
    if ($EnvVars['FLUX_ENABLED'] -eq 'true') {
        $config = $config -replace '"flux":\s*\{[^}]*"enabled":\s*false', '"flux": { "type": "remote", "url": "https://mcp.bfl.ai", "enabled": true'
        Write-Success "FLUX enabled in config"
    }
    
    # Update Pictify
    if ($EnvVars['PICTIFY_ENABLED'] -eq 'true' -and $EnvVars['PICTIFY_API_KEY']) {
        $config = $config -replace '"pictify":\s*\{[^}]*"enabled":\s*false', '"pictify": { "type": "local", "command": "npx", "args": ["-y", "@pictify/mcp-server"], "env": { "PICTIFY_API_KEY": "' + $EnvVars['PICTIFY_API_KEY'] + '" }, "enabled": true'
        Write-Success "Pictify enabled in config"
    }
    
    # Update Open Design
    if ($EnvVars['OPEN_DESIGN_ENABLED'] -eq 'true') {
        $port = $EnvVars['OPEN_DESIGN_PORT'] ?? '3333'
        Write-Success "Open Design configured (port $port)"
    }
    
    # Save config
    Set-Content -Path $configPath -Value $config -Encoding UTF8
    
    Write-Host ""
    Write-Success "Configuration updated"
}

# ═══════════════════════════════════════════════════════════════
# Validation
# ═══════════════════════════════════════════════════════════════

function Test-Installation {
    Write-Section "Validating Installation"
    
    $workspaceRoot = Join-Path $PSScriptRoot ".."
    
    # Check directories
    $requiredDirs = @(
        "projetos\_modelo",
        "_templates",
        ".opencode\instructions",
        ".opencode\agents",
        ".opencode\skills"
    )
    
    foreach ($dir in $requiredDirs) {
        $path = Join-Path $workspaceRoot $dir
        if (Test-Path $path) {
            Write-Success "Directory exists: $dir"
        } else {
            Write-Error "Missing directory: $dir"
        }
    }
    
    # Check files
    $requiredFiles = @(
        "opencode.jsonc",
        "WORKSPACE.md",
        "README.md",
        ".env"
    )
    
    foreach ($file in $requiredFiles) {
        $path = Join-Path $workspaceRoot $file
        if (Test-Path $path) {
            Write-Success "File exists: $file"
        } else {
            Write-Warning "Missing file: $file"
        }
    }
    
    Write-Host ""
    Write-Success "Installation validated"
}

# ═══════════════════════════════════════════════════════════════
# Main Setup Flow
# ═══════════════════════════════════════════════════════════════

function Start-Setup {
    Write-Header
    
    $workspaceRoot = Join-Path $PSScriptRoot ".."
    Set-Location $workspaceRoot
    
    Write-Host "Workspace: $workspaceRoot"
    
    # Step 1: Check prerequisites
    $prereqOk = Test-Prerequisites
    
    if (-not $prereqOk) {
        Write-Host ""
        Write-Error "Prerequisites not met. Please install missing components."
        return
    }
    
    # Step 2: Run configuration script
    Write-Section "Configuration"
    
    $envPath = Join-Path $workspaceRoot ".env"
    $configScript = Join-Path $PSScriptRoot "configure.py"
    
    if (-not (Test-Path $envPath)) {
        Write-Host "  No .env file found. Running interactive configuration..."
        Write-Host ""
        
        if (Test-Command 'python') {
            python $configScript
        } elseif (Test-Command 'python3') {
            python3 $configScript
        } else {
            Write-Warning "Python not found. Copying .env.template to .env"
            Copy-Item -Path ".env.template" -Destination ".env"
            Write-Host "  → Edit .env manually to configure services"
        }
    } else {
        Write-Success "Found existing .env configuration"
    }
    
    # Step 3: Install Open Design (if enabled)
    $envVars = Read-EnvFile -Path $envPath
    
    if ($envVars['OPEN_DESIGN_ENABLED'] -eq 'true' -and -not $SkipOpenDesign) {
        Install-OpenDesign -Force:$Force
    }
    
    # Step 4: Update OpenCode config
    Update-OpenCodeConfig -EnvVars $envVars
    
    # Step 5: Validate installation
    Test-Installation
    
    # Summary
    Write-Section "Setup Complete!"
    
    Write-Host "  Enabled services:"
    if ($envVars['FLUX_ENABLED'] -eq 'true') {
        Write-Host "    ✓ FLUX (AI image generation)"
    }
    if ($envVars['PICTIFY_ENABLED'] -eq 'true') {
        Write-Host "    ✓ Pictify (HTML to images)"
    }
    if ($envVars['OPEN_DESIGN_ENABLED'] -eq 'true') {
        Write-Host "    ✓ Open Design (visual prototyping)"
    }
    
    Write-Host ""
    Write-Host "  Base services (always enabled):"
    Write-Host "    ✓ document-generator (Word + PDF)"
    Write-Host "    ✓ pdf-toolkit (PDF advanced)"
    
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Cyan
    Write-Host "  1. Create a project:"
    Write-Host "     Copy-Item -Path projetos\_modelo -Destination projetos\meu-projeto -Recurse"
    Write-Host ""
    Write-Host "  2. Edit project context:"
    Write-Host "     - projetos\meu-projeto\briefing.md"
    Write-Host "     - projetos\meu-projeto\brand-voice.md"
    Write-Host "     - projetos\meu-projeto\personas.md"
    Write-Host ""
    Write-Host "  3. Start OpenCode in your project:"
    Write-Host "     cd projetos\meu-projeto"
    Write-Host "     opencode"
    Write-Host ""
    Write-Host "  4. Use agents and skills:"
    Write-Host "     @marketing-copywriter — Write articles, emails, posts"
    Write-Host "     @marketing-designer — Create visual assets"
    Write-Host "     @content-strategist — Plan content calendar"
    Write-Host "     @presentation-builder — Create pitch decks"
    Write-Host ""
    
    Write-Host ("=" * 60) -ForegroundColor Cyan
    Write-Host "  Workspace ready!" -ForegroundColor Green
    Write-Host ("=" * 60) -ForegroundColor Cyan
    Write-Host ""
}

# Run setup
try {
    Start-Setup
} catch {
    Write-Host ""
    Write-Error "Setup failed: $_"
    Write-Host ""
    Write-Host "Please check the error above and try again."
    Write-Host "For manual setup, see: WORKSPACE.md"
    Write-Host ""
    exit 1
}
