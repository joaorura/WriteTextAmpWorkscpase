# 💰 Custos e Contas Necessárias

**Guia completo sobre quais serviços precisam de conta, o que é gratuito e o que é pago.**

---

## 📊 Resumo Rápido

| Categoria | Serviço | Conta? | Gratuito? | Limite Free | Custo Pago |
|-----------|---------|--------|-----------|-------------|------------|
| **Documentos** | document-generator | ❌ Não | ✅ Sim | Ilimitado | - |
| **Documentos** | pdf-toolkit | ❌ Não | ✅ Sim | Ilimitado | - |
| **Documentos** | Docling | ❌ Não | ✅ Sim | Ilimitado | - |
| **Visual** | Open Design | ❌ Não | ✅ Sim | Ilimitado | - |
| **Imagem AI** | FLUX | ✅ Sim | ⚠️ Free tier | ~100 imagens/mês | $0.04-0.08/imagem |
| **Imagem AI** | Pictify | ✅ Sim | ⚠️ Free tier | 50 renders/mês | $0.02-0.10/render |
| **Edição** | ChangeImageTo | ✅ Sim | ⚠️ Free tier | 100 operações/mês | $0.01-0.05/op |
| **Edição** | Chompute | ✅ Sim | ⚠️ Free tier | 50 imagens/mês | $0.02/imagem |
| **Edição** | Nano Banana | ✅ Sim | ⚠️ Free tier | 100 edições/mês | $0.03/edição |
| **Social** | LinkedIn | ✅ Sim (OAuth) | ✅ Sim | Ilimitado | - |
| **Social** | Twitter/X | ✅ Sim (API) | ⚠️ Free tier | 1500 tweets/mês | $100/mês (Basic) |
| **Social** | Instagram | ✅ Sim (OAuth) | ✅ Sim | Ilimitado | - |
| **Social** | Facebook | ✅ Sim (OAuth) | ✅ Sim | Ilimitado | - |
| **Produtividade** | Notion | ✅ Sim (API) | ⚠️ Free tier | 1000 requisições/mês | $8/mês (Plus) |
| **Produtividade** | Google Drive | ✅ Sim (OAuth) | ✅ Sim | 15GB storage | $1.99/mês (100GB) |
| **Produtividade** | Slack | ✅ Sim (OAuth) | ✅ Sim | Ilimitado | - |
| **Pesquisa** | Brave Search | ✅ Sim (API) | ⚠️ Free tier | 2000 queries/mês | $5/mês (5000 queries) |
| **Pesquisa** | SEOcrawl | ✅ Sim (API) | ⚠️ Free tier | 100 crawls/mês | $29/mês (Unlimited) |
| **Pesquisa** | OpenSEO | ✅ Sim (API) | ⚠️ Free tier | 500 queries/mês | $19/mês (Unlimited) |

---

## 🆓 Serviços 100% Gratuitos (Sem Conta)

Estes serviços **não precisam de conta** e são **completamente gratuitos**:

### 1. document-generator
- **O que faz:** Gera documentos Word e PDF profissionais
- **Custo:** Grátis, ilimitado
- **Conta:** Não precisa
- **Instalação:** Automática via npm

### 2. pdf-toolkit
- **O que faz:** Operações avançadas em PDF (merge, split, encrypt, QR codes)
- **Custo:** Grátis, ilimitado
- **Conta:** Não precisa
- **Instalação:** Automática via npm

### 3. Docling
- **O que faz:** Processamento de documentos (PDF, DOCX, imagens) para Markdown
- **Custo:** Grátis, ilimitado
- **Conta:** Não precisa
- **Instalação:** Automática via pip

### 4. Open Design
- **O que faz:** Prototipagem visual local (landing pages, apresentações, dashboards)
- **Custo:** Grátis, ilimitado (open source)
- **Conta:** Não precisa
- **Instalação:** Automática via script

---

## ⚠️ Serviços com Free Tier (Conta Necessária)

Estes serviços **precisam de conta** mas têm **plano gratuito limitado**:

### 1. FLUX (Black Forest Labs) - Geração de Imagens AI

**O que faz:** Gera imagens de alta qualidade usando AI

