# WriteTextAmp Workspace — Quick Start Guide

## 🚀 Instalação Rápida

### Opção 1: Setup Automatizado (Recomendado)

```powershell
# 1. Clone ou baixe este repositório
cd WriteTextAmpWorkscpase

# 2. Execute o script de setup
powershell -File scripts/setup.ps1
```

**O script vai:**
- ✓ Verificar prerequisites (Node.js, Python, Git)
- ✓ Configurar serviços (FLUX, Pictify, Open Design)
- ✓ Instalar Open Design (se habilitado)
- ✓ Atualizar configurações
- ✓ Validar instalação

**Nota:** O OpenCode CLI deve ser instalado **antes** do bootstrap. Veja seção "Prerequisites" acima.

### Opção 2: Setup Manual

```powershell
# 1. Copiar template de configuração
copy .env.template .env

# 2. Editar .env com suas preferências
notepad .env

# 3. (Opcional) Instalar Open Design
mkdir tools
cd tools
git clone https://github.com/nexu-io/open-design
cd open-design
npm install
cd ..\..\

# 4. Validar instalação
powershell -File scripts/setup.ps1 -SkipOpenDesign
```

---
## 📋 Prerequisites

### Obrigatórios (Instale ANTES do Bootstrap)

- **Node.js 18+** — [Download](https://nodejs.org/)
- **npm 9+** — vem com Node.js
- **OpenCode CLI** — Instale separadamente:
  ```powershell
  npm install -g opencode
  ```

**Nota:** O OpenCode CLI deve ser instalado **antes** de executar o bootstrap.

### Opcionais (Recomendados)

- **Python 3.x** — para GUI de configuração — [Download](https://www.python.org/)
- **Git** — para versionamento local — [Download](https://git-scm.com/)
---

## 🎯 Primeiro Uso

### 1. Criar um Projeto

```powershell
# Copiar template para novo projeto
Copy-Item -Path "projetos\_modelo" -Destination "projetos\meu-primeiro-projeto" -Recurse
```

### 2. Configurar Contexto

Edite os arquivos do projeto:

```powershell
# Briefing do projeto
notepad projetos\meu-primeiro-projeto\briefing.md

# Tom de voz da marca
notepad projetos\meu-primeiro-projeto\brand-voice.md

# Personas do público
notepad projetos\meu-primeiro-projeto\personas.md
```

### 3. Iniciar OpenCode

```powershell
cd projetos\meu-primeiro-projeto
opencode
```

### 4. Produzir Conteúdo

Use os agents especializados:

```
@marketing-copywriter "Escreva um artigo sobre marketing digital para pequenas empresas"

@marketing-designer "Crie um banner 1200x630 para LinkedIn sobre tendências de marketing 2026"

@content-strategist "Planeje um calendário editorial de 4 semanas para lançamento de produto"

@presentation-builder "Crie um pitch deck de 10 slides para apresentação de produto SaaS"
```

---

## 🔧 Configuração de Serviços

### FLUX (Imagens AI)

**Status:** ⚠️ Avaliar (free tier disponível)

1. Criar conta em [bfl.ai](https://bfl.ai)
2. Editar `.env`:
   ```bash
   FLUX_ENABLED=true
   ```
3. Executar setup:
   ```powershell
   powershell -File scripts/setup.ps1
   ```
4. Na primeira vez, navegador abre para OAuth

### Pictify (Templates → Imagem)

**Status:** ⚠️ Avaliar (free tier disponível)

1. Criar conta em [pictify.io](https://pictify.io)
2. Gerar API key em [API Tokens](https://pictify.io/dashboard/api-tokens)
3. Editar `.env`:
   ```bash
   PICTIFY_ENABLED=true
   PICTIFY_API_KEY=sua_chave_aqui
   ```
4. Executar setup:
   ```powershell
   powershell -File scripts/setup.ps1
   ```

### Open Design (Prototipagem Visual)

**Status:** ⚠️ Opcional (open source)

1. Editar `.env`:
   ```bash
   OPEN_DESIGN_ENABLED=true
   OPEN_DESIGN_PORT=3333
   ```
2. Executar setup (instala automaticamente):
   ```powershell
   powershell -File scripts/setup.ps1
   ```
3. Iniciar Open Design:
   ```powershell
   cd tools\open-design
   npm start
   ```

---

## 📚 Documentação

- **WORKSPACE.md** — Guia completo de uso
- **README.md** — Visão geral do workspace
- **_templates/** — Templates reutilizáveis
- **.opencode/instructions/** — Diretrizes de copy e design
- **.opencode/agents/** — Agents especializados
- **.opencode/skills/** — Skills de produção

---

## 🆘 Troubleshooting

### "Node.js não encontrado"

Instalar Node.js: https://nodejs.org/

### "Python não encontrado"

Instalar Python: https://www.python.org/
Ou configurar `.env` manualmente:
```powershell
copy .env.template .env
notepad .env
```

### "Git não encontrado"

Instalar Git: https://git-scm.com/
Ou instalar Open Design manualmente (download ZIP do GitHub)

### "npm install falha"

```powershell
# Limpar cache
npm cache clean --force

# Tentar novamente
npm install
```

### "Open Design não inicia"

```powershell
cd tools\open-design

# Reinstalar dependências
npm install

# Iniciar com verbose
npm start -- --verbose
```

---

## 💡 Dicas

### Múltiplos Projetos

Cada projeto é isolado. Você pode trabalhar em vários clientes/campanhas simultaneamente:

```powershell
# Projeto 1
cd projetos\cliente-a
opencode

# Projeto 2 (em outra janela)
cd projetos\cliente-b
opencode
```

### Templates Reutilizáveis

Use `_templates/` para criar templates que servem todos os projetos:

```powershell
# Ver templates disponíveis
ls _templates

# Copiar template para projeto
copy _templates\briefing.md projetos\meu-projeto\briefing.md
```

### Atalhos

Crie aliases para comandos frequentes:

```powershell
# Adicionar ao $PROFILE
function New-MarketingProject {
    param([string]$Name)
    Copy-Item -Path "projetos\_modelo" -Destination "projetos\$Name" -Recurse
    Write-Host "✓ Projeto criado: projetos\$Name"
}

# Uso:
New-MarketingProject cliente-x
```

---

## ✅ Checklist de Instalação

### Antes do Bootstrap

- [ ] Node.js 18+ instalado
- [ ] npm 9+ instalado
- [ ] OpenCode CLI instalado (`npm install -g opencode`)
- [ ] Python 3.x instalado (opcional)
- [ ] Git instalado (opcional)

### Durante o Bootstrap

- [ ] Script `bootstrap.ps1` executado
- [ ] `.env` configurado
- [ ] Open Design instalado (se habilitado)

### Após o Bootstrap

- [ ] Primeiro projeto criado
- [ ] OpenCode testado com sucesso

---

## 🎉 Pronto!

Seu workspace está configurado e pronto para uso!

**Próximos passos:**
1. Leia `WORKSPACE.md` para guia completo
2. Crie seu primeiro projeto
3. Teste os agents e skills
4. Produza conteúdo incrível! 🚀
