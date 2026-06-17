---
description: 'Guia de transição texto → visual — como maximizar conteúdo textual antes de materializar visualmente'
applyTo: '**'
---

# Content to Visual — Guia de Transição

**Princípio:** "Preencha todos os gaps no texto antes de materializar visualmente."

## 🎯 Filosofia

**Por que maximizar texto antes de visualizar?**

1. **Clareza:** Texto completo revela gaps de conteúdo
2. **Eficiência:** Evita retrabalho visual
3. **Qualidade:** Visual serve ao conteúdo, não o contrário
4. **Consistência:** Mensagem unificada em todas as peças

**Regra de ouro:** "Se não está escrito, não está pronto para ser visualizado."

---

## 📋 Checklist de Maximização por Tipo

### Landing Pages

#### Antes de abrir Open Design, valide:

**Hero Section:**
- [ ] Headline principal (máx 10 palavras)
- [ ] Subheadline (1-2 frases)
- [ ] CTA principal (texto do botão)
- [ ] Visual identificado (hero image, vídeo, ilustração)

**Prova Social:**
- [ ] 3-5 depoimentos completos (quote + nome + cargo + empresa)
- [ ] Logos de clientes (6-12 logos)
- [ ] Números de impacto (ex: "10.000+ clientes")

**Problema/Solução:**
- [ ] 3-5 bullets descrevendo o problema
- [ ] 3-5 bullets descrevendo a solução
- [ ] Dado impactante (estatística)

**Features:**
- [ ] 6-9 features com título + descrição curta
- [ ] Ícones identificados para cada feature

**Pricing:**
- [ ] 3 planos com nome + preço
- [ ] Lista de features para cada plano
- [ ] Destaque do plano recomendado

**FAQ:**
- [ ] 5-7 perguntas frequentes
- [ ] Respostas completas para cada pergunta

**CTA Final:**
- [ ] Headline de fechamento
- [ ] Subheadline motivacional
- [ ] CTA repetido

### Apresentações

#### Antes de abrir Open Design, valide:

**Estrutura:**
- [ ] Número de slides definido (10-15 ideal)
- [ ] Sequência lógica de slides

**Para cada slide:**
- [ ] Título do slide (máx 8 palavras)
- [ ] Conteúdo principal (máx 50 palavras)
- [ ] Visual identificado (gráfico, imagem, ícone)
- [ ] Notas do orador (2-3 frases)

**Dados e gráficos:**
- [ ] Dados reais ou mockups preparados
- [ ] Tipo de gráfico definido (barras, linhas, pizza)
- [ ] Insight principal de cada gráfico

**Prova social:**
- [ ] Logos de clientes (se aplicável)
- [ ] Depoimentos (se aplicável)
- [ ] Cases de sucesso (se aplicável)

### Dashboards

#### Antes de abrir Open Design, valide:

**KPIs:**
- [ ] 4-8 KPIs principais definidos
- [ ] Valores atuais e variações (%)
- [ ] Ícones para cada KPI

**Gráficos:**
- [ ] 3-5 gráficos identificados
- [ ] Dados reais ou mockups
- [ ] Tipo de gráfico para cada um
- [ ] Período de tempo definido

**Tabelas:**
- [ ] Colunas definidas
- [ ] 5-10 linhas de dados
- [ ] Funcionalidades (ordenação, filtro, paginação)

**Filtros:**
- [ ] Filtros disponíveis (data, categoria, etc.)
- [ ] Valores padrão definidos

### Email Templates

#### Antes de abrir Open Design, valide:

**Header:**
- [ ] Logo (arquivo ou URL)
- [ ] Título do email
- [ ] Subtítulo (opcional)

**Corpo:**
- [ ] Saudação personalizada
- [ ] 2-3 parágrafos de conteúdo
- [ ] CTA principal (texto do botão)
- [ ] CTA secundário (opcional)

**Footer:**
- [ ] Links sociais (3-5 links)
- [ ] Link de descadastro
- [ ] Endereço da empresa

### Documentos Visuais (Whitepapers, E-books)

#### Antes de abrir Open Design, valide:

**Estrutura:**
- [ ] Sumário completo
- [ ] Capítulos/seções definidos
- [ ] Número estimado de páginas

**Conteúdo:**
- [ ] Texto completo escrito
- [ ] Tabelas formatadas
- [ ] Gráficos identificados
- [ ] Imagens e ilustrações listadas

**Metadados:**
- [ ] Título e subtítulo
- [ ] Autor(es)
- [ ] Data de publicação
- [ ] Versão

---

## 🔄 Processo de Transição

### Passo 1: Complete o Conteúdo Textual

Use subagents para criar conteúdo completo:

```
@content-creator "Escreva copy completa para landing page de [produto]"
```

**Valide:**
- Todos os gaps preenchidos?
- Copy revisada?
- CTAs definidos?

### Passo 2: Mapeie Seções → Componentes

Crie documento de mapeamento:

