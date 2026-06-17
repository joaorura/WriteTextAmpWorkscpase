---
name: generate-visual-assets
description: 'Gera imagens, banners e cards para marketing usando AI — FLUX, Pictify e templates HTML'
---

# Generate Visual Assets

Skill para gerar assets visuais usando ferramentas de AI e templates.

---

## Quando Usar

- Gerar imagens para social media
- Criar banners para anúncios
- Produzir thumbnails para vídeos
- Criar cards e infográficos
- Gerar imagens de capa para artigos
- Criar visuais para apresentações

---

## Ferramentas Disponíveis

### FLUX (Black Forest Labs) — Geração AI

**Status:** Free tier disponível (requer conta em bfl.ai)
**Melhor para:** Imagens fotográficas, ilustrações, arte conceitual

**Modelos disponíveis:**
| Modelo | Uso |
|--------|-----|
| `flux2_pro` | Uso geral — melhor equilíbrio |
| `flux2_max` | Hero shots, assets finais — maior qualidade |
| `flux2_flex` | Tipografia e texto legível |
| `flux2_klein` | Iterações rápidas |

### Pictify — Templates HTML → Imagem

**Status:** Free tier disponível (requer conta em pictify.io)
**Melhor para:** Banners, cards, OG images, social media com texto

**Recursos:**
- Templates reutilizáveis
- Batch generation (até 100 imagens)
- GIFs animados
- PDFs de templates

### Docling — Documentos Visuais

**Status:** Nativo (sem custo)
**Melhor para:** Documentos estruturados, exportação

---

## Workflow

### 1. Definir Tipo de Asset

| Tipo | Dimensões | Ferramenta |
|------|-----------|------------|
| **Instagram Feed** | 1080 x 1080 | FLUX ou Pictify |
| **Instagram Story** | 1080 x 1920 | FLUX ou Pictify |
| **LinkedIn Post** | 1200 x 627 | Pictify (com texto) |
| **Blog Cover** | 1200 x 630 | FLUX ou Pictify |
| **YouTube Thumb** | 1280 x 720 | FLUX |
| **Banner Ad** | Vários | Pictify |
| **Apresentação** | 1920 x 1080 | Pictify |

### 2. Ler Contexto do Projeto

- `briefing.md` — objetivo e público
- `brand-voice.md` — personalidade visual
- `assets/` — logos, cores, referências

### 3. Criar Prompt para FLUX

#### Estilo Fotográfico
```
Professional photograph of [subject],
[lighting type] lighting, [color palette] color palette,
shot on [camera/lens], editorial style, high resolution,
[aspect ratio] aspect ratio
```

#### Estilo Ilustração
```
Modern flat illustration of [subject],
[color] color scheme, clean vector style,
minimal details, marketing illustration,
[aspect ratio] aspect ratio
```

#### Estilo Banner
```
Marketing banner background, [theme],
[colors] gradient, abstract shapes, professional,
[dimensions] aspect ratio, clean modern style
```

#### Estilo Quote/Social
```
Minimalist social media card, [color] background,
clean typography, professional layout,
[dimensions] aspect ratio
```

### 4. Gerar com Pictify (quando precisa de texto)

Para assets com texto overlay (banners, cards, OG images):

```html
<!-- Template HTML para Pictify -->
<div style="width: 1200px; height: 630px; background: linear-gradient(135deg, #1a1a2e, #16213e); display: flex; align-items: center; justify-content: center; font-family: 'Inter', sans-serif;">
  <div style="text-align: center; color: white; padding: 60px;">
    <h1 style="font-size: 48px; font-weight: 700; margin-bottom: 20px;">[Título]</h1>
    <p style="font-size: 24px; opacity: 0.8;">[Subtítulo]</p>
  </div>
</div>
```

### 5. Salvar no Diretório Correto

- Imagens → `output/imagens/`
- Assets de social → `output/social-media/`
- Assets de apresentação → `output/apresentacoes/`

---

## Prompts por Tipo de Conteúdo

### Artigo de Blog (Cover Image)
```
Professional editorial photograph related to [tema do artigo],
[color palette matching brand], soft natural lighting,
clean composition, 1200x630 aspect ratio, high resolution
```

### Post de LinkedIn (Visual Card)
```
Clean professional infographic card, [tema],
[brand colors] color scheme, modern minimalist design,
data visualization style, 1200x627 aspect ratio
```

### Post de Instagram (Feed)
```
[Estilo] illustration of [tema],
[brand colors] color palette, modern clean style,
engaging visual for social media, 1080x1080 square format
```

### Thumbnail de YouTube
```
Eye-catching YouTube thumbnail, [tema],
bold colors, high contrast, expressive,
text-friendly composition, 1280x720 aspect ratio
```

### Banner de Anúncio
```
Professional advertising banner, [tema/produto],
[brand colors] color scheme, clean modern design,
space for text overlay, [dimensões] aspect ratio
```

---

## Dicas de Prompt para FLUX

1. **Front-load o sujeito** — coloque o mais importante primeiro
2. **Descreva iluminação** — "soft golden hour light", "overcast studio light"
3. **Use cores hex** — `#FF6B6B (coral pink)` é mais preciso que "pinkish red"
4. **Cite texto entre aspas** — para tipografia, labels, posters
5. **Evite prompts negativos** — FLUX responde ao que você descreve, não ao que evita
6. **Itere com variações** — use `generate_variations` para alternativas

---

## Checklist

- [ ] Dimensões corretas para o canal?
- [ ] Paleta de cores do projeto?
- [ ] Estilo consistente com outros assets?
- [ ] Texto legível (quando aplicável)?
- [ ] Alta resolução?
- [ ] Alt text descritivo para acessibilidade?
- [ ] Nome de arquivo descritivo?
- [ ] Salvo no diretório correto?
