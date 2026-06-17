# WriteTextAmp Workspace — Multi-CLI Support

Este documento explica como usar o WriteTextAmp Workspace com diferentes CLIs de AI.

---

## 🎯 CLIs Suportados

| CLI | Instalação | Arquivo de Config | Status |
|-----|-----------|-------------------|--------|
| **OpenCode** | `npm install -g opencode` | `opencode.jsonc` | ✅ Suporte nativo |
| **Claude Code** | `npm install -g @anthropic-ai/claude-code` | `CLAUDE.md` | ✅ Adaptado |
| **Gemini CLI** | `npm install -g @google/gemini-cli` | `GEMINI.md` | ✅ Adaptado |
| **Codex CLI** | `npm install -g @openai/codex` | `CODEX.md` | ✅ Adaptado |
| **Antigravity** | `npm install -g antigravity` | `ANTIGRAVITY.md` | ✅ Adaptado |

---

## 🚀 Como Usar com Cada CLI

### 1. OpenCode (Nativo)

```bash
cd projetos/meu-projeto
opencode
```

O OpenCode lê automaticamente:
- `opencode.jsonc` — configuração de MCPs
- `.opencode/instructions/` — instruções obrigatórias
- `.opencode/agents/` — agents especializados

---

### 2. Claude Code (Anthropic)

```bash
cd projetos/meu-projeto
claude
```

O Claude Code lê automaticamente:
- `CLAUDE.md` — instruções do workspace
- `.claude/settings.json` — configuração de MCPs
- `.opencode/instructions/using-marketing-workspace.instructions.md` — workflow inicial

**Configuração MCP:**
```json
// .claude/settings.json
{
  "mcpServers": {
    "docling": { "command": "npx", "args": ["-y", "@anthropic-ai/mcp-server-docling"] },
    "flux": { "command": "npx", "args": ["-y", "@bfl/mcp-server-flux"] }
  }
}
```

---

### 3. Gemini CLI (Google)

```bash
cd projetos/meu-projeto
gemini
```

O Gemini CLI lê automaticamente:
- `GEMINI.md` — instruções do workspace
- `gemini-extension.json` — configuração de MCPs

**Configuração MCP:**
```json
// gemini-extension.json
{
  "name": "write-text-amp",
  "tools": [
    { "name": "docling", "command": "npx", "args": ["-y", "@google-gemini/mcp-server-docling"] },
    { "name": "flux", "command": "npx", "args": ["-y", "@bfl/mcp-server-flux"] }
  ]
}
```

---

### 4. Codex CLI (OpenAI)

```bash
cd projetos/meu-projeto
codex
```

O Codex CLI lê automaticamente:
- `CODEX.md` — instruções do workspace
- `.codex/config.toml` — configuração de MCPs

**Configuração MCP:**
```toml
# .codex/config.toml
[mcp_servers.docling]
command = "npx"
args = ["-y", "@openai/mcp-server-docling"]

[mcp_servers.flux]
command = "npx"
args = ["-y", "@bfl/mcp-server-flux"]
```

---

### 5. Antigravity

```bash
cd projetos/meu-projeto
antigravity
```

O Antigravity lê automaticamente:
- `ANTIGRAVITY.md` — instruções do workspace
- `.antigravity/config.json` — configuração de MCPs

**Configuração MCP:**
```json
// .antigravity/config.json
{
  "mcp": {
    "docling": { "command": "npx", "args": ["-y", "@antigravity/mcp-server-docling"] },
    "flux": { "command": "npx", "args": ["-y", "@bfl/mcp-server-flux"] }
  }
}
```

---

## 📁 Estrutura Multi-CLI

```
WriteTextAmpWorkscpase/
│
├── 📄 CLAUDE.md              # ⭐ Instruções para Claude Code
├── 📄 GEMINI.md              # ⭐ Instruções para Gemini CLI
├── 📄 CODEX.md               # ⭐ Instruções para Codex CLI
├── 📄 ANTIGRAVITY.md         # ⭐ Instruções para Antigravity
├── 📄 AGENTS.md              # Instruções universais (todos CLIs)
│
├── 📄 opencode.jsonc          # Config OpenCode (nativo)
├── 📁 .claude/               # Config Claude Code
│   └── 📄 settings.json      # MCPs para Claude
├── 📄 gemini-extension.json  # Config Gemini CLI
├── 📁 .codex/                # Config Codex CLI
│   └── 📄 config.toml        # MCPs para Codex
├── 📁 .antigravity/          # Config Antigravity
│   └── 📄 config.json        # MCPs para Antigravity
│
└── 📁 .opencode/             # Core do workspace (usado por todos CLIs)
    ├── 📁 instructions/
    ├── 📁 agents/
    └── 📁 skills/
```

---

## 🔧 Instalação Multi-CLI

O `bootstrap.ps1` pode instalar todos os CLIs:

```powershell
# Instala todos os CLIs disponíveis
.\bootstrap.ps1 -AllCLIs

# Instala apenas CLIs específicos
.\bootstrap.ps1 -Clis "opencode","claude","gemini"

# Instala sem CLIs (apenas workspace)
.\bootstrap.ps1 -NoCLIs
```

Cada CLI tem seu próprio pacote npm:
- `npm install -g opencode`
- `npm install -g @anthropic-ai/claude-code`
- `npm install -g @google/gemini-cli`
- `npm install -g @openai/codex`
- `npm install -g antigravity`

---

## 📚 Documentação Específica por CLI

| CLI | Documentação |
|-----|-------------|
| OpenCode | `AGENTS.md` (este arquivo) |
| Claude Code | `CLAUDE.md` |
| Gemini CLI | `GEMINI.md` |
| Codex CLI | `CODEX.md` |
| Antigravity | `ANTIGRAVITY.md` |

---

**O workspace funciona com qualquer CLI de AI. Escolha o seu preferido! 🚀**
