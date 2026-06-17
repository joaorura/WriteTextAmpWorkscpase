# Open Design - Prototipagem Visual Local

Open Design é uma ferramenta de prototipagem visual que roda localmente, permitindo criar landing pages, apresentações, dashboards e muito mais.

## 🚀 Instalação

### Automática (via Bootstrap)

O Open Design é instalado automaticamente pelo `bootstrap.ps1`, que baixa a **última release do GitHub**:

```powershell
.\bootstrap.ps1
```

### Manual

```powershell
# Baixa e instala a última release do GitHub
.\scripts\install-open-design.ps1

# Ou especifique um diretório personalizado
.\scripts\install-open-design.ps1 -InstallDir "C:\tools\open-design"

# Para reinstalar (baixa novamente a última release)
.\scripts\install-open-design.ps1 -Force

# Para instalar uma versão específica
.\scripts\install-open-design.ps1 -Version "v1.2.3"
```

**Nota:** O script consulta a API do GitHub para obter a última release disponível e baixa o asset apropriado para Windows (.exe ou .zip).

## 🎯 Iniciar o Open Design

### Método 1: Script de Inicialização

```powershell
cd tools\open-design
.\start.ps1
```

### Método 2: npm start

```powershell
cd tools\open-design
npm start
```

### Método 3: Via OpenCode

O Open Design pode ser iniciado automaticamente pelo OpenCode se configurado.

## 🌐 Acessar

Após iniciar, acesse: **http://localhost:3000**

## 🎨 Modelos de Imagem Configurados

O Open Design vem pré-configurado com os seguintes modelos:

### FLUX (Black Forest Labs)

**Modelos disponíveis:**
- `flux-1.1-pro` - Alta qualidade, rápido (1024x1024)
- `flux-1.1-pro-ultra` - Ultra alta qualidade (2048x2048)
- `flux-1.1-dev` - Modelo de desenvolvimento (1024x1024)

**Configuração:**
```env
FLUX_API_KEY=sua_chave_aqui
```

**Obter API Key:** https://bfl.ai/pricing

### Pictify

**Descrição:** Templates HTML para imagens

**Configuração:**
```env
PICTIFY_API_KEY=sua_chave_aqui
```

**Obter API Key:** https://pictify.io/dashboard/api-tokens

### ChangeImageTo

**Descrição:** 16 ferramentas de edição de imagem
- Resize, crop, upscale, denoise
- OCR, conversão de formatos
- E muito mais

**Configuração:** Automática (não requer API key)

### Chompute

**Descrição:** Remoção de fundo automática

**Configuração:** Automática (não requer API key)

### Nano Banana

**Descrição:** Edição de imagem com Google Gemini

**Configuração:**
```env
NANO_BANANA_API_KEY=sua_chave_aqui
```

## 📝 Uso no OpenCode

### Exemplo 1: Criar Landing Page

```markdown
@open-design create landing page for "Produto X"

Use:
- Hero section com headline impactante
- 3 benefícios principais
- Prova social (depoimentos)
- CTA claro
```

### Exemplo 2: Criar Apresentação

```markdown
@open-design create presentation with 10 slides about "Marketing Digital"

Include:
- Capa
- Problema
- Solução
- Benefícios
- Cases de sucesso
- CTA final
```

### Exemplo 3: Criar Dashboard

```markdown
@open-design create dashboard showing:
- KPIs principais
- Gráficos de vendas
- Métricas de engagement
- Tendências
```

### Exemplo 4: Gerar Imagens com FLUX

```markdown
@open-design generate image using flux-1.1-pro:

"Professional photograph of modern office space, natural lighting, minimalist design, 1920x1080"
```

## 🔧 Configuração Avançada

### Editar Modelos

Edite `tools/open-design/models.config.json`:

```json
{
  "models": {
    "flux": {
      "enabled": true,
      "default_model": "flux-1.1-pro-ultra"
    }
  },
  "defaults": {
    "image_generation": "flux"
  }
}
```

### Alterar Porta

Edite `tools/open-design/package.json`:

```json
{
  "scripts": {
    "start": "next start -p 4000"
  }
}
```

### Configurar Proxy

Se estiver atrás de um proxy, edite `tools/open-design/.env.local`:

```env
HTTP_PROXY=http://proxy.empresa.com:8080
HTTPS_PROXY=http://proxy.empresa.com:8080
```

## 📚 Templates Prontos

O workspace inclui templates prontos em `.opencode/templates/open-design-prompts.md`:

