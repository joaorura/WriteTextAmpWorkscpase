# Marketing Content Studio — Workspace de Marketing com Orquestração Inteligente

> **CLIs Suportados:** OpenCode • Claude Code • Gemini CLI • Codex CLI • Antigravity

## 🎯 Visão Geral

Este é um workspace completo de marketing com orquestração inteligente de agents, subagents e skills. Projetado para gerentes de marketing que precisam produzir conteúdo profissional de forma ágil e consistente.

## 🚀 Início Rápido (3 Passos)

### 1. Instale o Workspace

```bash
# Clone o repositório
git clone <repo-url>
cd WriteTextAmpWorkscpase

# Execute a GUI de configuração
python scripts/configure-gui.py
```

A GUI vai guiar você através de:
- Seleção de MCPs (ferramentas)
- Preenchimento de API keys
- Configuração de preferências
- Instalação automática de dependências

### 2. Crie Seu Primeiro Projeto

```bash
# Copie o template de projeto
Copy-Item -Path "projetos\_modelo" -Destination "projetos\meu-primeiro-projeto" -Recurse

# Entre no diretório do projeto
cd projetos\meu-primeiro-projeto

# Inicie o OpenCode
opencode
```

### 3. Comece a Criar Conteúdo

```
@marketing-orchestrator "Preciso de uma campanha completa de lançamento para o Produto X"
```

O orquestrador automaticamente:
- 🧠 Faz brainstorming para refinar escopo
- 📋 Cria plano detalhado
- ⚡ Executa com subagents especializados
- ✅ Revisa qualidade
- 🎁 Entrega pacote final

---

## 📚 Documentação Completa

### Para Usuários

| Documento | Descrição | Quando Ler |
|-----------|-----------|------------|
| **README.md** (este) | Visão geral e início rápido | Sempre |
| **QUICKSTART.md** | Guia rápido de 5 minutos | Primeira vez |
| **WORKSPACE.md** | Guia completo de uso | Uso diário |
| **docs/ORCHESTRATOR-GUIDE.md** | Como usar o orquestrador | Projetos complexos |
| **docs/USER-GUIDE.md** | Guia completo do usuário | Referência |

### Para Desenvolvedores

| Documento | Descrição |
|-----------|-----------|
| **AGENTS.md** (este) | Informações técnicas do workspace |
| **docs/ARCHITECTURE.md** | Arquitetura do sistema |
| **docs/MCP-INTEGRATION.md** | Como integrar novos MCPs |

---

## 🏗️ Estrutura do Workspace

```
WriteTextAmpWorkscpase/
│
├── 📄 README.md                          # Visão geral (este arquivo)
├── 📄 AGENTS.md                          # Informações técnicas (este arquivo)
├── 📄 WORKSPACE.md                       # Guia completo de uso
├── 📄 QUICKSTART.md                      # Início rápido
├── 📄 opencode.jsonc                     # Configuração de MCPs
├── 📄 .env                               # API keys (gerado pela GUI)
├── 📄 .env.template                      # Template de configuração
├── 📄 .gitignore                         # Ignora .env e dados sensíveis
│
├── 📁 docs/
│   ├── 📄 ORCHESTRATOR-GUIDE.md          # Guia do orquestrador
│   ├── 📄 USER-GUIDE.md                  # Guia do usuário
│   ├── 📄 ARCHITECTURE.md                # Arquitetura
│   └── 📄 MCP-INTEGRATION.md             # Integração de MCPs
│
├── 📁 .opencode/
│   ├── 📁 instructions/                  # Instruções obrigatórias
│   │   ├── 📄 using-marketing-workspace.instructions.md  # ⭐ Inicial
│   │   ├── 📄 content-to-visual.instructions.md
│   │   ├── 📄 copywriting-framework.instructions.md
│   │   ├── 📄 brand-voice.instructions.md
│   │   ├── 📄 content-formats.instructions.md
│   │   ├── 📄 visual-marketing.instructions.md
│   │   └── 📄 git-workflow.instructions.md  # ⭐ Git seguro
│   │
│   ├── 📁 agents/
│   │   ├── 📄 marketing-orchestrator.agent.md
│   │   └── 📁 subagents/ (5 subagents)
│   │
│   ├── 📁 skills/
│   │   ├── 📁 brainstorming-content/
│   │   ├── 📁 writing-content-plan/
│   │   ├── 📁 executing-content-plan/
│   │   ├── 📁 reviewing-content/
│   │   ├── 📁 finishing-content-project/
│   │   ├── 📁 decision-router/
│   │   ├── 📁 materialize-content/
│   │   ├── 📁 open-design-workflow/
│   │   └── 📁 [5 skills de produção]
│   │
│   └── 📁 templates/
│       └── 📄 open-design-prompts.md
│
├── 📁 _templates/                        # Templates reutilizáveis
│   ├── 📄 briefing.md
│   ├── 📄 brand-voice-card.md
│   ├── 📄 persona.md
│   └── 📄 content-brief.md
│
├── 📁 projetos/                          # Projetos isolados
│   ├── 📁 _modelo/                       # Template para novos projetos
│   └── 📁 [seus-projetos]/
│
└── 📁 scripts/
    ├── 📄 setup.ps1                      # Setup automático
    ├── 📄 configure.py                   # Configuração CLI
    └── 📄 configure-gui.py               # ⭐ GUI de configuração
```

---

## 🤖 Sistema de Orquestração

### Instruction Inicial (Obrigatória)

**`using-marketing-workspace.instructions.md`** é carregada automaticamente e força o uso do sistema:

1. **SEMPRE** use decision-router para analisar solicitações
2. **SEMPRE** faça brainstorming para projetos complexos
3. **SEMPRE** maximize conteúdo textual antes de materializar
4. **SEMPRE** use subagents para tarefas especializadas
5. **SEMPRE** siga o workflow completo

### Agents e Subagents

**Marketing Orchestrator** (coordenador central):
- Recebe solicitações complexas
- Decompõe em tarefas
- Delega para subagents
- Valida qualidade
- Entrega pacote final

**5 Subagents Especializados**:
- Content Creator → artigos, blogs, whitepapers
- Visual Designer → imagens, banners, visuais
- Social Media Manager → posts, calendários
- Document Generator → PDFs, Word, apresentações
- Email Marketing → sequências, newsletters

### Workflow Completo

```
1. decision-router → analisa solicitação
2. brainstorming-content → refina ideias (se complexo)
3. writing-content-plan → cria plano
4. executing-content-plan → executa com subagents
5. reviewing-content → valida qualidade
6. finishing-content-project → finaliza e entrega
```

---

## 🛠️ MCPs Disponíveis

### Geração de Imagem
- **FLUX** (Black Forest Labs) — imagens AI de alta qualidade
- **Pictify** — templates HTML para imagens
- **Open Design** — prototipagem visual local

### Edição de Imagem
- **ChangeImageTo** — 16 ferramentas (resize, crop, upscale, denoise, OCR)
- **Chompute BG Remover** — remoção de fundo
- **Nano Banana** — edição com Google Gemini

### Documentos
- **document-generator** — Word + PDF profissional
- **pdf-toolkit** — PDF avançado (merge, split, encrypt, QR)

### Redes Sociais
- **LinkedIn** — postar e gerenciar conteúdo
- **Twitter/X** — threads e posts
- **Instagram** — posts e stories
- **Facebook** — posts e páginas

### Produtividade
- **Notion** — documentação e organização
- **Google Drive** — armazenamento
- **Slack** — comunicação e aprovações

### Pesquisa e SEO
- **Brave Search** — pesquisa web
- **SEOcrawl** — análise SEO
- **OpenSEO** — dados de keywords

---

## 🔒 Segurança e Git

### Dados Sensíveis

O workspace usa `.gitignore` para proteger dados sensíveis:

```gitignore
# API keys e configurações
.env
.env.local
.env.*.local

# Dados de projetos
projetos/*/output/
projetos/*/.orchestrator/
projetos/*/.brainstorming/
projetos/*/.planos/

# Credenciais
*.key
*.pem
*.p12
```

### Git Workflow Seguro

O sistema segue `git-workflow.instructions.md`:

1. **Commit automático** após entregas importantes
2. **Nunca commita** `.env` ou dados sensíveis
3. **Usa branches** para projetos isolados
4. **Tags** para versões estáveis
5. **Backup automático** em momentos críticos

---

## 🎨 Materialização de Conteúdo

### Princípio Fundamental

**"Maximize conteúdo textual antes de materializar visualmente."**

### Workflow de Materialização

```
1. Complete TODO o conteúdo textual
2. Valide com checklist de maximização
3. Mapeie seções → componentes
4. Escolha ferramenta (Open Design, FLUX, Pictify)
5. Materialize visualmente
6. Exporte e entregue
```

### Quando Usar Cada Ferramenta

| Tipo de Entrega | Ferramenta Principal |
|----------------|---------------------|
| Landing Page | Open Design |
| Apresentação | Open Design |
| Dashboard | Open Design |
| Email Template | Open Design |
| Banner/Ad | FLUX ou Pictify |
| Social Media Post | Pictify ou FLUX |
| Whitepaper | Open Design + document-generator |
| Relatório | document-generator |

---

## 📊 Estatísticas do Workspace

- **45+ arquivos** criados
- **~250 KB** de conteúdo
- **1 Orchestrator** agent
- **5 Subagents** especializados
- **13 Skills** (8 workflow + 5 produção)
- **7 Instructions** (diretrizes)
- **4 Templates** reutilizáveis
- **3 Scripts** de setup (PowerShell + Python CLI + Python GUI)
- **20+ MCPs** configurados

---

## 🚨 Troubleshooting

### GUI não abre

```bash
# Instale dependências
pip install tkinter

# Execute novamente
python scripts/configure-gui.py
```

### MCP não funciona

1. Verifique se está habilitado em `.env`
2. Verifique se API key está correta
3. Execute `powershell -File scripts/setup.ps1` novamente

### Subagent não responde

1. Verifique se o agent está em `.opencode/agents/`
2. Verifique se o nome está correto
3. Reinicie o OpenCode

### Projeto não está isolado

1. Certifique-se de estar no diretório do projeto
2. Não trabalhe no diretório raiz do workspace

---

## 📞 Suporte

Para dúvidas ou problemas:
- Leia `docs/USER-GUIDE.md` para guia completo
- Consulte `docs/ORCHESTRATOR-GUIDE.md` para uso avançado
- Abra uma issue no GitHub

---

## 🎓 Filosofia do Sistema

Inspirado no **Superpowers**, o sistema segue:

1. **Brainstorming antes de executar** — Refine ideias antes de gastar recursos
2. **Planejamento detalhado** — Decomponha em tarefas pequenas e claras
3. **Execução via subagents** — Delegue para especialistas, mantenha contexto limpo
4. **Revisão constante** — Valide qualidade em cada etapa
5. **Documentação completa** — Ledger de progresso, decisões, aprendizados

**Princípio central:** "Nunca execute tarefas diretamente. Seu papel é coordenar, não executar."

---

**Workspace completo com orquestração inteligente, pronto para criar campanhas de marketing profissionais de forma ágil e consistente!**
