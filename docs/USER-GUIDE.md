# Guia do Usuário — WriteTextAmp Workspace

**Guia completo para usar o workspace de marketing com orquestração inteligente.**

---

## 🎯 Para Quem é Este Guia

Este guia é para **gerentes de marketing** que querem:
- Produzir conteúdo profissional de forma ágil
- Coordenar múltiplos projetos simultaneamente
- Usar AI para acelerar produção
- Manter consistência de marca
- Entregar pacotes completos (artigos, social media, emails, apresentações)

---

## 🚀 Início Rápido (5 Minutos)

### 1. Instale o Workspace

```bash
# Clone o repositório
git clone <repo-url>
cd WriteTextAmpWorkscpase

# Execute a GUI de configuração
python scripts/configure-gui.py
```

A GUI vai guiar você através de:
- ✅ Seleção de MCPs (ferramentas)
- ✅ Preenchimento de API keys
- ✅ Instalação de dependências
- ✅ Configuração do ambiente

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

**Pronto!** O orquestrador vai automaticamente:
1. 🧠 Fazer brainstorming para refinar escopo
2. 📋 Criar plano detalhado
3. ⚡ Executar com subagents especializados
4. ✅ Revisar qualidade
5. 🎁 Entregar pacote final

---

## 📚 Conceitos Fundamentais

### 1. Projetos Isolados

Cada projeto é uma **instância isolada** com seu próprio contexto:

```
projetos/
├── _modelo/              # Template para novos projetos
├── cliente-a-campanha-x/ # Projeto 1
├── cliente-b-lancamento-y/ # Projeto 2
└── interno-rebranding-z/  # Projeto 3
```

**Benefícios:**
- Contexto isolado (não confunde projetos)
- Brand voice específico por projeto
- Personas específicas por projeto
- Entregas organizadas por projeto

### 2. Orquestrador Inteligente

O **marketing-orchestrator** é o coordenador central:

```
Solicitação do usuário
    ↓
Orquestrador analisa
    ↓
Decompõe em tarefas
    ↓
Delega para subagents
    ↓
Valida qualidade
    ↓
Entrega pacote final
```

**Quando usar:**
- Projetos complexos (múltiplos entregáveis)
- Campanhas completas
- Lançamentos de produto
- Estratégias de conteúdo

### 3. Subagents Especializados

5 subagents para diferentes tipos de conteúdo:

| Subagent | Especialidade | Quando Usar |
|----------|--------------|-------------|
| **Content Creator** | Artigos, blogs, whitepapers | Conteúdo textual longo |
| **Visual Designer** | Imagens, banners, visuais | Peças visuais |
| **Social Media Manager** | Posts, calendários | Redes sociais |
| **Document Generator** | PDFs, Word, apresentações | Documentos finais |
| **Email Marketing** | Sequências, newsletters | Email marketing |

### 4. Workflow Completo

Todo projeto segue 5 etapas:

```
1. BRAINSTORMING → Refina ideias, valida escopo
2. PLANEJAMENTO → Decompõe em tarefas, define dependências
3. EXECUÇÃO → Delega para subagents, valida entregas
4. REVISÃO → Valida qualidade, consistência, alinhamento
5. FINALIZAÇÃO → Organiza pacote, cria relatório, obtém aprovação
```

---

## 🎨 Casos de Uso Comuns

### Caso 1: Campanha de Lançamento

**Solicitação:**
```
@marketing-orchestrator "Campanha completa de lançamento para o Produto X"
```

**O que o orquestrador faz:**
1. Brainstorming → entende produto, público, objetivos
2. Planejamento → cria plano com 10 tarefas
3. Execução → delega para 5 subagents
4. Revisão → valida consistência e qualidade
5. Finalização → entrega pacote completo

**Entregas típicas:**
- ✅ Briefing completo
- ✅ Identidade visual
- ✅ Artigo de lançamento (1500 palavras)
- ✅ 10 posts LinkedIn (com visuais)
- ✅ Sequência de 5 emails
- ✅ Apresentação (10 slides)
- ✅ 5 banners para social media
- ✅ Relatório final

### Caso 2: Conteúdo para Blog

**Solicitação:**
```
@content-creator "Escreva um artigo sobre marketing digital para pequenas empresas"
```

