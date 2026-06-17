---
name: materialize-content
description: 'Skill de materialização — guia quando e como usar cada ferramenta para materializar conteúdo (Open Design, FLUX, Pictify, document-generator, etc.)'
triggers:
  - 'como materializar'
  - 'qual ferramenta usar'
  - 'quando usar open design vs flux'
  - 'materialize este conteúdo'
  - 'transforme em visual'
---

# Materialize Content

**Objetivo:** Guiar a escolha da ferramenta certa para materializar conteúdo textual em entregas visuais/documentais profissionais.

## 🎯 Árvore de Decisão: Qual Ferramenta Usar?

```
Conteúdo textual pronto
│
├─ É uma landing page ou protótipo web?
│  └─ Sim → Open Design
│
├─ É uma apresentação interativa?
│  └─ Sim → Open Design
│
├─ É um dashboard ou data viz?
│  └─ Sim → Open Design
│
├─ É um email template?
│  └─ Sim → Open Design
│
├─ É uma imagem única (banner, social media)?
│  ├─ Precisa de AI generativa? → FLUX
│  ├─ É template HTML → imagem? → Pictify
│  └─ É edição de imagem existente? → ChangeImageTo/Chompute/Nano Banana
│
├─ É um documento Word/PDF simples?
│  └─ Sim → document-generator
│
├─ É um PDF avançado (merge, encrypt, QR)?
│  └─ Sim → pdf-toolkit
│
└─ É um post de texto puro?
   └─ Sim → Não precisa materialização, use subagent diretamente
```

---

## 📊 Matriz de Ferramentas

| Tipo de Entrega | Ferramenta Principal | Ferramentas de Apoio | Quando Usar |
|----------------|---------------------|---------------------|-------------|
| **Landing Page** | Open Design | FLUX (imagens), Pictify (variações) | Protótipos web, páginas de conversão |
| **Apresentação** | Open Design | FLUX (backgrounds), document-generator (PDF) | Pitch decks, webinars, propostas |
| **Dashboard** | Open Design | - | Relatórios interativos, data viz |
| **Email Template** | Open Design | Pictify (variações) | Newsletters, campanhas |
| **Banner/Ad** | FLUX ou Pictify | ChangeImageTo (edição) | Social media ads, display ads |
| **Social Media Post** | Pictify ou FLUX | ChangeImageTo (resize) | Posts com visual custom |
| **Whitepaper** | document-generator | Open Design (layout rico) | Documentos longos formatados |
| **E-book** | Open Design + document-generator | FLUX (ilustrações) | E-books com design rico |
| **Relatório** | document-generator | pdf-toolkit (pós-processamento) | Relatórios anuais, cases |
| **Infográfico** | Open Design | FLUX (ícones custom) | Data visualization estática |

---

## 🔄 Workflow de Materialização

### Fase 1: Validação de Conteúdo (ANTES de materializar)

**Princípio:** "Nunca materialize conteúdo incompleto."

#### Checklist de Prontidão

Antes de escolher ferramenta, valide:

**Para Landing Pages:**
- [ ] Headline e subtítulo definidos
- [ ] Copy de todas as seções escrita
- [ ] CTAs definidos
- [ ] Prova social (depoimentos, números)
- [ ] FAQ completo

**Para Apresentações:**
- [ ] Estrutura de slides definida
- [ ] Conteúdo de cada slide escrito
- [ ] Dados e gráficos identificados
- [ ] Notas do orador escritas

**Para Imagens:**
- [ ] Conceito visual definido
- [ ] Texto overlay (se houver) escrito
- [ ] Dimensões especificadas
- [ ] Estilo visual definido

**Para Documentos:**
- [ ] Conteúdo completo escrito
- [ ] Estrutura de seções definida
- [ ] Tabelas e dados formatados
- [ ] Imagens identificadas

### Fase 2: Escolha da Ferramenta

Use a árvore de decisão acima para escolher:

1. **Ferramenta principal** (onde vai criar)
2. **Ferramentas de apoio** (para gerar assets)
3. **Ferramentas de pós-processamento** (para refinar)

### Fase 3: Execução

#### Exemplo: Landing Page

