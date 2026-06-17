---
name: open-design-workflow
description: 'Workflow completo para usar Open Design — quando usar, como estruturar, prompts prontos, integração com conteúdo textual'
triggers:
  - 'use open design'
  - 'crie no open design'
  - 'protótipo visual'
  - 'layout no open design'
  - 'quando usar open design'
---

# Open Design Workflow

**Objetivo:** Guiar o uso do Open Design para materializar conteúdo textual em protótipos visuais profissionais, maximizando a entrega final.

## 🎯 Quando Usar Open Design

### ✅ Use Open Design Quando:

1. **Prototipagem de Landing Pages**
   - Precisa visualizar layout antes de desenvolver
   - Quer testar diferentes estruturas de página
   - Precisa de HTML exportável para desenvolvimento

2. **Dashboards e Data Visualization**
   - Apresentar dados de forma visual
   - Criar relatórios interativos
   - Dashboards de métricas de marketing

3. **Apresentações Interativas**
   - Apresentações que precisam de mais que slides estáticos
   - Protótipos de webinars
   - Pitch decks interativos

4. **Email Templates**
   - Design de emails responsivos
   - Templates reutilizáveis
   - Preview antes de enviar

5. **Social Media Templates**
   - Templates reutilizáveis para posts
   - Cards para LinkedIn/Instagram
   - Banners e headers

6. **Documentos Visuais**
   - Whitepapers com layout profissional
   - E-books com design rico
   - Relatórios anuais

### ❌ NÃO Use Open Design Quando:

- Precisa apenas de uma imagem simples → use FLUX ou Pictify
- É um documento Word/PDF simples → use document-generator
- É um post de texto puro → use subagent diretamente
- Precisa de edição rápida de imagem → use ChangeImageTo

---

## 🔄 Workflow: Texto → Open Design → Entrega Final

### Fase 1: Maximizar Conteúdo Textual (ANTES do Open Design)

**Princípio:** "Preencha todos os gaps no texto antes de materializar visualmente."

#### Checklist de Conteúdo Completo

Antes de abrir o Open Design, valide:

**Para Landing Pages:**
- [ ] Headline principal definida
- [ ] Subheadline clara
- [ ] 3-5 benefícios principais listados
- [ ] Prova social (depoimentos, números)
- [ ] CTA principal definido
- [ ] FAQ com 5-7 perguntas
- [ ] Copy de todas as seções escrita

**Para Apresentações:**
- [ ] Estrutura de slides definida (10-15 slides)
- [ ] Título e subtítulo de cada slide
- [ ] Conteúdo de cada slide (máx 50 palavras)
- [ ] Dados e gráficos identificados
- [ ] Notas do orador escritas

**Para Dashboards:**
- [ ] Métricas a exibir definidas
- [ ] Dados reais ou mockups preparados
- [ ] Hierarquia de informação clara
- [ ] Filtros e interações planejadas

**Para Email Templates:**
- [ ] Assunto e preview text definidos
- [ ] Copy completa do email
- [ ] CTA principal e secundários
- [ ] Estrutura de seções definida

**Para Documentos Visuais:**
- [ ] Conteúdo completo escrito
- [ ] Estrutura de capítulos/seções
- [ ] Imagens e gráficos identificados
- [ ] Tabelas e dados formatados

### Fase 2: Estruturar para Open Design

#### Mapeie Seções → Componentes

```markdown
## Estrutura para Open Design

### Seção 1: Hero
- Componente: Hero Section
- Conteúdo: [headline + subtítulo + CTA]
- Layout: [centralizado / split / fullscreen]

### Seção 2: Benefícios
- Componente: Feature Grid
- Conteúdo: [3-5 benefícios com ícones]
- Layout: [3 colunas / 2 colunas / lista]

### Seção 3: Prova Social
- Componente: Testimonials
- Conteúdo: [3 depoimentos]
- Layout: [carousel / grid / lista]

[... continue para todas as seções]
```

