---
name: setup-workspace
description: 'Instala e configura o workspace WriteTextAmp — executa scripts de setup, configura MCPs, instala Open Design'
---

# Setup Workspace

Skill para instalação e configuração automatizada do workspace WriteTextAmp.

---

## Quando Usar

- Primeira instalação do workspace
- Reconfiguração de serviços (FLUX, Pictify, Open Design)
- Atualização de API keys
- Instalação de novos componentes (Open Design)
- Validação de instalação

---

## Workflow Automático

### 1. Executar Script de Setup

O script PowerShell faz tudo automaticamente:

```powershell
# No diretório raiz do workspace
powershell -File scripts/setup.ps1
```

**O que o script faz:**
1. ✓ Verifica prerequisites (Node.js, npm, Python, Git)
2. ✓ Executa configuração interativa (Python)
3. ✓ Instala Open Design (se habilitado)
4. ✓ Atualiza opencode.jsonc com configurações
5. ✓ Valida instalação

### 2. Configuração Interativa

O script Python (`scripts/configure.py`) pergunta:

- **FLUX** — Habilitar? (free tier em bfl.ai)
- **Pictify** — Habilitar? API key? (free tier em pictify.io)
- **Open Design** — Habilitar? Instalar do GitHub?

As respostas são salvas em `.env`.

### 3. Instalação do Open Design

Se habilitado, o script:

```powershell
# Clona repositório
git clone https://github.com/nexu-io/open-design tools/open-design

# Instala dependências
cd tools/open-design
npm install

# Instruções para iniciar
npm start
```

---

## Comandos Úteis

### Setup Completo

```powershell
# Setup padrão
powershell -File scripts/setup.ps1

# Setup forçado (reinstala tudo)
powershell -File scripts/setup.ps1 -Force

# Setup sem Open Design
powershell -File scripts/setup.ps1 -SkipOpenDesign
```

### Reconfigurar Serviços

```powershell
# Editar .env manualmente
notepad .env

# Ou executar configuração interativa
python scripts/configure.py

# Depois atualizar config
powershell -File scripts/setup.ps1
```

### Instalar Open Design Manualmente

```powershell
# Criar diretório
mkdir tools
cd tools

# Clonar repositório
git clone https://github.com/nexu-io/open-design
cd open-design

# Instalar dependências
npm install

# Iniciar
npm start
```

---

## Arquivos de Configuração

### `.env` (gerado pelo script)

```bash
# FLUX
FLUX_ENABLED=false

# Pictify
PICTIFY_ENABLED=false
PICTIFY_API_KEY=your_key

# Open Design
OPEN_DESIGN_ENABLED=false
OPEN_DESIGN_PORT=3333
```

### `opencode.jsonc` (atualizado pelo script)

O script atualiza automaticamente:
- Habilita/desabilita MCPs baseado no `.env`
- Adiciona API keys quando fornecidas
- Configura portas e endpoints

---

## Troubleshooting

### Node.js não encontrado

**Solução:**
```powershell
# Instalar Node.js
# Download: https://nodejs.org/
# Ou via Chocolatey:
choco install nodejs
```

### Python não encontrado

**Solução:**
```powershell
# Instalar Python
# Download: https://www.python.org/
# Ou via Chocolatey:
choco install python

# Alternativa: configurar .env manualmente
copy .env.template .env
notepad .env
```

### Git não encontrado (Open Design)

**Solução:**
```powershell
# Instalar Git
# Download: https://git-scm.com/
# Ou via Chocolatey:
choco install git

# Ou instalar Open Design manualmente (download ZIP do GitHub)
```

### npm install falha (Open Design)

**Solução:**
```powershell
cd tools/open-design

# Limpar cache
npm cache clean --force

# Tentar novamente
npm install

# Se ainda falhar, verificar:
node --version  # Deve ser 18+
npm --version   # Deve ser 9+
```

### Open Design não inicia

**Solução:**
```powershell
cd tools/open-design

# Verificar se dependências instalaram
npm install

# Tentar iniciar com verbose
npm start -- --verbose

# Verificar porta (padrão 3333)
# Se porta em uso, mudar em .env:
# OPEN_DESIGN_PORT=3334
```

---

## Validação

Após setup, verifique:

```powershell
# 1. Diretórios existem
Test-Path projetos\_modelo
Test-Path _templates
Test-Path .opencode

# 2. Arquivos de config existem
Test-Path opencode.jsonc
Test-Path .env

# 3. Open Design instalado (se habilitado)
Test-Path tools\open-design

# 4. MCPs respondem (dentro do OpenCode)
# Use: @marketing-copywriter "teste"
```

---

## Próximos Passos Após Setup

1. **Criar primeiro projeto:**
   ```powershell
   Copy-Item -Path projetos\_modelo -Destination projetos\meu-projeto -Recurse
   ```

2. **Editar contexto:**
   - `projetos/meu-projeto/briefing.md`
   - `projetos/meu-projeto/brand-voice.md`
   - `projetos/meu-projeto/personas.md`

3. **Iniciar OpenCode:**
   ```powershell
   cd projetos/meu-projeto
   opencode
   ```

4. **Testar agents:**
   ```
   @marketing-copywriter "Escreva um artigo teste sobre marketing digital"
   ```

---

## Checklist de Instalação

- [ ] Node.js 18+ instalado
- [ ] npm 9+ instalado
- [ ] Python 3.x instalado (opcional)
- [ ] Git instalado (para Open Design)
- [ ] Script `setup.ps1` executado
- [ ] `.env` configurado
- [ ] `opencode.jsonc` atualizado
- [ ] Open Design instalado (se habilitado)
- [ ] Diretórios validados
- [ ] Primeiro projeto criado
- [ ] OpenCode testado
