---
name: write-email-campaign
description: 'Cria campanhas de email marketing — sequências de nutrição, lançamento, vendas, boas-vindas, reengajamento'
---

# Write Email Campaign

Skill para criar campanhas de email marketing completas.

---

## Quando Usar

- Criar sequência de boas-vindas (onboarding)
- Criar campanha de nutrição (lead nurturing)
- Criar sequência de lançamento de produto
- Criar campanha de vendas/promoção
- Criar campanha de reengajamento
- Criar newsletters regulares

---

## Workflow

### 1. Definir Tipo de Campanha

| Tipo | Emails | Objetivo |
|------|--------|----------|
| **Boas-vindas** | 3-5 | Onboarding, apresentar marca |
| **Nutrição** | 5-8 | Educar, construir relacionamento |
| **Lançamento** | 5-7 | Gerar anticipation, converter |
| **Vendas** | 3-5 | Converter leads em clientes |
| **Reengajamento** | 2-3 | Recuperar leads inativos |
| **Newsletter** | Recorrente | Manter relacionamento |

### 2. Ler Contexto do Projeto

- `briefing.md` — objetivo e público
- `brand-voice.md` — tom e personalidade
- `personas.md` — quem vai receber

### 3. Estruturar a Sequência

#### Campanha de Boas-vindas (5 emails)

```
Email 1: Boas-vindas + entrega do prometido (imediato)
Email 2: História da marca + valores (dia 2)
Email 3: Conteúdo de valor + dica prática (dia 4)
Email 4: Prova social + case de sucesso (dia 7)
Email 5: Oferta suave + CTA (dia 10)
```

#### Campanha de Lançamento (7 emails)

```
Email 1: Antecipação — "Algo grande está vindo" (D-7)
Email 2: Problema — A dor que vamos resolver (D-5)
Email 3: Bastidores — Como criamos a solução (D-3)
Email 4: Lançamento — "Está no ar!" (D-Day)
Email 5: Prova social — Primeiros resultados (D+2)
Email 6: FAQ — Respostas para objeções (D+4)
Email 7: Última chance — Urgência (D+6)
```

#### Campanha de Nutrição (6 emails)

```
Email 1: Conteúdo educativo #1 (topo de funil)
Email 2: Conteúdo educativo #2 (topo de funil)
Email 3: Case de sucesso (meio de funil)
Email 4: Conteúdo aprofundado (meio de funil)
Email 5: Comparação/diferenciais (fundo de funil)
Email 6: Oferta + CTA (fundo de funil)
```

### 4. Escrever Cada Email

#### Template de Email

```markdown
## Email [N]: [Título interno]

**Assunto:** [6-10 palavras, curiosidade ou benefício]
**Preview text:** [40-90 caracteres]
**Dia de envio:** [Dia X ou data]
**Segmento:** [Qual persona/lista]

---

[Saudação personalizada]

[Hook — 1-2 linhas que conectam com a dor/desejo]

[Corpo — uma ideia principal. Entregue valor.]

[Micro-story ou exemplo prático]

[CTA — um único CTA, claro e específico]

[Assinatura pessoal]

P.S. [Linha extra com urgência, curiosidade ou bônus]
```

### 5. Salvar no Diretório Correto

- Emails → `output/emails/`
- Sequência completa → `output/emails/campanha-nome.md`

---

## Regras de Email Marketing

### Assunto (Subject Line)
- 6-10 palavras (40-50 caracteres)
- Curiosidade OU benefício (não ambos)
- Nunca use CAIXA ALTA inteira
- Evite spam triggers: "GRÁTIS", "!!!", "$$$"

### Preview Text
- 40-90 caracteres
- Complemento do assunto (não repetição)
- Dê mais contexto sobre o email

### Corpo
- Uma ideia por email
- Parágrafos curtos (2-3 linhas máx)
- Quebras de linha frequentes
- Mobile-first (60%+ abrem no celular)

### CTA
- Um único CTA por email
- Verbo de ação + benefício
- Primeira pessoa: "Quero meu ebook" > "Baixe o ebook"
- Repita o CTA 2x em emails longos

### P.S.
- Sempre inclua P.S.
- É a segunda coisa mais lida depois do assunto
- Use para: urgência, bônus, curiosidade, depoimento

---

## Exemplos de Assunto por Tipo

### Boas-vindas
- "Bem-vindo! Aqui está o que prometemos"
- "[Nome], seu guia está aqui (+ surpresa)"
- "Você pediu, nós entregamos 📦"

### Nutrição
- "O erro que 90% dos [profissionais] cometem"
- "Como [resultado] em [tempo] (sem [objeção])"
- "[Número] insights sobre [tema]"

### Lançamento
- "Está chegando. E vai mudar tudo."
- "Finalmente: [solução] para [problema]"
- "[Nome], é hoje! 🚀"

### Vendas
- "Últimas 48 horas: [oferta]"
- "Seu [resultado] está a um clique"
- "Por que [X] profissionais escolheram [produto]"

### Reengajamento
- "Faz tempo... sentimos sua falta"
- "Você ainda precisa de [solução]?"
- "Mudamos. Para melhor."

---

## Checklist

- [ ] Assunto com 6-10 palavras?
- [ ] Preview text complementar?
- [ ] Uma ideia por email?
- [ ] CTA único e claro?
- [ ] P.S. incluído?
- [ ] Mobile-friendly (parágrafos curtos)?
- [ ] Sequência lógica (progressão de funil)?
- [ ] Brand voice respeitado?
- [ ] Links testados?