### Fase 3: Abrir Open Design e Criar

#### Passo a Passo

1. **Abra o Open Design**
   ```bash
   cd tools/open-design
   npm start
   ```
   Acesse: http://localhost:3333

2. **Crie Novo Projeto**
   - Nome: `[nome-do-projeto]-[tipo]`
   - Exemplo: `lancamento-produto-x-landing-page`

3. **Escolha Template Base**
   - Landing Page → "Marketing Landing"
   - Apresentação → "Presentation 16:9"
   - Dashboard → "Analytics Dashboard"
   - Email → "Email Newsletter"

4. **Use Prompts Prontos** (veja biblioteca abaixo)

5. **Exporte**
   - HTML → para desenvolvimento
   - PDF → para documentação
   - PNG → para apresentações

### Fase 4: Integrar com Pacote Final

Após exportar do Open Design:

1. **Salve em `output/`**
   - Landing pages → `output/landing-pages/`
   - Apresentações → `output/apresentacoes/`
   - Dashboards → `output/dashboards/`
   - Emails → `output/emails/templates/`

2. **Documente no Relatório**
   ```markdown
   ## Entregas Visuais (Open Design)
   - Landing page: `output/landing-pages/lancamento.html`
   - Apresentação: `output/apresentacoes/pitch-deck.pdf`
   - Dashboard: `output/dashboards/metricas.html`
   ```

3. **Valide com Usuário**
   - Mostre preview
   - Peça feedback
   - Itere se necessário

---

## 📚 Biblioteca de Prompts para Open Design

### Landing Pages

#### Hero Section
```
Crie uma hero section para [produto/serviço]:
- Headline: "[headline principal]"
- Subheadline: "[subtítulo explicativo]"
- CTA: "[texto do botão]"
- Layout: [centralizado com imagem de fundo / split com imagem à direita]
- Estilo: [moderno / minimalista / corporativo]
- Cores: [paleta do projeto]
```

#### Feature Grid
```
Crie uma seção de benefícios com 3 colunas:
- Benefício 1: [título] + [descrição curta] + [ícone]
- Benefício 2: [título] + [descrição curta] + [ícone]
- Benefício 3: [título] + [descrição curta] + [ícone]
- Layout: grid 3 colunas responsivo
- Estilo: cards com hover effect
```

#### Testimonials
```
Crie uma seção de depoimentos:
- Depoimento 1: "[quote]" — [Nome, Cargo, Empresa]
- Depoimento 2: "[quote]" — [Nome, Cargo, Empresa]
- Depoimento 3: "[quote]" — [Nome, Cargo, Empresa]
- Layout: carousel ou grid 3 colunas
- Inclua: foto, nome, cargo, empresa, logo
```

#### Pricing Table
```
Crie uma tabela de preços com 3 planos:
- Plano Básico: [preço] + [5 features]
- Plano Pro: [preço] + [7 features] + [badge "Mais Popular"]
- Plano Enterprise: [preço] + [features ilimitadas]
- Layout: 3 colunas com destaque no plano Pro
- CTA: botão em cada plano
```

### Apresentações

#### Slide de Capa
```
Crie um slide de capa:
- Título: "[título da apresentação]"
- Subtítulo: "[subtítulo]"
- Data: [DD/MM/AAAA]
- Apresentador: [Nome]
- Layout: centralizado com logo
- Fundo: [cor sólida / gradiente / imagem]
```

#### Slide de Problema
```
Crie um slide de problema:
- Título: "O Problema"
- Conteúdo: [descrição do problema em 2-3 bullets]
- Dado impactante: "[estatística]"
- Visual: [ícone / imagem que representa a dor]
- Layout: split (texto esquerda, visual direita)
```

#### Slide de Solução
```
Crie um slide de solução:
- Título: "Nossa Solução"
- Conteúdo: [3 benefícios principais em bullets]
- Visual: [screenshot / diagrama / mockup]
- Layout: split (visual esquerda, texto direita)
```