- Landing Pages
- Apresentações
- Dashboards
- Email Templates
- Social Media Posts

### Usar Templates

```markdown
@open-design use template "landing-page-saas" for "Meu Produto"
```

## 🎯 Workflows

### Workflow 1: Landing Page Completa

```markdown
1. Crie o conteúdo textual:
   @content-creator write landing page copy for "Produto X"

2. Materialize no Open Design:
   @open-design create landing page using the copy above

3. Gere imagens com FLUX:
   @open-design generate hero image using flux-1.1-pro

4. Exporte:
   @open-design export to HTML and PDF
```

### Workflow 2: Apresentação com Imagens AI

```markdown
1. Planeje a apresentação:
   @presentation-builder plan 10-slide presentation about "Tema"

2. Crie no Open Design:
   @open-design create presentation from plan

3. Gere imagens para cada slide:
   @open-design generate images for all slides using flux

4. Exporte:
   @open-design export to PDF
```

### Workflow 3: Dashboard Interativo

```markdown
1. Defina os dados:
   @content-creator create sample data for sales dashboard

2. Crie o dashboard:
   @open-design create interactive dashboard with charts

3. Configure interatividade:
   @open-design add filters and drill-down capabilities

4. Exporte:
   @open-design export to HTML
```

## 🆘 Troubleshooting

### Porta 3000 já está em uso

```powershell
# Mate o processo na porta 3000
Get-NetTCPConnection -LocalPort 3000 | Select-Object -ExpandProperty OwningProcess | ForEach-Object { Stop-Process -Id $_ -Force }

# Ou use outra porta
npm start -- -p 4000
```

### Erro de permissão

```powershell
# Execute como Administrador
# Ou ajuste permissões:
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Dependências faltando

```powershell
cd tools\open-design
npm install
```

### API Key não funciona

```powershell
# Verifique se a API key está no .env
Get-Content .env | Select-String "API_KEY"

# Teste a API key
curl -H "Authorization: Bearer $env:FLUX_API_KEY" https://api.bfl.ai/v1/models
```

### Open Design não inicia

```powershell
# Verifique se Node.js está instalado
node --version

# Verifique se as dependências estão instaladas
cd tools\open-design
npm list

# Reinstale se necessário
npm install
```

## 📊 Limitações

- **Memória**: Recomenda-se 8GB RAM mínimo
- **Disco**: 2GB espaço livre
- **Rede**: Conexão com internet para APIs de imagem
- **Browser**: Chrome, Firefox, Edge (versões recentes)

## 💡 Dicas

### Performance

- Use `flux-1.1-pro` para geração rápida
- Use `flux-1.1-pro-ultra` apenas para imagens finais
- Habilite cache para templates frequentes

### Qualidade

- Use prompts detalhados para melhor qualidade
- Especifique resolução e aspect ratio
- Use negative prompts para evitar elementos indesejados

### Organização

- Crie pastas para cada projeto
- Use nomes descritivos para templates
- Documente configurações customizadas

## 🔗 Integração com Outras Ferramentas

### Docling + Open Design

```markdown
1. Converta PDF com Docling:
   @docling convert "apresentacao.pdf"

2. Processe no Open Design:
   @open-design create presentation from markdown

3. Exporte:
   @open-design export to PDF
```

### OpenCode + Open Design

```markdown
@open-design create landing page
@open-design generate images using flux
@open-design export to HTML
```

## 📖 Documentação Completa

- **Website**: https://opendesign.sh
- **GitHub**: https://github.com/opendesign-sh/opendesign
- **Docs**: https://docs.opendesign.sh
- **Examples**: https://github.com/opendesign-sh/opendesign/tree/main/examples

## 🎓 Recursos Avançados

### Custom Templates

Crie seus próprios templates em `tools/open-design/templates/`:

```html
<!-- my-template.html -->
<div class="container">
  <h1>{{title}}</h1>
  <p>{{description}}</p>
</div>
```

### Custom Components

Crie componentes reutilizáveis em `tools/open-design/components/`:

```jsx
// MyComponent.jsx
export default function MyComponent({ title, description }) {
  return (
    <div>
      <h1>{title}</h1>
      <p>{description}</p>
    </div>
  )
}
```

### API Integration

Integre com APIs externas:

```javascript
// api/fetch-data.js
export default async function handler(req, res) {
  const data = await fetch('https://api.example.com/data')
  res.json(await data.json())
}
```

---

**Open Design é uma ferramenta poderosa para prototipagem visual. Use-a para criar landing pages, apresentações, dashboards e muito mais!**
