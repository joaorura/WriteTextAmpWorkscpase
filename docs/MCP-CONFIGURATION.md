# Configuração de MCPs e Serviços

**Guia completo de configuração dos MCPs e serviços do workspace.**

---

## 🎯 Visão Geral

O workspace usa múltiplos MCPs (Model Context Protocols) para integrar com ferramentas externas:

- **Docling** - Processamento de documentos (PDF, DOCX, imagens)
- **Open Design** - Prototipagem visual local
- **FLUX** - Geração de imagens AI (Black Forest Labs)
- **Pictify** - Templates HTML para imagens
- **ChangeImageTo** - Edição de imagem (16 ferramentas)
- **Chompute** - Remoção de fundo
- **Nano Banana** - Edição com Google Gemini

---

## 📋 Configuração Automática (Bootstrap)

O `bootstrap.ps1` configura automaticamente:

1. ✅ Instala Docling e configura inicialização automática
2. ✅ Instala Open Design e configura modelos de imagem
3. ✅ Configura todos os MCPs no `opencode.jsonc`
4. ✅ Cria scripts de inicialização

**Execute:**
```powershell
.\bootstrap.ps1
```

---

## 🔧 Configuração Manual

### 1. Docling

#### Instalação

```powershell
# Instale o docling-serve
pip install docling-serve

# Verifique instalação
docling-serve --version
```

#### Inicialização Automática (Startup do Windows)

```powershell
# Configure para iniciar no login
.\scripts\setup-docling-startup.ps1

# Verifique status
.\scripts\setup-docling-startup.ps1 -Status

# Remova inicialização automática
.\scripts\setup-docling-startup.ps1 -Remove
```

#### Inicialização Manual

```powershell
# Inicie o servidor
python scripts\start-docling-server.py

# Ou use porta customizada
python scripts\start-docling-server.py --port 9000
```

#### Configuração MCP

No `opencode.jsonc`:

```json
{
  "docling": {
    "type": "http",
    "url": "http://localhost:8000",
    "enabled": true,
    "description": "Docling - Processamento de documentos"
  }
}
```

#### Verificação

```powershell
# Teste o health check
curl http://localhost:8000/health

# Acesse documentação
# http://localhost:8000/docs
```

---

### 2. Open Design

#### Instalação

```powershell
# Instale automaticamente
.\scripts\install-open-design.ps1

# Ou especifique diretório
.\scripts\install-open-design.ps1 -InstallDir "C:\tools\open-design"

# Reinstale
.\scripts\install-open-design.ps1 -Force
```

#### Inicialização

```powershell
cd tools\open-design
.\start.ps1
```

#### Configuração MCP

No `opencode.jsonc`:

```json
{
  "open-design": {
    "type": "stdio",
    "command": "node",
    "args": ["tools/open-design/mcp-server.js"],
    "enabled": true,
    "description": "Open Design - Prototipagem visual local"
  }
}
```

#### Modelos de Imagem

Configure em `tools/open-design/models.config.json`:

```json
{
  "models": {
    "flux": {
      "enabled": true,
      "default_model": "flux-1.1-pro"
    }
  }
}
```

---

### 3. FLUX (Black Forest Labs)

#### Obter API Key

1. Acesse: https://bfl.ai/pricing
2. Crie uma conta
3. Gere uma API key

#### Configurar

No `.env`:

```env
FLUX_API_KEY=sua_chave_aqui
```

#### Configuração MCP

No `opencode.jsonc`:

```json
{
  "flux": {
    "type": "http",
    "url": "https://api.bfl.ai/v1",
    "enabled": true,
    "headers": {
      "Authorization": "Bearer ${FLUX_API_KEY}"
    },
    "description": "FLUX - Geração de imagens AI"
  }
}
```

---

### 4. Pictify

#### Obter API Key

1. Acesse: https://pictify.io/dashboard/api-tokens
2. Crie uma conta
3. Gere uma API key

#### Configurar

No `.env`:

```env
PICTIFY_API_KEY=sua_chave_aqui
```

#### Configuração MCP

No `opencode.jsonc`:

```json
{
  "pictify": {
    "type": "http",
    "url": "https://api.pictify.io/v1",
    "enabled": true,
    "headers": {
      "Authorization": "Bearer ${PICTIFY_API_KEY}"
    },
    "description": "Pictify - Templates HTML para imagens"
  }
}
```

---

### 5. ChangeImageTo

#### Configuração MCP

No `opencode.jsonc`:

```json
{
  "changeimageto": {
    "type": "http",
    "url": "https://api.changeimageto.com/v1",
    "enabled": true,
    "description": "ChangeImageTo - 16 ferramentas de edição"
  }
}
```