```
1. Open Design (ferramenta principal)
   - Crie layout
   - Use prompts prontos
   - Exporte HTML

2. FLUX (ferramenta de apoio)
   - Gere hero image
   - Gere backgrounds
   - Gere ícones custom

3. Pictify (ferramenta de apoio)
   - Crie variações A/B
   - Gere thumbnails

4. document-generator (pós-processamento)
   - Converta HTML → PDF
   - Adicione metadados
```

#### Exemplo: Apresentação

```
1. Open Design (ferramenta principal)
   - Crie slides interativos
   - Use templates de apresentação
   - Exporte PDF

2. FLUX (ferramenta de apoio)
   - Gere backgrounds
   - Gere imagens de capa

3. pdf-toolkit (pós-processamento)
   - Adicione página de números
   - Adicione marca d'água
   - Proteja com senha (se necessário)
```

#### Exemplo: Banner para Social Media

```
1. FLUX (ferramenta principal)
   - Gere imagem base
   - Use prompt específico para banner

2. ChangeImageTo (pós-processamento)
   - Resize para diferentes plataformas
   - Adicione texto overlay (se necessário)
   - Otimize para web
```

### Fase 4: Validação e Entrega

#### Checklist de Qualidade

- [ ] Conteúdo está completo e revisado?
- [ ] Visual está alinhado com brand voice?
- [ ] Exportou em todos os formatos necessários?
- [ ] Testou responsividade (se aplicável)?
- [ ] Otimizou para web (tamanho de arquivo)?
- [ ] Documentou no relatório final?

---

## 🎨 Casos de Uso Comuns

### Caso 1: Campanha de Lançamento

**Entregas necessárias:**
- Landing page
- 10 posts para LinkedIn (com visuais)
- Sequência de 5 emails
- Apresentação para stakeholders
- Banners para ads

**Workflow de materialização:**

```
1. Landing Page
   → Open Design (layout)
   → FLUX (hero image)
   → Export: HTML + PDF

2. Posts LinkedIn
   → Pictify (templates HTML → imagem)
   → ChangeImageTo (resize para 1200x627)
   → Export: 10 PNGs

3. Emails
   → Open Design (templates)
   → Pictify (variações)
   → Export: 5 HTMLs

4. Apresentação
   → Open Design (slides interativos)
   → FLUX (backgrounds)
   → pdf-toolkit (pós-processamento)
   → Export: PDF

5. Banners
   → FLUX (geração AI)
   → ChangeImageTo (resize para diferentes tamanhos)
   → Export: PNGs em múltiplos tamanhos
```

### Caso 2: Whitepaper Técnico

**Entregas necessárias:**
- Whitepaper (3000 palavras, PDF)
- Cover image
- Gráficos e diagramas
- Landing page para download

**Workflow de materialização:**

```
1. Whitepaper
   → Open Design (layout rico com tabelas, gráficos)
   → FLUX (ilustrações custom)
   → document-generator (PDF final)
   → Export: PDF

2. Cover Image
   → FLUX (geração AI)
   → ChangeImageTo (resize para 1200x630)
   → Export: PNG

3. Gráficos
   → Open Design (data viz)
   → Export: PNGs

4. Landing Page
   → Open Design (layout)
   → FLUX (hero image)
   → Export: HTML
```

### Caso 3: Relatório Anual

**Entregas necessárias:**
- Relatório completo (50+ páginas, PDF)
- Dashboard interativo
- Apresentação executiva
- Social media cards com highlights

**Workflow de materialização:**

```
1. Relatório
   → Open Design (layout profissional)
   → FLUX (ilustrações, fotos)
   → document-generator (PDF final)
   → pdf-toolkit (página de números, marca d'água)
   → Export: PDF

2. Dashboard
   → Open Design (data viz interativo)
   → Export: HTML

3. Apresentação
   → Open Design (slides)
   → pdf-toolkit (pós-processamento)
   → Export: PDF

4. Social Media Cards
   → Pictify (templates HTML → imagem)
   → Export: 10 PNGs
```

---

## 🔧 Integração entre Ferramentas

