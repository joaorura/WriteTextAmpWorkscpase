---
description: 'Guia de instalação e bootstrap do workspace'
applyTo: '**'
---

# Instalação e Bootstrap

**Guia completo de instalação do WriteTextAmp Workspace.**

---

## 🚀 Instalação Rápida (Recomendado)

### Método 1: Bootstrap Unificado

O **bootstrap.ps1** é o ponto de entrada único que orquestra todo o processo:

```powershell
# Execute o bootstrap
.\scripts\bootstrap.ps1
```

**O que o bootstrap faz:**

1. ✅ **Verifica prerequisites** (Node.js, Python, Git, OpenCode)
2. ✅ **Executa configuração interativa** (GUI ou CLI)
3. ✅ **Instala dependências** (MCPs, Open Design, etc.)
4. ✅ **Inicializa git** (repositório local)
5. ✅ **Valida instalação** (verifica se tudo está funcional)

### Método 2: GUI de Configuração

Se preferir apenas a GUI sem o bootstrap completo:

```powershell
# Execute a GUI de configuração
python scripts\configure-gui.py

# Depois execute o setup
powershell -File scripts\setup.ps1
```

### Método 3: Instalação Manual

Para controle total do processo:

```powershell
# 1. Copiar template de configuração
copy .env.template .env

# 2. Editar .env manualmente
notepad .env

# 3. Instalar dependências
powershell -File scripts\setup.ps1

# 4. Inicializar git (opcional)
git init
git add .
git commit -m "bootstrap: inicialização do workspace"
```

---

## 📋 Prerequisites

### Obrigatórios (Instale ANTES do Bootstrap)