**Free Tier:**
- ✅ ~100 imagens por mês
- ✅ Modelos: flux-1.1-pro, flux-1.1-dev
- ❌ Modelo ultra não incluído

**Plano Pago:**
- 💰 $0.04 por imagem (flux-1.1-pro)
- 💰 $0.08 por imagem (flux-1.1-pro-ultra)
- 💰 Créditos pré-pagos disponíveis

**Como criar conta:**
1. Acesse: https://bfl.ai/pricing
2. Clique em "Get Started"
3. Crie conta (email ou Google)
4. Gere API key no dashboard

**Recomendação:** Comece com free tier. Se precisar de mais, compre créditos.

---

### 2. Pictify - Templates HTML para Imagens

**O que faz:** Converte templates HTML em imagens, GIFs e PDFs

**Free Tier:**
- ✅ 50 renders por mês
- ✅ Templates básicos
- ❌ Sem batch processing

**Plano Pago:**
- 💰 $0.02-0.10 por render (depende da complexidade)
- 💰 $19/mês (1000 renders + batch)
- 💰 $49/mês (5000 renders + priority)

**Como criar conta:**
1. Acesse: https://pictify.io
2. Clique em "Sign Up"
3. Crie conta
4. Gere API key em: https://pictify.io/dashboard/api-tokens

**Recomendação:** Free tier é suficiente para uso moderado.

---

### 3. ChangeImageTo - Edição de Imagem

**O que faz:** 16 ferramentas de edição (resize, crop, upscale, denoise, OCR, etc)

**Free Tier:**
- ✅ 100 operações por mês
- ✅ Todas as ferramentas disponíveis
- ❌ Sem batch processing

**Plano Pago:**
- 💰 $0.01-0.05 por operação (depende da ferramenta)
- 💰 $9/mês (1000 operações)
- 💰 $29/mês (5000 operações + batch)

**Como criar conta:**
1. Acesse: https://changeimageto.com
2. Clique em "Sign Up"
3. Crie conta
4. API key no dashboard

**Recomendação:** Free tier é generoso. Upgrade só se usar muito.

---

### 4. Chompute - Remoção de Fundo

**O que faz:** Remove fundo de imagens automaticamente

**Free Tier:**
- ✅ 50 imagens por mês
- ✅ Qualidade padrão
- ❌ Sem HD

**Plano Pago:**
- 💰 $0.02 por imagem
- 💰 $9/mês (500 imagens + HD)
- 💰 $29/mês (2000 imagens + HD + batch)

**Como criar conta:**
1. Acesse: https://chompute.com
2. Clique em "Sign Up"
3. Crie conta
4. API key no dashboard

**Recomendação:** Free tier é limitado. Se usar muito, considere plano pago.

---

### 5. Nano Banana - Edição com Google Gemini

**O que faz:** Edição avançada de imagem usando Google Gemini

**Free Tier:**
- ✅ 100 edições por mês
- ✅ Modelo padrão
- ❌ Sem modelo avançado

**Plano Pago:**
- 💰 $0.03 por edição
- 💰 $15/mês (1000 edições + modelo avançado)

**Como criar conta:**
1. Acesse: https://nanobanana.com
2. Clique em "Sign Up"
3. Crie conta
4. API key no dashboard

**Recomendação:** Free tier é bom para testes.

---

### 6. Twitter/X - Posts e Threads

**O que faz:** Postar tweets e threads automaticamente

**Free Tier:**
- ✅ 1500 tweets por mês
- ✅ 50 tweets por dia
- ❌ Sem analytics avançado

**Plano Pago:**
- 💰 $100/mês (Basic) - 10.000 tweets
- 💰 $500/mês (Pro) - Unlimited + analytics

**Como criar conta:**
1. Acesse: https://developer.twitter.com
2. Aplique para Developer Account
3. Crie App
4. Gere API keys (Consumer Key + Secret)

**Recomendação:** Free tier é suficiente para uso pessoal. Developer account pode demorar para aprovar.

---

### 7. Notion - Documentação

**O que faz:** Integração com Notion para documentação e gestão

