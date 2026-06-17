# Marketing Content Studio — Workspace Guide

> **Workspace de marketing** para produção de conteúdo profissional.
> Cada projeto é uma instância isolada com seu próprio contexto.
> Otimizado para notebooks — processamento pesado roda na nuvem.

---

## Princípios

- **Isolamento por projeto:** cada cliente/campanha tem seu próprio contexto
- **Múltiplas instâncias:** trabalhe em vários projetos simultaneamente sem confusão
- **Leve para o notebook:** MCPs locais são leves, imagens e PDFs pesados rodam na nuvem
- **Serviços online gratuitos:** habilitados direto (free tier)
- **Serviços pagos:** avaliados antes de habilitar

---

## Arquitetura

```
WriteTextAmpWorkscpase/
├── opencode.jsonc              # Config local dos MCPs
├── .opencode/                  # Configuração do OpenCode
│   ├── instructions/           # Instruções de copywriting e marketing
│   ├── agents/                 # Agentes especializados
│   └── skills/                 # Skills de produção de conteúdo
├── WORKSPACE.md                # Este arquivo — guia de uso
├── _templates/                 # Templates reutilizáveis
│   ├── briefing.md             # Modelo de briefing
│   ├── brand-voice-card.md     # Modelo de brand voice
│   ├── persona.md              # Modelo de persona
│   └── content-brief.md        # Modelo de brief de conteúdo
├── projetos/                   # Projetos isolados (instâncias)
│   ├── _modelo/                # Template para novos projetos
│   │   ├── PROJETO.md          # Guia do projeto
│   │   ├── briefing.md         # Briefing do projeto
│   │   ├── brand-voice.md      # Brand voice específico
│   │   ├── personas.md         # Personas do projeto
│   │   ├── output/             # Outputs do projeto
│   │   │   ├── artigos/
│   │   │   ├── apresentacoes/
│   │   │   ├── social-media/
│   │   │   ├── emails/
│   │   │   ├── imagens/
│   │   │   └── documentos/
│   │   └── assets/             # Assets do projeto (logos, fontes, etc.)
│   └── [nome-projeto]/         # Projeto real (copiar do _modelo)
└── README.md                   # Visão geral
```

---

## Como Usar

### 1. Criar Novo Projeto

Para iniciar um novo projeto (cliente, campanha, produto):

```powershell
# Copiar o modelo para um novo projeto
Copy-Item -Path "projetos\_modelo" -Destination "projetos\nome-do-projeto" -Recurse

# Editar os arquivos de contexto
# - projetos/nome-do-projeto/briefing.md
# - projetos/nome-do-projeto/brand-voice.md
# - projetos/nome-do-projeto/personas.md
```

### 2. Trabalhar em um Projeto

Ao iniciar uma sessão de trabalho:

1. **Abra o OpenCode no diretório do projeto:**
   ```powershell
   cd projetos/nome-do-projeto
   opencode
   ```

2. **O contexto do projeto é carregado automaticamente:**
   - Briefing, brand voice e personas são lidos
   - Outputs vão para `output/` do projeto
   - Assets são acessados de `assets/`

3. **Use os agents e skills disponíveis:**
   - `@marketing-copywriter` — para copy e textos
   - `@marketing-designer` — para peças visuais
   - `@content-strategist` — para planejamento
   - `@presentation-builder` — para apresentações

### 3. Produzir Conteúdo

#### Exemplo: Artigo de Blog

```
Prompt: "Escreva um artigo sobre [tema] seguindo o briefing do projeto.
Use framework AIDA. Salve em output/artigos/artigo-nome.md"
```

#### Exemplo: Post para LinkedIn

```
Prompt: "Crie um post para LinkedIn sobre [tema].
Siga o brand voice do projeto. Salve em output/social-media/linkedin-post.md"
```

#### Exemplo: Apresentação

```
Prompt: "Crie uma apresentação de 10 slides sobre [tema].
Use o template de pitch deck. Salve em output/apresentacoes/apresentacao.md"
```

#### Exemplo: Gerar PDF

```
Prompt: "Gere um PDF do artigo em output/artigos/artigo-nome.md
Salve em output/documentos/artigo-nome.pdf"
```

---

## MCPs Disponíveis

### ✅ Habilitados (gratuitos, rodam em qualquer notebook)

| MCP | Função | Processamento |
|-----|--------|---------------|
| **document-generator** | Word (.docx) + PDF profissional | Local (npx, leve) |
| **pdf-toolkit** | PDF avançado (merge, split, encrypt, QR) | Local (WASM, sem GPU) |

### ⚠️ Avaliar (free tier disponível, processamento na nuvem)

| MCP | Função | Custo | Como habilitar |
|-----|--------|-------|----------------|
| **FLUX** | Geração de imagens AI | Free tier em bfl.ai | Criar conta → habilitar no opencode.jsonc |
| **Pictify** | Imagens de templates HTML | Free tier em pictify.io | Criar conta → API key → habilitar no opencode.jsonc |

> **Nota:** FLUX e Pictify processam tudo na nuvem. Seu notebook só envia o prompt e recebe a imagem. Não precisa de GPU.

### Como habilitar FLUX ou Pictify

