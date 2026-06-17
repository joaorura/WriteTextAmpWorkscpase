# WriteTextAmp Workspace para Claude Code

> **Este arquivo é carregado automaticamente pelo Claude Code ao entrar neste diretório.**

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

### 2. Projetos Complexos (múltiplos entregáveis)
```
@marketing-orchestrator "Campanha completa de lançamento"
```
O orquestrador decompõe em tarefas e delega para subagents.

### 3. Tarefas Simples (único entregável)
Use subagents diretamente:
- `@content-creator` — Artigos, blogs, whitepapers
- `@visual-designer` — Imagens, banners, visuais
- `@social-media-manager` — Posts, calendários
- `@document-generator` — PDFs, Word, apresentações
- `@email-marketing` — Sequências, newsletters

### 4. Workflow Obrigatório
1. `@decision-router` analisa solicitação
2. `brainstorming-content` se projeto complexo
3. `writing-content-plan` cria plano
4. `executing-content-plan` executa com subagents
5. `reviewing-content` valida qualidade
6. `finishing-content-project` finaliza

## 🔧 MCPs Configurados

Configuração em `.claude/settings.json`:
- **Docling** — Processamento de documentos
- **FLUX** — Geração de imagens AI
- **Pictify** — Templates HTML para imagens
- **ChangeImageTo** — Edição de imagem
- **Chompute** — Remoção de fundo
- **Nano Banana** — Edição com Gemini
- **document-generator** — Word + PDF
- **pdf-toolkit** — PDF avançado

## 📁 Estrutura de Skills

As skills estão em `.opencode/skills/` — o Claude Code pode acessá-las via filesystem:

```
.opencode/skills/
├── brainstorming-content/SKILL.md
├── writing-content-plan/SKILL.md
├── executing-content-plan/SKILL.md
├── reviewing-content/SKILL.md
├── finishing-content-project/SKILL.md
├── decision-router/SKILL.md
├── materialize-content/SKILL.md
├── open-design-workflow/SKILL.md
├── generate-marketing-doc/SKILL.md
├── create-social-content/SKILL.md
├── write-email-campaign/SKILL.md
├── create-presentation/SKILL.md
└── generate-visual-assets/SKILL.md
```

## 📁 Estrutura de Agents

Agents em `.opencode/agents/`:

```
.opencode/agents/
├── marketing-orchestrator.agent.md
└── subagents/
    ├── content-creator.subagent.md
    ├── visual-designer.subagent.md
    ├── social-media-manager.subagent.md
    ├── document-generator.subagent.md
    └── email-marketing.subagent.md
```

## 📁 Instruções

Instruções em `.opencode/instructions/`:

```
.opencode/instructions/
├── using-marketing-workspace.instructions.md  ⭐ Obrigatória
├── bootstrap-guide.instructions.md
├── content-to-visual.instructions.md
├── copywriting-framework.instructions.md
├── brand-voice.instructions.md
├── content-formats.instructions.md
├── visual-marketing.instructions.md
├── git-workflow.instructions.md
└── installation-guide.instructions.md
```

## 📚 Documentação

- `README.md` — Visão geral
- `WORKSPACE.md` — Guia completo
- `docs/COSTS-AND-ACCOUNTS.md` — 💰 Custos e contas
- `docs/ORCHESTRATOR-GUIDE.md` — Orquestrador
- `docs/USER-GUIDE.md` — Usuário
- `docs/MCP-CONFIGURATION.md` — Config MCPs
- `docs/MULTI-CLI-SUPPORT.md` — Suporte multi-CLI
- `docs/DOCLING-GUIDE.md` — Docling
- `docs/OPEN-DESIGN-GUIDE.md` — Open Design

---

**Siga as instruções obrigatórias. Máxima qualidade em cada entrega! 🚀**