**Free Tier:**
- ✅ 1000 requisições API por mês
- ✅ Leitura e escrita
- ❌ Sem webhooks

**Plano Pago:**
- 💰 $8/mês (Plus) - Unlimited API
- 💰 $15/mês (Business) - Advanced features

**Como criar conta:**
1. Acesse: https://www.notion.so
2. Crie conta (se não tiver)
3. Vá em: https://www.notion.so/my-integrations
4. Crie integração
5. Copie API key

**Recomendação:** Free tier é suficiente para uso moderado.

---

### 8. Brave Search - Pesquisa Web

**O que faz:** Pesquisa web para tendências e concorrência

**Free Tier:**
- ✅ 2000 queries por mês
- ✅ Resultados básicos
- ❌ Sem filtros avançados

**Plano Pago:**
- 💰 $5/mês (5000 queries + filtros)
- 💰 $20/mês (25000 queries + priority)

**Como criar conta:**
1. Acesse: https://brave.com/search/api/
2. Clique em "Get API Key"
3. Crie conta
4. Gere API key

**Recomendação:** Free tier é generoso. Upgrade só se pesquisar muito.

---

### 9. SEOcrawl - Análise SEO

**O que faz:** Análise SEO e performance de sites

**Free Tier:**
- ✅ 100 crawls por mês
- ✅ Análise básica
- ❌ Sem relatórios avançados

**Plano Pago:**
- 💰 $29/mês (Unlimited crawls + relatórios)
- 💰 $99/mês (Agency - multi-site)

**Como criar conta:**
1. Acesse: https://seocrawl.com
2. Clique em "Sign Up"
3. Crie conta
4. API key no dashboard

**Recomendação:** Free tier é limitado. Se usar profissionalmente, considere plano pago.

---

### 10. OpenSEO - Dados de Keywords

**O que faz:** Dados de keywords e análise de concorrência

**Free Tier:**
- ✅ 500 queries por mês
- ✅ Dados básicos
- ❌ Sem histórico

**Plano Pago:**
- 💰 $19/mês (Unlimited + histórico)
- 💰 $49/mês (Pro - advanced features)

**Como criar conta:**
1. Acesse: https://openseo.com
2. Clique em "Sign Up"
3. Crie conta
4. API key no dashboard

**Recomendação:** Free tier é bom para começar.

---

## ✅ Serviços Gratuitos com Conta (OAuth)

Estes serviços **precisam de conta** mas são **gratuitos** (você já deve ter conta):

### 1. LinkedIn
- **O que faz:** Postar e gerenciar conteúdo no LinkedIn
- **Custo:** Grátis (você já tem conta LinkedIn)
- **Autenticação:** OAuth (navegador abre para login)
- **Limites:** Limites da própria API do LinkedIn

### 2. Instagram
- **O que faz:** Postar fotos e stories
- **Custo:** Grátis (você já tem conta Instagram)
- **Autenticação:** OAuth (navegador abre para login)
- **Limites:** Limites da própria API do Instagram

### 3. Facebook
- **O que faz:** Postar em páginas e grupos
- **Custo:** Grátis (você já tem conta Facebook)
- **Autenticação:** OAuth (navegador abre para login)
- **Limites:** Limites da própria API do Facebook

### 4. Google Drive
- **O que faz:** Armazenamento e compartilhamento de arquivos
- **Custo:** Grátis até 15GB (você já tem conta Google)
- **Autenticação:** OAuth (navegador abre para login)
- **Limites:** 15GB grátis, $1.99/mês para 100GB

### 5. Slack
- **O que faz:** Comunicação e aprovações
- **Custo:** Grátis (você já tem workspace Slack)
- **Autenticação:** OAuth (navegador abre para login)
- **Limites:** Limites do seu workspace Slack

---

## 💡 Recomendações por Perfil de Uso

### Perfil 1: Uso Pessoal / Freelancer (Baixo Volume)

**Serviços recomendados (todos free tier):**
- ✅ document-generator (grátis)
- ✅ pdf-toolkit (grátis)
- ✅ Docling (grátis)
- ✅ Open Design (grátis)
- ✅ FLUX (100 imagens/mês)
- ✅ Pictify (50 renders/mês)
- ✅ ChangeImageTo (100 ops/mês)
- ✅ Brave Search (2000 queries/mês)