### Open Design → FLUX
```
1. Crie layout no Open Design
2. Identifique gaps de imagens
3. Use FLUX para gerar:
   - Hero images
   - Backgrounds
   - Ícones custom
4. Importe no Open Design
5. Exporte final
```

### Open Design → Pictify
```
1. Crie template no Open Design
2. Exporte HTML
3. Use Pictify para gerar variações:
   - Diferentes cores
   - Diferentes textos
   - A/B testing
4. Salve variações
```

### FLUX → ChangeImageTo
```
1. Gere imagem com FLUX
2. Use ChangeImageTo para:
   - Resize para diferentes plataformas
   - Crop para enquadramento
   - Upscale para alta resolução
   - Denoise para limpar
3. Salve versões otimizadas
```

### document-generator → pdf-toolkit
```
1. Gere PDF com document-generator
2. Use pdf-toolkit para:
   - Adicionar página de números
   - Adicionar marca d'água
   - Proteger com senha
   - Adicionar QR code
   - Merge com outros PDFs
3. Salve PDF final
```

---

## 📋 Templates de Decisão

### Template: "Preciso de uma landing page"

```
Decisão: Open Design

Por quê:
- Precisa de layout interativo
- Exporta HTML para desenvolvimento
- Permite iteração rápida

Ferramentas de apoio:
- FLUX: hero image, backgrounds
- Pictify: variações A/B
- document-generator: PDF da página

Workflow:
1. Complete copy (Content Creator)
2. Abra Open Design
3. Use prompt: "Crie uma landing page para [produto]"
4. Importe imagens do FLUX
5. Exporte HTML + PDF
```

### Template: "Preciso de 10 posts para LinkedIn"

```
Decisão: Pictify (templates) ou FLUX (AI)

Por quê:
- Pictify: se tem template HTML reutilizável
- FLUX: se precisa de imagens únicas geradas por AI

Ferramentas de apoio:
- ChangeImageTo: resize para 1200x627
- Open Design: se precisa de layout custom

Workflow:
1. Complete copy dos posts (Social Media Manager)
2. Escolha: Pictify (template) ou FLUX (AI)
3. Gere 10 imagens
4. Use ChangeImageTo para resize
5. Salve em output/social-media/visuais/
```

### Template: "Preciso de um whitepaper"

```
Decisão: Open Design + document-generator

Por quê:
- Open Design: layout rico com tabelas, gráficos
- document-generator: PDF profissional

Ferramentas de apoio:
- FLUX: ilustrações custom
- pdf-toolkit: pós-processamento

Workflow:
1. Complete conteúdo (Content Creator)
2. Abra Open Design
3. Use prompt: "Crie um whitepaper sobre [tema]"
4. Importe ilustrações do FLUX
5. Exporte PDF
6. Use pdf-toolkit para página de números
7. Salve em output/documentos/
```

---

## ✅ Checklist Final

Antes de entregar materialização:

- [ ] Conteúdo textual estava completo antes de materializar?
- [ ] Escolheu a ferramenta certa para o tipo de entrega?
- [ ] Usou ferramentas de apoio quando necessário?
- [ ] Fez pós-processamento para refinar?
- [ ] Exportou em todos os formatos necessários?
- [ ] Otimizou para web (tamanho de arquivo)?
- [ ] Testou responsividade (se aplicável)?
- [ ] Documentou no relatório final?
- [ ] Validou com usuário?

---

## 🚨 Red Flags

**Nunca:**
- Materialize conteúdo incompleto
- Use ferramenta errada para o tipo de entrega
- Pule pós-processamento
- Esqueça de otimizar para web
- Não documente no relatório

**Sempre:**
- Valide conteúdo antes de materializar
- Use árvore de decisão para escolher ferramenta
- Combine ferramentas quando necessário
- Otimize para web
- Documente entregas

---

## 📖 Recursos Adicionais

- **Open Design Workflow:** `.opencode/skills/open-design-workflow/SKILL.md`
- **Prompts Prontos:** `.opencode/templates/open-design-prompts.md`
- **Instruções Visuais:** `.opencode/instructions/visual-marketing.instructions.md`

---

**Materialize conteúdo apenas após maximizá-lo textualmente, usando a ferramenta certa para cada tipo de entrega!**