- **Node.js 18+** — [Download](https://nodejs.org/)
- **npm 9+** — vem com Node.js
- **OpenCode CLI** — Instale separadamente:
  ```powershell
  # Instale o OpenCode CLI globalmente
  npm install -g opencode
  
  # Verifique instalação
  opencode --version
  ```

**Nota:** O OpenCode CLI é a ferramenta que vai usar o workspace. Ele deve ser instalado **antes** de executar o bootstrap.

### Opcionais (Recomendados)

- **Python 3.x** — para GUI de configuração — [Download](https://www.python.org/)
- **Git** — para versionamento local — [Download](https://git-scm.com/)

---

## 🔧 Opções do Bootstrap

### Parâmetros

```powershell
.\scripts\bootstrap.ps1 [parâmetros]
```

| Parâmetro | Descrição |
|-----------|-----------|
| `-UseCLI` | Usa configuração CLI em vez de GUI |
| `-SkipOpenDesign` | Pula instalação do Open Design |
| `-Force` | Força reinstalação de todos os componentes |
| `-SkipValidation` | Pula validação final (não recomendado) |

### Exemplos

```powershell
# Bootstrap padrão com GUI
.\scripts\bootstrap.ps1

# Bootstrap com CLI (para ambientes sem display)
.\scripts\bootstrap.ps1 -UseCLI

# Bootstrap sem Open Design
.\scripts\bootstrap.ps1 -SkipOpenDesign

# Reinstalação forçada
.\scripts\bootstrap.ps1 -Force
```

---

## 🎯 Fluxo de Instalação

### Passo 1: Verificação de Prerequisites

O bootstrap verifica se você tem:

- ✅ Node.js instalado
- ✅ npm instalado
- ⚠️ Python instalado (opcional)
- ⚠️ Git instalado (opcional)

**Nota:** O OpenCode CLI deve ser instalado **antes** de executar o bootstrap. Veja seção "Prerequisites" acima.

**Se faltar algo obrigatório**, o bootstrap para e mostra instruções de instalação.

### Passo 2: Configuração Interativa

A GUI de configuração guia você através de:

1. **Seleção de MCPs** — Marque quais ferramentas quer usar
2. **API Keys** — Preencha chaves de API quando necessário
3. **Instalação** — Escolha se quer instalar Open Design
4. **Conclusão** — Resumo da configuração

**MCPs disponíveis:**

- **Geração de Imagem:** FLUX, Pictify, Open Design
- **Edição de Imagem:** ChangeImageTo, Chompute, Nano Banana
- **Redes Sociais:** LinkedIn, Twitter, Instagram, Facebook
- **Produtividade:** Notion, Google Drive, Slack
- **Pesquisa e SEO:** Brave Search, SEOcrawl, OpenSEO

### Passo 3: Instalação de Dependências

O setup.ps1 executa:

1. Lê `.env` para saber quais MCPs habilitar
2. Atualiza `opencode.jsonc` com configurações
3. Instala Open Design (se habilitado)
4. Valida instalação

### Passo 4: Inicialização do Git

Se Git estiver instalado:

1. Inicializa repositório local (`git init`)
2. Adiciona todos os arquivos (`git add .`)
3. Cria commit inicial (`git commit -m "bootstrap: inicialização"`)

**Nota:** O git é usado apenas para backup local. Não há push para repositórios remotos.

### Passo 5: Validação

O bootstrap verifica se:

- ✅ `.env` existe
- ✅ `opencode.jsonc` existe
- ✅ Diretórios críticos existem (`.opencode/`, `projetos/`, `_templates/`)
- ✅ Open Design está instalado (se habilitado)

---

## 🆘 Troubleshooting

### "Node.js não encontrado"

**Solução:**
```powershell
# Instale Node.js
# Download: https://nodejs.org/

# Verifique instalação
node --version
npm --version
```

### "OpenCode não encontrado"

**Solução:**
```powershell
# O OpenCode CLI deve ser instalado ANTES do bootstrap
# Instale globalmente:
npm install -g opencode

# Verifique instalação:
opencode --version

# Depois execute o bootstrap novamente:
.\scripts\bootstrap.ps1
```

### "Python não encontrado"

**Solução:**
```powershell
# Instale Python
# Download: https://www.python.org/

# Ou use configuração manual
copy .env.template .env
notepad .env
```

### "GUI não abre"

**Solução:**
```powershell
# Instale tkinter (geralmente vem com Python)
pip install tkinter

# Ou use CLI em vez de GUI
.\scripts\bootstrap.ps1 -UseCLI
```

### "Setup falhou"

**Solução:**
```powershell
# Limpe cache do npm
npm cache clean --force

# Execute novamente com Force
.\scripts\bootstrap.ps1 -Force
```

### "Open Design não instala"

**Solução:**
```powershell
# Instale manualmente
mkdir tools
cd tools
git clone https://github.com/nexu-io/open-design
cd open-design
npm install

# Ou pule Open Design
.\scripts\bootstrap.ps1 -SkipOpenDesign
```

---

## 📊 Validação Pós-Instalação

Após o bootstrap, verifique:

```powershell
# 1. Verifique se .env existe
Test-Path .env

# 2. Verifique se opencode.jsonc existe
Test-Path opencode.jsonc

# 3. Verifique diretórios críticos
Test-Path .opencode/agents
Test-Path .opencode/skills
Test-Path projetos/_modelo

# 4. Teste OpenCode
cd projetos\_modelo
opencode
```

---

## 🎓 Próximos Passos

Após instalação bem-sucedida:

### 1. Crie Seu Primeiro Projeto

```powershell
# Copie o template
Copy-Item -Path "projetos\_modelo" -Destination "projetos\meu-primeiro-projeto" -Recurse

# Entre no diretório
cd projetos\meu-primeiro-projeto

# Inicie o OpenCode
opencode
```

### 2. Configure o Contexto do Projeto

Edite os arquivos do projeto:

```powershell
# Briefing do projeto
notepad briefing.md

# Tom de voz da marca
notepad brand-voice.md

# Personas do público
notepad personas.md
```

### 3. Comece a Criar Conteúdo

```
@marketing-orchestrator "Preciso de uma campanha completa de lançamento para o Produto X"
```

### 4. Commite em Momentos Importantes

```powershell
# Após brainstorming
git add .brainstorming/
git commit -m "brainstorming: decisões validadas"

# Após planejamento
git add .planos/
git commit -m "plano: tarefas definidas"

# Após finalização
git add output/
git commit -m "finalização: pacote entregue"
```

---

## 📚 Documentação Adicional

- **QUICKSTART.md** — Guia rápido de início
- **WORKSPACE.md** — Guia completo de uso
- **docs/USER-GUIDE.md** — Guia do usuário
- **docs/ORCHESTRATOR-GUIDE.md** — Guia do orquestrador
- **.opencode/instructions/** — Instruções obrigatórias

---

## ✅ Checklist de Instalação

### Antes do Bootstrap

- [ ] Node.js 18+ instalado
- [ ] npm 9+ instalado
- [ ] OpenCode CLI instalado (`npm install -g opencode`)
- [ ] Python 3.x instalado (opcional)
- [ ] Git instalado (opcional)

### Durante o Bootstrap

- [ ] Bootstrap executado (`.\scripts\bootstrap.ps1`)
- [ ] `.env` configurado
- [ ] `opencode.jsonc` atualizado
- [ ] Open Design instalado (se habilitado)
- [ ] Git inicializado
- [ ] Validação passou

### Após o Bootstrap

- [ ] Primeiro projeto criado
- [ ] OpenCode testado com sucesso

---

**Bootstrap concluído! Seu workspace está pronto para uso.** 🚀