**Custo mensal:** $0 (tudo no free tier)

---

### Perfil 2: Agência Pequena (Médio Volume)

**Serviços recomendados:**
- ✅ Todos os gratuitos acima
- ✅ FLUX ($20/mês - 500 imagens)
- ✅ Pictify ($19/mês - 1000 renders)
- ✅ ChangeImageTo ($9/mês - 1000 ops)
- ✅ Chompute ($9/mês - 500 imagens)
- ✅ Brave Search ($5/mês - 5000 queries)

**Custo mensal:** ~$62

---

### Perfil 3: Agência Grande (Alto Volume)

**Serviços recomendados:**
- ✅ Todos os gratuitos
- ✅ FLUX ($100/mês - créditos)
- ✅ Pictify ($49/mês - 5000 renders)
- ✅ ChangeImageTo ($29/mês - 5000 ops)
- ✅ Chompute ($29/mês - 2000 imagens)
- ✅ Nano Banana ($15/mês - 1000 edições)
- ✅ Twitter ($100/mês - Basic)
- ✅ SEOcrawl ($29/mês - Unlimited)
- ✅ OpenSEO ($19/mês - Unlimited)

**Custo mensal:** ~$370

---

## 🎯 Como Minimizar Custos

### 1. Use Free Tier ao Máximo
- Comece com free tier de todos os serviços
- Monitore uso no dashboard de cada serviço
- Upgrade só quando realmente precisar

### 2. Combine Serviços Gratuitos
- Use Open Design (grátis) em vez de Pictify quando possível
- Use document-generator (grátis) para PDFs simples
- Use Docling (grátis) para processamento de documentos

### 3. Otimize Uso de APIs Pagas
- FLUX: Use flux-1.1-pro ($0.04) em vez de ultra ($0.08) quando possível
- Pictify: Use templates simples em vez de complexos
- ChangeImageTo: Faça batch em vez de operações individuais

### 4. Monitore Custos
- Verifique dashboard de cada serviço semanalmente
- Configure alertas de uso (se disponível)
- Revise custos mensalmente

---

## 📝 Checklist de Configuração

### Antes do Bootstrap

- [ ] Decida quais serviços vai usar
- [ ] Crie contas nos serviços necessários
- [ ] Gere API keys
- [ ] Anote as API keys em local seguro

### Durante o Bootstrap

- [ ] A GUI vai mostrar quais serviços precisam de API key
- [ ] Preencha as API keys quando solicitado
- [ ] Habilite apenas os serviços que vai usar

### Após o Bootstrap

- [ ] Teste cada serviço habilitado
- [ ] Verifique se as API keys estão funcionando
- [ ] Monitore uso nos dashboards

---

## 🆘 Troubleshooting

### "API key inválida"
- Verifique se copiou a key corretamente
- Verifique se a key não expirou
- Gere nova key se necessário

### "Limite do free tier atingido"
- Aguarde o reset mensal
- Faça upgrade para plano pago
- Use serviço alternativo gratuito

### "Serviço não responde"
- Verifique se o serviço está habilitado no .env
- Verifique se a API key está correta
- Teste a API key no dashboard do serviço

---

## 📚 Links Úteis

### Geração de Imagem
- FLUX: https://bfl.ai/pricing
- Pictify: https://pictify.io/pricing

### Edição de Imagem
- ChangeImageTo: https://changeimageto.com/pricing
- Chompute: https://chompute.com/pricing
- Nano Banana: https://nanobanana.com/pricing

### Redes Sociais
- Twitter API: https://developer.twitter.com/en/portal/products
- LinkedIn: https://www.linkedin.com/developers/

### Pesquisa
- Brave Search: https://brave.com/search/api/
- SEOcrawl: https://seocrawl.com/pricing
- OpenSEO: https://openseo.com/pricing

---

**Resumo:** Você pode usar o workspace **100% grátis** com os serviços gratuitos + free tier dos serviços pagos. Upgrade para planos pagos apenas quando realmente precisar! 🚀
