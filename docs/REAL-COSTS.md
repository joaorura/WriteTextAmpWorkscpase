# 💰 REALIDADE DOS CUSTOS — O que você PRECISA pagar

**Data:** Junho 2026  
**Honestidade total:** Aqui está o que realmente custa dinheiro vs o que é grátis.

---

## ✅ GRÁTIS — Não Precisa de NADA (Sem Conta, Sem Token, Sem Pagamento)

Estes serviços funcionam **localmente no seu notebook** via npm/pip, sem depender de API externa:

| Serviço | O que faz | Como roda |
|---------|-----------|-----------|
| **document-generator** | Gera Word (.docx) e PDF profissional | `npx document-generator-mcp` (local) |
| **pdf-toolkit** | PDF avançado (merge, split, encrypt, QR) | `npx @aryanbv/pdf-toolkit-mcp` (local) |
| **Docling** | Converte PDF/DOCX/PPTX → Markdown | `pip install docling-serve` (local) |
| **Open Design** | Prototipagem visual (landing pages, dashboards) | Download da release do GitHub (local) |

**Custo: R$ 0,00** — Para sempre. Sem limite de uso.

---

## ⚠️ FREE TIER — Precisa Criar Conta (Mas Não Paga Nada para Começar)

Estes serviços têm **API na nuvem**, precisam de conta, mas oferecem uso gratuito limitado:

| Serviço | O que faz | Limite Grátis | Precisa de |
|---------|-----------|---------------|------------|
| **FLUX** | Geração de imagens AI (qualidade profissional) | ~100 imagens/mês | Conta em [bfl.ai](https://bfl.ai) + OAuth |
| **Pictify** | Converte templates HTML em imagens | ~50 renders/mês | Conta em [pictify.io](https://pictify.io) + API Key |
| **Brave Search** | Pesquisa web para tendências e concorrência | 2000 queries/mês | Conta em [brave.com/search/api](https://brave.com/search/api/) + API Key |
| **ChangeImageTo** | 16 ferramentas de edição de imagem | ~100 operações/mês | Conta no site |

**Custo: R$ 0,00** — Enquanto estiver dentro do free tier. Depois, os planos pagos:

| Serviço | Custo Após Free Tier |
|---------|---------------------|
| **FLUX** | ~$0.04 por imagem (≈R$0,22) |
| **Pictify** | $19/mês (1000 renders) |
| **Brave Search** | $5/mês (5000 queries) |
| **ChangeImageTo** | $9/mês (1000 operações) |

---

## 💲 PRECISA PAGAR — Sem Free Tier (ou Free Tier Muito Limitado)

| Serviço | Custo | Precisa de |
|---------|-------|------------|
| **Twitter/X API** | $100/mês (Basic) | Developer account + API keys |
| **SEOcrawl** | $29/mês | Conta + API Key |
| **OpenSEO** | $19/mês | Conta + API Key |

---

## 🔗 Redes Sociais — Grátis (Mas Precisa de Conta Existente)

Estes serviços usam **OAuth** (login via navegador) com contas que você já tem:

| Serviço | Requer | Custo |
|---------|--------|-------|
| **LinkedIn** | Conta LinkedIn (qualquer pessoa tem) | Grátis |
| **Instagram** | Conta Instagram (qualquer pessoa tem) | Grátis |
| **Facebook** | Conta Facebook (qualquer pessoa tem) | Grátis |
| **Google Drive** | Conta Google (15GB grátis) | Grátis |
| **Slack** | Workspace Slack (free tier existe) | Grátis |
| **Notion** | Conta Notion (free tier existe) | Grátis |

**Nota REAL:** Os MCPs de redes sociais (`linkedin`, `instagram`, `facebook`, `twitter`) que configurei no `opencode.jsonc` usam URLs **placeholder** (`https://mcp.linkedin.com`, `https://mcp.twitter.com`, etc). Essas URLs **NÃO são oficiais**. Para usar redes sociais de fato, você precisaria de MCPs comunitários específicos ou APIs oficiais diretamente.

---

## 📊 RESUMO FINANCEIRO REAL

### Cenário 1: Gastando R$ 0,00 (100% Grátis)

Use apenas:
- ✅ document-generator (local, grátis)
- ✅ pdf-toolkit (local, grátis)
- ✅ Docling (local, grátis)
- ✅ Open Design (local, grátis)
- ✅ FLUX (free tier, 100 imagens/mês)
- ✅ Brave Search (free tier, 2000 queries/mês)

**Você consegue fazer MUITA coisa sem pagar nada.** Só conteúdo textual + documentos + protótipos visuais já cobrem 80% do trabalho de marketing.

### Cenário 2: Investimento Mínimo (~R$ 50/mês)

Adicione ao cenário 1:
- 💰 FLUX ($10-20/mês em créditos, ~250-500 imagens)

**Só de ter imagens AI profissionais ilimitadas, você já cobre 95% dos casos.**

### Cenário 3: Profissional Completo (~R$ 200/mês)

Adicione ao cenário 2:
- 💰 Pictify ($19/mês)
- 💰 Brave Search ($5/mês)
- 💰 ChangeImageTo ($9/mês)

**Cobre 99% dos casos de marketing digital.**

### Cenário 4: Agência (~R$ 500-1000/mês)

Adicione ao cenário 3:
- 💰 Twitter API ($100/mês)
- 💰 SEOcrawl ($29/mês)
- 💰 OpenSEO ($19/mês)
- 💰 FLUX mais créditos

---

## 🔑 O Que Você Precisa Fazer Agora (Checklist Real)

### Para começar GRÁTIS (R$ 0,00):

1. ✅ **Nada.** Execute `.\bootstrap.ps1` e comece a usar.
2. ✅ Os serviços locais (document-generator, pdf-toolkit, Docling, Open Design) funcionam imediatamente.
3. ⚠️ Para FLUX (imagens AI), crie conta gratuita em [bfl.ai](https://bfl.ai) — 2 minutos.

### Para desbloquear imagens AI:

1. Crie conta em [bfl.ai](https://bfl.ai) → OAuth automático
2. Crie conta em [pictify.io](https://pictify.io) → Gere API Key → Coloque no `.env`

### Para pesquisa e SEO:

1. Crie conta em [brave.com/search/api](https://brave.com/search/api/) → Gere API Key → Coloque no `.env`

---

## 🎯 RECOMENDAÇÃO FINAL

**Comece 100% GRÁTIS.** Use apenas os serviços locais + FLUX free tier.

Depois de 1 mês usando, você vai saber EXATAMENTE o que precisa pagar, porque vai ver os limites sendo atingidos.

**Não compre nada antes de usar. O free tier é generoso o suficiente para começar.**
