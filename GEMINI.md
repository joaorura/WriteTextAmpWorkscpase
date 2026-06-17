# WriteTextAmp Workspace para Gemini CLI

> **Este arquivo é carregado automaticamente pelo Gemini CLI ao entrar neste diretório.**

## ⚠️ INSTRUÇÃO OBRIGATÓRIA

**ANTES DE QUALQUER AÇÃO**, leia:
- `.opencode/instructions/using-marketing-workspace.instructions.md` — Workflow obrigatório
- `docs/COSTS-AND-ACCOUNTS.md` — 💰 Custos, contas e free tiers

## 🎯 Como Trabalhar Neste Workspace

### 1. Bootstrap (se não executado ainda)
Se `.bootstrap-complete` não existe, guie o usuário:
```
Execute: .\bootstrap.ps1
```

### 2. Projetos Complexos
Use o workflow completo:
1. `brainstorming-content` para refinar escopo
2. `writing-content-plan` para planejar
3. Execute com subagents especializados
4. `reviewing-content` para validar
5. `finishing-content-project` para finalizar

### 3. Tarefas Simples
Use subagents:
- `content-creator` → Artigos, blogs
- `visual-designer` → Imagens, banners
- `social-media-manager` → Posts
- `document-generator` → PDFs, Word
- `email-marketing` → Emails

## 🔧 Ferramentas Configuradas

Configuração em `gemini-extension.json` — ao iniciar o Gemini CLI, use:
```
gemini extensions install .
```

Ferramentas disponíveis:
- **docling** — Processamento de documentos
- **flux** — Geração de imagens AI
- **pictify** — Templates HTML
- **changeimageto** — Edição de imagem
- **chompute** — Remoção de fundo
- **nano-banana** — Edição Gemini
- **document-generator** — Word + PDF
- **pdf-toolkit** — PDF avançado

## 📁 Estrutura do Workspace

```
.opencode/
├── skills/       → Skills (workflow + produção)
├── agents/       → Agents + subagents
└── instructions/ → Instruções obrigatórias

projetos/         → Projetos isolados por cliente
_templates/       → Templates reutilizáveis
scripts/          → Scripts de instalação
docs/             → Documentação
```

## 📚 Documentação

- `README.md` — Visão geral
- `WORKSPACE.md` — Guia completo
- `docs/COSTS-AND-ACCOUNTS.md` — 💰 Custos
- `docs/ORCHESTRATOR-GUIDE.md` — Orquestrador
- `docs/MULTI-CLI-SUPPORT.md` — Multi-CLI

---

**Siga as instruções obrigatórias. Máxima qualidade! 🚀**