1. **FLUX** (imagens AI):
   - Crie conta gratuita em [bfl.ai](https://bfl.ai)
   - Habilite no `opencode.jsonc`: mude `"enabled": false` para `true`
   - Na primeira vez, o navegador abre para OAuth

2. **Pictify** (templates → imagem):
   - Crie conta gratuita em [pictify.io](https://pictify.io)
   - Gere API key em [API Tokens](https://pictify.io/dashboard/api-tokens)
   - Habilite no `opencode.jsonc`: adicione a key e mude para `true`

---

## Agents Especializados

### @marketing-copywriter
Especialista em copywriting para todos os canais. Domina frameworks AIDA, PAS, BAB, 4Ps.

**Use para:** Artigos, emails, posts, landing pages, anúncios.

### @marketing-designer
Criação de peças visuais e identidade visual. Domina design para marketing.

**Use para:** Banners, cards, social media visuals, identidade visual.

### @content-strategist
Planejamento e estratégia de conteúdo. Define calendários, funis e métricas.

**Use para:** Planejamento de conteúdo, calendário editorial, estratégia de funil.

### @presentation-builder
Especialista em apresentações e pitch decks. Domina storytelling visual.

**Use para:** Apresentações, pitch decks, webinars, propostas visuais.

---

## Skills de Produção

### generate-marketing-doc
Gera relatórios, propostas, briefings em PDF/Word profissional.

```
Prompt: "Use generate-marketing-doc para criar uma proposta comercial para [cliente]"
```

### create-social-content
Cria posts para redes sociais (LinkedIn, Instagram, Twitter/X).

```
Prompt: "Use create-social-content para criar 5 posts de LinkedIn sobre [tema]"
```

### write-email-campaign
Cria campanhas de email marketing (nutrição, lançamento, vendas).

```
Prompt: "Use write-email-campaign para criar sequência de 5 emails de boas-vindas"
```

### create-presentation
Cria apresentações e pitch decks com estrutura e storytelling.

```
Prompt: "Use create-presentation para criar pitch deck de 10 slides sobre [tema]"
```

### generate-visual-assets
Gera imagens, banners, cards usando AI (FLUX/Pictify).

```
Prompt: "Use generate-visual-assets para criar banner 1200x630 para [tema]"
```

---

## Instruções Carregadas

As seguintes instruções são aplicadas automaticamente:

| Instrução | O que faz |
|-----------|-----------|
| **copywriting-framework** | Frameworks AIDA, PAS, BAB, 4Ps + gatilhos mentais |
| **brand-voice** | Tom de voz, persona, guidelines de marca |
| **content-formats** | Formatos: blog, email, social, whitepaper, proposta |
| **visual-marketing** | Diretrizes visuais para imagens e apresentações |

---

## Workflow Típico

### Cenário: Lançamento de Produto

1. **Criar projeto:**
   ```powershell
   Copy-Item -Path "projetos\_modelo" -Destination "projetos\lancamento-produto-x" -Recurse
   ```

2. **Preencher contexto:**
   - Editar `briefing.md` com dados do produto
   - Editar `brand-voice.md` com tom da marca
   - Editar `personas.md` com público-alvo

3. **Planejar conteúdo** (com @content-strategist):
   ```
   "Crie calendário editorial de 4 semanas para lançamento do Produto X"
   ```

4. **Produzir conteúdo** (com @marketing-copywriter):
   ```
   "Escreva artigo de lançamento seguindo o calendário"
   "Crie sequência de 5 emails de lançamento"
   "Crie 10 posts de LinkedIn para as 2 semanas pré-lançamento"
   ```

5. **Criar visuais** (com @marketing-designer + generate-visual-assets):
   ```
   "Crie banners para social media do lançamento"
   "Gere imagens para o artigo usando FLUX"
   ```

6. **Criar apresentação** (com @presentation-builder):
   ```
   "Crie pitch deck de lançamento para stakeholders"
   ```

7. **Gerar documentos finais** (com generate-marketing-doc):
   ```
   "Gere PDF do artigo para distribuição"
   "Gere Word da proposta para o cliente"
   ```

---

## Dicas de Produtividade

### Contexto Isolado
Cada projeto tem seu próprio contexto. Ao abrir o OpenCode em `projetos/nome-projeto`, apenas aquele contexto é carregado. Isso permite trabalhar em múltiplos clientes/campanhas sem confusão.

### Templates Reutilizáveis
Use `_templates/` para criar templates que servem todos os projetos. Copie e adapte conforme necessário.

### Assets Compartilhados
Se um asset (logo, fonte) é usado em múltiplos projetos, mantenha em um projeto "master" e referencie.

### Versionamento
Este workspace é um repositório Git. Commite frequentemente para manter histórico das versões de conteúdo.

---

## Comandos Úteis

```powershell
# Listar todos os projetos
Get-ChildItem projetos -Directory | Where-Object { $_.Name -ne "_modelo" }

# Criar novo projeto a partir do modelo
Copy-Item -Path "projetos\_modelo" -Destination "projetos\novo-projeto" -Recurse

# Abrir OpenCode em um projeto específico
Set-Location projetos/nome-do-projeto
opencode

# Gerar PDF de um markdown (usando pdf-toolkit MCP)
# (dentro do OpenCode, use o MCP diretamente)
```

---

## Suporte e Recursos

- **Copywriting:** Veja `.opencode/instructions/copywriting-framework.instructions.md`
- **Brand Voice:** Veja `.opencode/instructions/brand-voice.instructions.md`
- **Formatos:** Veja `.opencode/instructions/content-formats.instructions.md`
- **Visual:** Veja `.opencode/instructions/visual-marketing.instructions.md`

---

**Workspace criado para gerentes de marketing que precisam de produção de conteúdo ágil, profissional e consistente.**