**O que acontece:**
1. Content Creator escreve artigo completo
2. Aplica framework de copy (AIDA, PAS, etc.)
3. Otimiza para SEO
4. Revisa qualidade
5. Entrega artigo pronto

**Entregas:**
- ✅ Artigo de 1500 palavras
- ✅ SEO otimizado
- ✅ Meta description
- ✅ Sugestões de imagens

### Caso 3: Social Media

**Solicitação:**
```
@social-media-manager "Crie 10 posts para LinkedIn sobre tendências de marketing 2026"
```

**O que acontece:**
1. Social Media Manager cria 10 posts
2. Hooks fortes na primeira linha
3. Sugere visuais para cada post
4. Inclui hashtags relevantes
5. Entrega pacote completo

**Entregas:**
- ✅ 10 posts com copy otimizada
- ✅ Sugestões de visuais
- ✅ Hashtags relevantes
- ✅ Calendário de publicação

### Caso 4: Email Marketing

**Solicitação:**
```
@email-marketing "Sequência de 5 emails para lançamento de produto SaaS"
```

**O que acontece:**
1. Email Marketing cria sequência completa
2. Copy persuasiva para cada email
3. Assuntos otimizados
4. CTAs claros
5. Entrega sequência pronta

**Entregas:**
- ✅ 5 emails com copy persuasiva
- ✅ Assuntos otimizados
- ✅ CTAs claros
- ✅ Cronograma de envio

### Caso 5: Apresentação

**Solicitação:**
```
@presentation-builder "Crie um pitch deck de 10 slides para investidores"
```

**O que acontece:**
1. Presentation Builder cria estrutura
2. Conteúdo para cada slide
3. Sugere visuais
4. Notas do orador
5. Entrega apresentação completa

**Entregas:**
- ✅ 10 slides com conteúdo
- ✅ Sugestões de visuais
- ✅ Notas do orador
- ✅ PDF formatado

---

## 🛠️ Ferramentas (MCPs)

### Geração de Imagem

**FLUX (Black Forest Labs)**
- Imagens AI de alta qualidade
- Free tier disponível em bfl.ai
- Use para: hero images, backgrounds, ilustrações

**Pictify**
- Templates HTML para imagens
- Free tier disponível em pictify.io
- Use para: banners, social media cards, OG images

**Open Design**
- Prototipagem visual local
- Open source
- Use para: landing pages, apresentações, dashboards

### Edição de Imagem

**ChangeImageTo**
- 16 ferramentas de edição
- Resize, crop, upscale, denoise, OCR
- Use para: pós-processamento de imagens

**Chompute BG Remover**
- Remoção de fundo
- Use para: produtos, retratos

**Nano Banana**
- Edição com Google Gemini
- Use para: edição avançada

### Documentos

**document-generator**
- Word + PDF profissional
- Use para: relatórios, propostas, whitepapers

**pdf-toolkit**
- PDF avançado (merge, split, encrypt, QR)
- Use para: pós-processamento de PDFs

### Redes Sociais

**LinkedIn, Twitter/X, Instagram, Facebook**
- Postar e gerenciar conteúdo
- Use para: publicação direta

### Produtividade

**Notion, Google Drive, Slack**
- Documentação, armazenamento, comunicação
- Use para: organização e colaboração

### Pesquisa e SEO

**Brave Search, SEOcrawl, OpenSEO**
- Pesquisa web, análise SEO, dados de keywords
- Use para: pesquisa e otimização

---

## 🎨 Materialização de Conteúdo

### Princípio Fundamental

**"Maximize conteúdo textual antes de materializar visualmente."**

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

### Workflow de Materialização

```
1. Complete TODO o conteúdo textual
2. Valide com checklist de maximização
3. Mapeie seções → componentes
4. Escolha ferramenta (Open Design, FLUX, Pictify)
5. Materialize visualmente
6. Exporte e entregue
```

---

## 🔒 Segurança e Git

### Dados Sensíveis

O workspace protege dados sensíveis:

- `.env` (API keys) → **NUNCA commitado**
- `.gitignore` → configurado automaticamente
- Branches isoladas → por projeto
- Backup automático → em momentos importantes

### Git Workflow