#### Slide de Dados
```
Crie um slide de dados:
- Título: "[título do gráfico]"
- Tipo de gráfico: [barras / linhas / pizza / área]
- Dados: [inserir dados ou descrever]
- Insight: [1 linha com o principal takeaway]
- Fonte: [fonte dos dados]
```

### Dashboards

#### KPI Cards
```
Crie uma linha de KPI cards:
- KPI 1: [nome] = [valor] ([variação%])
- KPI 2: [nome] = [valor] ([variação%])
- KPI 3: [nome] = [valor] ([variação%])
- KPI 4: [nome] = [valor] ([variação%])
- Layout: 4 cards em linha
- Estilo: cards com ícone, valor grande, variação colorida
```

#### Gráfico de Linha Temporal
```
Crie um gráfico de linha temporal:
- Título: "[métrica ao longo do tempo]"
- Período: [últimos 30 dias / 6 meses / 1 ano]
- Dados: [descrever tendência]
- Estilo: linha suave com área preenchida
- Inclua: tooltip com valores, legenda
```

#### Tabela de Dados
```
Crie uma tabela de dados:
- Título: "[título da tabela]"
- Colunas: [col1, col2, col3, col4]
- Linhas: [5-10 linhas de dados]
- Funcionalidades: ordenação, filtro, paginação
- Estilo: linhas alternadas, hover effect
```

### Email Templates

#### Header de Email
```
Crie um header de email:
- Logo: [inserir logo]
- Título: "[título do email]"
- Subtítulo: "[subtítulo opcional]"
- Layout: centralizado
- Fundo: [cor da marca]
```

#### Corpo de Email
```
Crie o corpo de um email:
- Saudação: "Olá [Nome],"
- Parágrafo 1: [intro + contexto]
- Parágrafo 2: [conteúdo principal]
- CTA: botão "[texto do botão]"
- Assinatura: [nome + cargo + empresa]
- Layout: coluna única, max-width 600px
```

#### Footer de Email
```
Crie um footer de email:
- Links sociais: [LinkedIn, Twitter, Instagram]
- Link de descadastro: "Cancelar inscrição"
- Endereço: [endereço da empresa]
- Layout: centralizado, texto pequeno
```

---

## 🎨 Templates de Estrutura

### Template: Landing Page Completa

```markdown
# Estrutura: Landing Page de Lançamento

## Seção 1: Hero
- Headline: "[Produto X] está aqui"
- Subheadline: "A solução que você esperava para [problema]"
- CTA: "Comece agora"
- Visual: [hero image ou vídeo]

## Seção 2: Prova Social (Logos)
- "Usado por empresas como:"
- 6 logos de clientes

## Seção 3: Problema
- Título: "O desafio que você enfrenta"
- 3 bullets descrevendo a dor
- Dado: "73% das empresas sofrem com isso"

## Seção 4: Solução
- Título: "Como [Produto X] resolve"
- 3 benefícios principais com ícones
- Screenshot do produto

## Seção 5: Features
- Título: "Recursos poderosos"
- Grid 2x3 com 6 features
- Cada feature: ícone + título + descrição

## Seção 6: Depoimentos
- 3 depoimentos com foto, quote, nome, cargo

## Seção 7: Preços
- 3 planos: Básico, Pro, Enterprise
- Tabela comparativa de features

## Seção 8: FAQ
- 5-7 perguntas frequentes
- Accordion (expansível)

## Seção 9: CTA Final
- Headline: "Pronto para começar?"
- Subheadline: "Junte-se a [X] empresas"
- CTA: "Comece grátis"
```

### Template: Apresentação de Pitch

