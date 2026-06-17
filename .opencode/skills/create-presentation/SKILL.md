---
name: create-presentation
description: 'Cria apresentações e pitch decks com storytelling visual — estrutura, conteúdo de slides, notas de orador'
---

# Create Presentation

Skill para criar apresentações profissionais com storytelling visual.

---

## Quando Usar

- Criar pitch decks para investidores ou clientes
- Criar apresentações corporativas
- Criar webinars educativos
- Criar propostas visuais
- Criar apresentações de resultados

---

## Workflow

### 1. Definir Tipo e Audiência

| Tipo | Slides | Audiência | Foco |
|------|--------|-----------|------|
| **Pitch Deck** | 10-15 | Investidores, parceiros | Problema, solução, mercado, tração |
| **Corporativa** | 10-20 | Stakeholders, clientes | Contexto, desafio, solução, resultados |
| **Webinar** | 30-50 | Leads, público geral | Educação, cases, CTA |
| **Proposta** | 15-25 | Cliente específico | Desafio, solução, investimento, ROI |

### 2. Ler Contexto do Projeto

- `briefing.md` — objetivo e público
- `brand-voice.md` — tom e personalidade
- `personas.md` — quem é a audiência
- `assets/` — logos, cores, fontes

### 3. Definir Estrutura

#### Pitch Deck (10 slides)

```
1. Capa — Título + subtítulo + logo
2. Problema — A dor que resolvemos (1 frase + dado)
3. Solução — Nossa abordagem (1 frase + visual)
4. Como funciona — 3-4 passos visuais
5. Mercado — Tamanho e oportunidade (gráfico)
6. Tração — Resultados até agora (métricas)
7. Prova social — Logos, depoimentos
8. Diferenciais — Por que nós (3 bullets)
9. Equipe — Quem faz acontecer (fotos + cargos)
10. Ask/CTA — O que pedimos + próximo passo
```

#### Apresentação Corporativa (12 slides)

```
1. Capa
2. Agenda
3. Contexto/Cenário atual
4. Desafio/Problema
5. Seção 1 — [Tema]
6. Seção 2 — [Tema]
7. Seção 3 — [Tema]
8. Resultados/Cases
9. Análise/Insights
10. Recomendações
11. Próximos passos
12. Contato/Q&A
```

### 4. Criar Conteúdo de Cada Slide

Para cada slide, defina:

```markdown
## Slide [N]: [Título]

**Tipo:** [Capa / Problema / Solução / Dados / Quote / Lista / CTA]
**Layout:** [Texto / Imagem / Gráfico / Misto]

### Conteúdo
[Texto do slide — máx 50 palavras]

### Visual
[Descrição da imagem/gráfico — ou prompt para FLUX]

### Notas do Orador
[O que falar — 2-3 frases de contexto]
```

### 5. Gerar Documento Final

Opções de exportação:
1. **Markdown** → salve em `output/apresentacoes/`
2. **PDF** → use document-generator ou pdf-toolkit
3. **HTML** → use Pictify para gerar slides visuais

### 6. Salvar

- Apresentação → `output/apresentacoes/`
- Imagens de slide → `output/imagens/`

---

## Regras de Slide

### Conteúdo
- **1 ideia por slide** — nunca sobrecarregue
- **Máx 50 palavras** — slides são apoio, não roteiro
- **Fonte mín 24pt** — legível a 3 metros
- **Contraste alto** — visível em qualquer projetor

### Visual
- **Hierarquia clara** — título > subtítulo > corpo
- **Espaço em branco** — respiro, não desperdício
- **Consistência** — mesma paleta, fontes e estilo
- **Animações sutis** — fade in/out, sem exageros

### Storytelling
- **Comece com impacto** — dado, pergunta, afirmação forte
- **Use antes/depois** — mostre transformação
- **Inclua prova social** — logos, depoimentos, dados
- **Termine com CTA** — próximo passo claro

---

## Templates de Slide

### Slide de Capa
```markdown
# [Título Impactante]
## [Subtítulo com promessa]

[Logo] | [Data] | [Apresentador]
```

### Slide de Problema
```markdown
## O Problema

[1 frase que descreve a dor]

[Dado impactante — ex: "73% das empresas perdem..."]

[Visual: imagem ou ícone que representa a dor]
```

### Slide de Solução
```markdown
## Nossa Solução

[1 frase que descreve a solução]

[3 benefícios em bullets curtos]

[Visual: diagrama ou screenshot]
```

### Slide de Dados
```markdown
## Resultados

[Gráfico ou tabela com métricas]

[1 insight principal]

[Fonte dos dados]
```

### Slide de CTA
```markdown
## Próximo Passo

[Ação desejada — 1 frase]

[Contato: email, telefone, site]

[QR code para link (opcional)]
```

---

## Checklist

- [ ] Estrutura lógica (início, meio, fim)?
- [ ] 1 ideia por slide?
- [ ] Máx 50 palavras por slide?
- [ ] Fonte mín 24pt?
- [ ] Contraste alto?
- [ ] Animações sutis?
- [ ] Slides numerados?
- [ ] CTA final claro?
- [ ] Notas de orador incluídas?
- [ ] Tempo estimado adequado?