O sistema salva progresso automaticamente:

1. **Após brainstorming** → commit das decisões
2. **Após planejamento** → commit do plano
3. **Após cada fase** → commit das entregas
4. **Após revisão** → commit da validação
5. **Após finalização** → commit do pacote final

---

## 📊 Estrutura de Arquivos

### Durante Projeto

```
projetos/meu-projeto/
├── PROJETO.md              # Guia do projeto
├── briefing.md             # Briefing completo
├── brand-voice.md          # Tom de voz
├── personas.md             # Personas
│
├── .brainstorming/
│   └── decisoes.md         # Decisões do brainstorming
│
├── .planos/
│   └── plano-projeto.md    # Plano detalhado
│
├── .orchestrator/
│   ├── progress.md         # Ledger de progresso
│   └── aprendizados.md     # Aprendizados
│
└── output/                 # Entregas
    ├── artigos/
    ├── social-media/
    ├── emails/
    ├── documentos/
    ├── imagens/
    └── RELATORIO-FINAL.md
```

### Após Finalização

```
projetos/meu-projeto/
├── PROJETO.md
├── briefing.md
├── brand-voice.md
├── personas.md
│
├── .brainstorming/         # Mantido para referência
├── .planos/                # Mantido para referência
├── .orchestrator/          # Mantido para referência
│
└── output/                 # Pacote final limpo
    ├── artigos/
    ├── social-media/
    ├── emails/
    ├── documentos/
    ├── imagens/
    └── RELATORIO-FINAL.md
```

---

## 🚨 Troubleshooting

### GUI não abre

```bash
# Instale tkinter
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
- Leia `WORKSPACE.md` para guia completo
- Consulte `docs/ORCHESTRATOR-GUIDE.md` para uso avançado
- Abra uma issue no GitHub

---

## 🎓 Dicas de Produtividade

### 1. Use Templates

Copie templates de `_templates/` para acelerar:

```bash
# Copie briefing template
Copy-Item _templates\briefing.md projetos\meu-projeto\briefing.md

# Edite rapidamente
notepad projetos\meu-projeto\briefing.md
```

### 2. Reutilize Brand Voice

Se múltiplos projetos usam mesma marca:

```bash
# Copie brand voice de projeto existente
Copy-Item projetos\cliente-a\brand-voice.md projetos\cliente-b\brand-voice.md
```

### 3. Paralelize Projetos

Trabalhe em múltiplos projetos simultaneamente:

```bash
# Terminal 1
cd projetos\cliente-a
opencode

# Terminal 2
cd projetos\cliente-b
opencode
```

### 4. Use Atalhos

Crie aliases para comandos frequentes:

```bash
# Adicione ao $PROFILE
function New-MarketingProject {
    param([string]$Name)
    Copy-Item -Path "projetos\_modelo" -Destination "projetos\$Name" -Recurse
    Write-Host "✓ Projeto criado: projetos\$Name"
}

# Uso:
New-MarketingProject cliente-x
```

### 5. Backup Regular

Faça backup de projetos importantes:

```bash
# Backup manual
./scripts/backup-projeto.sh campanha-lancamento

# Backup automático (cron)
# Adicione ao crontab:
# 0 18 * * * /path/to/scripts/backup-projeto.sh campanha-lancamento
```

---

## 🎯 Exemplos de Solicitações

### Projetos Complexos

```
@marketing-orchestrator "Campanha completa de lançamento para Produto X"
@marketing-orchestrator "Estratégia de conteúdo para Q1 2026"
@marketing-orchestrator "Rebranding completo da empresa"
```

### Tarefas Simples

```
@content-creator "Escreva um artigo sobre marketing digital"
@visual-designer "Crie um banner para LinkedIn"
@social-media-manager "Crie 10 posts para Instagram"
@email-marketing "Sequência de 5 emails de boas-vindas"
@document-generator "Gere PDF do whitepaper"
```

### Materialização

```
@marketing-orchestrator "Crie uma landing page para o Produto X"
@marketing-orchestrator "Crie uma apresentação de pitch deck"
@marketing-orchestrator "Crie um dashboard de métricas"
```

---

**Use este guia como referência diária para produzir conteúdo de marketing profissional de forma ágil e consistente!**