```markdown
# Estrutura: Pitch Deck (10 slides)

## Slide 1: Capa
- Título: [Nome da Empresa]
- Subtítulo: [Tagline]
- Logo + Data

## Slide 2: Problema
- "O problema que resolvemos"
- 3 bullets + dado impactante

## Slide 3: Solução
- "Nossa solução"
- 3 benefícios + screenshot

## Slide 4: Mercado
- TAM, SAM, SOM
- Gráfico de mercado

## Slide 5: Produto
- Como funciona (3 passos)
- Screenshots

## Slide 6: Tração
- Métricas de crescimento
- Gráfico de usuários/receita

## Slide 7: Modelo de Negócio
- Como ganhamos dinheiro
- Preços + unit economics

## Slide 8: Competição
- Matriz comparativa
- Nossos diferenciais

## Slide 9: Time
- Fotos + bios dos fundadores
- Advisors

## Slide 10: Ask
- Quanto estamos levantando
- Uso dos recursos
- Contato
```

---

## 🔧 Integração com MCPs

### Open Design + FLUX
```
1. Crie layout no Open Design
2. Identifique onde precisa de imagens custom
3. Use FLUX para gerar imagens:
   - Hero images
   - Backgrounds
   - Ícones customizados
4. Importe imagens no Open Design
5. Exporte HTML/PDF final
```

### Open Design + Pictify
```
1. Crie template no Open Design
2. Exporte HTML
3. Use Pictify para gerar variações:
   - Diferentes cores
   - Diferentes textos
   - A/B testing
4. Salve variações em output/
```

### Open Design + document-generator
```
1. Crie layout no Open Design
2. Exporte PDF
3. Use document-generator para:
   - Adicionar página de números
   - Adicionar marca d'água
   - Merge com outros documentos
4. Salve PDF final em output/documentos/
```

---

## ✅ Checklist de Qualidade

Antes de exportar do Open Design:

- [ ] Conteúdo textual está completo e revisado?
- [ ] Hierarquia visual está clara?
- [ ] Brand voice visual está consistente?
- [ ] Responsividade testada (se aplicável)?
- [ ] Links e CTAs estão funcionais?
- [ ] Imagens estão otimizadas?
- [ ] Acessibilidade considerada (contraste, alt text)?
- [ ] Exportou em todos os formatos necessários?

---

## 🚨 Red Flags

**Nunca:**
- Abra o Open Design sem conteúdo textual completo
- Use placeholder text ("Lorem ipsum") na entrega final
- Pule a fase de maximização de conteúdo
- Exporte sem validar responsividade
- Esqueça de documentar no relatório final

**Sempre:**
- Complete todo o conteúdo textual antes
- Mapeie seções → componentes
- Use prompts prontos da biblioteca
- Valide com usuário antes de exportar
- Documente entregas no relatório

---

## 📖 Exemplo Completo

### Solicitação
```
@marketing-orchestrator "Crie uma landing page para o Produto X"
```

### Processo

1. **Brainstorming** → define escopo, público, objetivo
2. **Planejamento** → cria plano com tarefas
3. **Execução**:
   - Content Creator escreve copy completa
   - Visual Designer sugere imagens
   - **Open Design Workflow ativa**:
     - Valida que copy está completa
     - Mapeia seções → componentes
     - Abre Open Design
     - Usa prompts prontos
     - Cria layout
     - Exporta HTML + PDF
4. **Revisão** → valida qualidade
5. **Finalização** → entrega pacote

### Entregas
```
output/
├── landing-pages/
│   ├── produto-x.html (Open Design)
│   └── produto-x.pdf (Open Design)
├── artigos/
│   └── copy-landing-page.md (Content Creator)
├── imagens/
│   ├── hero-image.png (FLUX)
│   └── screenshots/ (Visual Designer)
└── RELATORIO-FINAL.md
```

---

## 🎓 Recursos Adicionais

- **Open Design Docs:** https://github.com/nexu-io/open-design
- **Prompts Prontos:** `.opencode/templates/open-design-prompts.md`
- **Exemplos:** `projetos/_modelo/exemplos/open-design/`

---

**Use Open Design para materializar conteúdo textual em protótipos visuais profissionais, sempre após maximizar o conteúdo!**