```markdown
## Mapeamento: Landing Page → Open Design

### Seção 1: Hero
- Componente Open Design: Hero Section
- Conteúdo:
  - Headline: "[headline]"
  - Subheadline: "[subtítulo]"
  - CTA: "[botão]"
- Visual: [hero image do FLUX]

### Seção 2: Prova Social
- Componente Open Design: Testimonials Grid
- Conteúdo:
  - Depoimento 1: "[quote]" — [Nome, Cargo]
  - Depoimento 2: "[quote]" — [Nome, Cargo]
  - Depoimento 3: "[quote]" — [Nome, Cargo]
- Layout: grid 3 colunas

[... continue para todas as seções]
```

### Passo 3: Identifique Assets Visuais Necessários

Liste todos os assets que precisa gerar:

```markdown
## Assets Visuais Necessários

### Imagens
- Hero image (1920x1080) → FLUX
- 3 backgrounds de seção (1920x600) → FLUX
- 6 ícones de features (100x100) → FLUX ou Open Design

### Gráficos
- Gráfico de crescimento (800x400) → Open Design
- Tabela comparativa (600x300) → Open Design

### Outros
- Logo (SVG) → já disponível
- 3 fotos de depoimentos (200x200) → já disponível
```

### Passo 4: Gere Assets com Ferramentas de Apoio

Use FLUX, Pictify, etc. para gerar assets:

```
@visual-designer "Gere hero image para landing page de [produto]"
```

### Passo 5: Abra Open Design e Monte

1. Abra Open Design
2. Crie novo projeto
3. Use prompts prontos (veja biblioteca)
4. Importe assets gerados
5. Exporte HTML/PDF

---

## 🎨 Exemplos de Transição

### Exemplo 1: Landing Page de SaaS

**Conteúdo textual completo:**

```markdown
# Landing Page: Produto X

## Hero
- Headline: "Automatize seu marketing em minutos"
- Subheadline: "A plataforma all-in-one que simplifica campanhas, economiza tempo e aumenta conversões"
- CTA: "Comece grátis"

## Prova Social
- "Usado por 10.000+ empresas"
- Logos: [6 logos]

## Problema
- "Marketing manual é lento e propenso a erros"
- "73% dos marketers gastam 10+ horas por semana em tarefas repetitivas"
- "Campanhas fragmentadas geram resultados inconsistentes"

## Solução
- "Automação inteligente que aprende com seus dados"
- "Templates prontos para qualquer tipo de campanha"
- "Analytics unificado para otimização contínua"

[... continua com todas as seções]
```

**Mapeamento para Open Design:**

```markdown
## Mapeamento: Produto X → Open Design

### Seção 1: Hero
- Componente: Hero Section (centralizado com imagem de fundo)
- Conteúdo: [headline + subtítulo + CTA]
- Visual: hero image do FLUX (prompt: "marketing automation dashboard, modern, clean")

### Seção 2: Prova Social
- Componente: Logo Grid (6 logos em 2 linhas)
- Conteúdo: [6 logos já disponíveis]

### Seção 3: Problema
- Componente: Feature List (3 bullets com ícones)
- Conteúdo: [3 problemas]
- Visual: ícones de "warning" do Open Design

[... continua]
```

**Assets a gerar:**

```markdown
## Assets

### FLUX
- Hero image: "marketing automation dashboard, modern UI, blue and white, 1920x1080"
- Background seção solução: "abstract gradient, blue to purple, 1920x600"

### Open Design
- 6 ícones de features (usar biblioteca de ícones)
- Gráfico de crescimento (usar dados mockup)
```

### Exemplo 2: Apresentação de Pitch

**Conteúdo textual completo:**

```markdown
# Pitch Deck: Startup Y

## Slide 1: Capa
- Título: "Startup Y"
- Subtítulo: "Revolucionando o mercado de [segmento]"
- Data: Janeiro 2026

## Slide 2: Problema
- Título: "O Problema"
- Bullets:
  - "Processos manuais custam R$ X bilhões por ano"
  - "80% das empresas ainda usam planilhas"
  - "Falta de visibilidade gera decisões ruins"
- Dado: "R$ 50 bilhões perdidos anualmente"

[... continua com todos os slides]
```

**Mapeamento para Open Design:**

```markdown
## Mapeamento: Startup Y → Open Design

### Slide 1: Capa
- Componente: Title Slide (centralizado)
- Conteúdo: [título + subtítulo + data]
- Visual: logo + gradiente de fundo

### Slide 2: Problema
- Componente: Split Layout (texto esquerda, visual direita)
- Conteúdo: [3 bullets + dado]
- Visual: ícone de "warning" + gráfico de mercado

[... continua]
```

---

## ✅ Validação Final

Antes de materializar, confirme:

- [ ] Todo o conteúdo textual está completo?
- [ ] Mapeamento seções → componentes está feito?
- [ ] Assets visuais necessários estão identificados?
- [ ] Prompts prontos estão selecionados?
- [ ] Ferramenta principal está escolhida?
- [ ] Ferramentas de apoio estão planejadas?

Se tudo ✓, pode abrir o Open Design!

---

## 🚨 Red Flags

**Nunca:**
- Abra ferramenta visual sem conteúdo completo
- Use placeholder text na entrega final
- Pule mapeamento de seções
- Esqueça de identificar assets necessários

**Sempre:**
- Complete texto primeiro
- Mapeie antes de visualizar
- Identifique todos os assets
- Use prompts prontos

---

**Maximize conteúdo textual antes de materializar visualmente — a qualidade do visual depende da completude do texto!**