**Nota:** Não requer API key (uso gratuito)

---

### 6. Chompute

#### Configuração MCP

No `opencode.jsonc`:

```json
{
  "chompute": {
    "type": "http",
    "url": "https://api.chompute.com/v1",
    "enabled": true,
    "description": "Chompute - Remoção de fundo"
  }
}
```

**Nota:** Não requer API key (uso gratuito)

---

### 7. Nano Banana

#### Obter API Key

1. Acesse: https://nanobanana.com
2. Crie uma conta
3. Gere uma API key

#### Configurar

No `.env`:

```env
NANO_BANANA_API_KEY=sua_chave_aqui
```

#### Configuração MCP

No `opencode.jsonc`:

```json
{
  "nano-banana": {
    "type": "http",
    "url": "https://api.nanobanana.com/v1",
    "enabled": true,
    "headers": {
      "Authorization": "Bearer ${NANO_BANANA_API_KEY}"
    },
    "description": "Nano Banana - Edição com Google Gemini"
  }
}
```

---

## 🔍 Verificação de MCPs

### Verificar Todos os MCPs

```powershell
# Verifique se todos estão configurados
Get-Content opencode.jsonc | ConvertFrom-Json | Select-Object -ExpandProperty mcp

# Verifique se Docling está rodando
curl http://localhost:8000/health

# Verifique se Open Design está rodando
curl http://localhost:3000
```

### Testar MCPs no OpenCode

```markdown
# Teste Docling
@docling health check

# Teste Open Design
@open-design list templates

# Teste FLUX
@flux generate image "test image"
```

---

## 🆘 Troubleshooting

### Docling não inicia

```powershell
# Verifique se está instalado
docling-serve --version

# Reinstale
pip uninstall docling-serve
pip install docling-serve

# Verifique porta
Get-NetTCPConnection -LocalPort 8000

# Mate processo na porta
Get-NetTCPConnection -LocalPort 8000 | Select-Object -ExpandProperty OwningProcess | ForEach-Object { Stop-Process -Id $_ -Force }
```

### Open Design não inicia

```powershell
# Verifique se está instalado
Test-Path tools\open-design

# Reinstale
.\scripts\install-open-design.ps1 -Force

# Verifique dependências
cd tools\open-design
npm install

# Verifique porta
Get-NetTCPConnection -LocalPort 3000
```

### MCP não responde

```powershell
# Verifique configuração
Get-Content opencode.jsonc | ConvertFrom-Json | Select-Object -ExpandProperty mcp

# Verifique API keys
Get-Content .env | Select-String "API_KEY"

# Reinicie OpenCode
# Feche e abra novamente
```

### API Key inválida

```powershell
# Teste FLUX
curl -H "Authorization: Bearer $env:FLUX_API_KEY" https://api.bfl.ai/v1/models

# Teste Pictify
curl -H "Authorization: Bearer $env:PICTIFY_API_KEY" https://api.pictify.io/v1/templates
```

---

## 📊 Status dos Serviços

### Verificar Status

```powershell
# Docling
.\scripts\setup-docling-startup.ps1 -Status

# Open Design
Get-Process -Name node -ErrorAction SilentlyContinue | Where-Object { $_.MainWindowTitle -like "*open-design*" }

# Todos os MCPs
Get-Content opencode.jsonc | ConvertFrom-Json | Select-Object -ExpandProperty mcp | ForEach-Object { $_.PSObject.Properties } | ForEach-Object { Write-Host "$($_.Name): $($_.Value.enabled)" }
```

---

## 💡 Dicas

### Performance

- **Docling**: Use porta dedicada (8000) e habilite cache
- **Open Design**: Use SSD para melhor performance
- **FLUX**: Use `flux-1.1-pro` para velocidade, `flux-1.1-pro-ultra` para qualidade

### Segurança

- **Nunca commite** `.env` com API keys reais
- **Use** `.env.template` como referência
- **Rotacione** API keys periodicamente

### Monitoramento

- **Docling**: Monitore logs em `http://localhost:8000/docs`
- **Open Design**: Monitore console do navegador (F12)
- **APIs**: Monitore uso e custos nos dashboards

---

## 📚 Documentação Adicional

- **Docling**: `docs/DOCLING-GUIDE.md`
- **Open Design**: `docs/OPEN-DESIGN-GUIDE.md`
- **FLUX**: https://docs.bfl.ai
- **Pictify**: https://docs.pictify.io
- **ChangeImageTo**: https://docs.changeimageto.com

---

**Todos os MCPs estão configurados e prontos para uso! 🚀**
