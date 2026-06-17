# WriteTextAmp Workspace - Marketing Content Studio

**Workspace completo de marketing com orquestração inteligente de agents, subagents e skills.**

> **CLIs Suportados:** OpenCode • Claude Code • Gemini CLI • Codex CLI • Antigravity  
> Leia `docs/MULTI-CLI-SUPPORT.md` para instruções de cada CLI.

---

## 🚀 Início Rápido

### Passo 1: Execute o Bootstrap

O bootstrap configura automaticamente todo o workspace:

1. **Abra o PowerShell como Administrador**
   - Clique com botão direito no PowerShell
   - Selecione "Executar como Administrador"

2. **Navegue até o diretório do workspace**
   ```powershell
   cd D:\GitHub\WriteTextAmpWorkscpase
   ```

3. **Execute o script de bootstrap**
   ```powershell
   .\bootstrap.ps1
   ```

4. **Siga as instruções na tela**
   - O script vai verificar e instalar Node.js, Python, Git
   - Vai instalar OpenCode CLI
   - Vai abrir a GUI de configuração
   - Selecione quais MCPs quer usar
   - Preencha API keys quando necessário
   - Clique em "Instalar e Finalizar"

### Passo 2: Configure as Contas e API Keys

**⚠️ IMPORTANTE:** Antes de continuar, leia sobre custos reais:

| Documento | Descrição |
|-----------|-----------|
| **[docs/REAL-COSTS.md](docs/REAL-COSTS.md)** | 💰 **LEIA PRIMEIRO** — O que REALMENTE custa dinheiro |
| [docs/COSTS-AND-ACCOUNTS.md](docs/COSTS-AND-ACCOUNTS.md) | Guia completo de custos e contas |

**Resumo rápido:**
- ✅ **100% Grátis (sem conta):** document-generator, pdf-toolkit, Docling, Open Design
- ⚠️ **Free Tier (precisa conta grátis):** FLUX (~100 imagens/mês), Brave Search (2000 queries/mês)
- 💲 **Pago:** Twitter API ($100/mês), SEOcrawl ($29/mês), OpenSEO ($19/mês)
- 💡 **Dica:** Comece 100% grátis. Só pague depois de usar e ver o que precisa.

### Passo 3: Crie Seu Primeiro Projeto

```powershell
# Copie o template
Copy-Item -Path "projetos\_modelo" -Destination "projetos\meu-primeiro-projeto" -Recurse

# Entre no diretório do projeto
cd projetos\meu-primeiro-projeto

# Inicie o OpenCode
opencode
```

### Passo 4: Comece a Criar Conteúdo

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
| **docs/COSTS-AND-ACCOUNTS.md** | 💰 Custos e contas necessárias | Antes de configurar |
| **docs/ORCHESTRATOR-GUIDE.md** | Como usar o orquestrador | Projetos complexos |
| **docs/USER-GUIDE.md** | Guia completo do usuário | Referência |
| **docs/MCP-CONFIGURATION.md** | Configuração de MCPs e serviços | Configurar ferramentas |
| **docs/DOCLING-GUIDE.md** | Guia do Docling | Processar documentos |
| **docs/OPEN-DESIGN-GUIDE.md** | Guia do Open Design | Criar visuais |

### Para Desenvolvedores

| Documento | Descrição |
|-----------|-----------|
| **AGENTS.md** | Informações técnicas do workspace |
| **docs/ARCHITECTURE.md** | Arquitetura do sistema |
| **docs/MCP-INTEGRATION.md** | Como integrar novos MCPs |

---

## 🏗️ Estrutura do Workspace

```
WriteTextAmpWorkscpase/
│
├── 📄 README.md                          # Visão geral (este arquivo)
├── 📄 AGENTS.md                          # Informações técnicas
├── 📄 WORKSPACE.md                       # Guia completo de uso
├── 📄 QUICKSTART.md                      # Início rápido
├── 📄 bootstrap.ps1                      # ⭐ Script de bootstrap
├── 📄 opencode.jsonc                     # Configuração de MCPs
├── 📄 .env                               # API keys (gerado pela GUI)
├── 📄 .env.template                      # Template de configuração
├── 📄 .gitignore                         # Ignora arquivos desnecessários
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
│   │   ├── 📄 bootstrap-guide.instructions.md  # ⭐ Guia para IA
│   │   ├── 📄 content-to-visual.instructions.md
│   │   ├── 📄 copywriting-framework.instructions.md
│   │   ├── 📄 brand-voice.instructions.md
│   │   ├── 📄 content-formats.instructions.md
│   │   ├── 📄 visual-marketing.instructions.md
│   │   └── 📄 git-workflow.instructions.md
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

## 🛠️ MCPs e Serviços

### Configuração Automática

O `bootstrap.ps1` configura automaticamente todos os MCPs:

- ✅ **Docling** - Processamento de documentos (inicia automaticamente no login)
- ✅ **Open Design** - Prototipagem visual local (com modelos de imagem AI)
- ✅ **FLUX** - Geração de imagens AI (Black Forest Labs)
- ✅ **Pictify** - Templates HTML para imagens
- ✅ **ChangeImageTo** - 16 ferramentas de edição de imagem
- ✅ **Chompute** - Remoção de fundo automática
- ✅ **Nano Banana** - Edição com Google Gemini

### Configuração Manual

Consulte `docs/MCP-CONFIGURATION.md` para:
- Configurar API keys
- Inicialização manual de serviços
- Troubleshooting
- Verificação de status

### Docling (Inicialização Automática)

O Docling é configurado para iniciar automaticamente no login do Windows:

```powershell
# Verificar status
.\scripts\setup-docling-startup.ps1 -Status

# Remover inicialização automática
.\scripts\setup-docling-startup.ps1 -Remove

# Iniciar manualmente
python scripts\start-docling-server.py
```

**Acesso:**
- API: http://localhost:8000
- Documentação: http://localhost:8000/docs
- Health: http://localhost:8000/health

### Open Design

Instalado automaticamente em `tools/open-design/` a partir da **última release do GitHub**:

```powershell
# Iniciar
cd tools\open-design
.\start.ps1
```

**Acesso:** http://localhost:3000

**Instalação:**
- O script `install-open-design.ps1` consulta a API do GitHub
- Baixa a última release disponível (asset para Windows)
- Extrai e configura localmente
- Configura modelos de imagem AI

**Modelos configurados:**
- FLUX (flux-1.1-pro, flux-1.1-pro-ultra, flux-1.1-dev)
- Pictify (templates HTML)
- ChangeImageTo (edição)
- Chompute (remoção de fundo)
- Nano Banana (edição com Gemini)

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
- **8 Instructions** (diretrizes)
- **4 Templates** reutilizáveis
- **3 Scripts** de setup (PowerShell + Python CLI + Python GUI)
- **20+ MCPs** configurados

---

## 🚨 Troubleshooting

### Bootstrap falhou

```powershell
# Verifique se está como Administrador
# Clique com botão direito no PowerShell → "Executar como Administrador"

# Tente novamente com Force
.\bootstrap.ps1 -Force
```

### GUI não abre

```powershell
# Instale Python
# Download: https://www.python.org/downloads/

# Ou use modo sem GUI
.\bootstrap.ps1 -SkipGUI

# Depois configure .env manualmente
Copy-Item .env.template .env
notepad .env
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
