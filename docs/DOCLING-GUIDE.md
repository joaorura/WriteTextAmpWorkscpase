# Docling - Processamento de Documentos

Docling é uma ferramenta de processamento de documentos que converte PDFs, imagens e outros formatos em Markdown estruturado.

## 🚀 Iniciar Servidor HTTP

### Método 1: Script Python

```powershell
# Inicia na porta padrão (8000)
python scripts\start-docling-server.py

# Inicia em porta específica
python scripts\start-docling-server.py --port 9000

# Inicia com auto-reload (desenvolvimento)
python scripts\start-docling-server.py --reload
```

### Método 2: Direto via CLI

```powershell
# Inicia servidor
docling-serve --port 8000 --host localhost
```

## 🌐 Acessar o Servidor

Após iniciar, acesse:
- **API**: http://localhost:8000
- **Documentação**: http://localhost:8000/docs
- **Health Check**: http://localhost:8000/health

## 📝 Uso no OpenCode

O Docling está configurado no `opencode.jsonc`:

```json
{
  "docling": {
    "type": "http",
    "url": "http://localhost:8000",
    "enabled": true
  }
}
```

### Exemplo de Uso

```markdown
@docling convert "documento.pdf"
```

## 🔧 Configuração

### Variáveis de Ambiente

Adicione ao `.env`:

```env
# Docling Configuration
DOCLING_PORT=8000
DOCLING_HOST=localhost
DOCLING_AUTO_START=true
```

### Auto-Inicialização

Se `DOCLING_AUTO_START=true`, o OpenCode iniciará o Docling automaticamente.

## 📚 Formatos Suportados

- **PDF** → Markdown
- **DOCX** → Markdown
- **PPTX** → Markdown
- **HTML** → Markdown
- **Imagens** → Markdown (com OCR)
- **URLs** → Markdown

## 🎯 Casos de Uso

### 1. Converter PDF para Markdown

```markdown
@docling convert "relatorio.pdf" to markdown
```

### 2. Extrair Texto de Imagem

```markdown
@docling ocr "scan.png"
```

### 3. Processar Múltiplos Arquivos

```markdown
@docling convert all PDFs in "documentos/" folder
```

## 🆘 Troubleshooting

### Porta 8000 já está em uso

```powershell
# Use outra porta
python scripts\start-docling-server.py --port 9000

# Ou mate o processo na porta 8000
Get-NetTCPConnection -LocalPort 8000 | Select-Object -ExpandProperty OwningProcess | ForEach-Object { Stop-Process -Id $_ -Force }
```

### Erro: docling-serve não encontrado

```powershell
# Instale o docling-serve
pip install docling-serve

# Ou use o requirements.txt
pip install -r requirements.txt
```

### Servidor não inicia

```powershell
# Verifique se Python está instalado
python --version

# Verifique se docling-serve está instalado
pip list | findstr docling

# Reinstale se necessário
pip uninstall docling-serve
pip install docling-serve
```

## 📖 Documentação Completa

- **Website**: https://docling.ai
- **GitHub**: https://github.com/docling-ai/docling
- **Docs**: https://docs.docling.ai

## 🔗 Integração com Open Design

O Docling pode ser usado junto com o Open Design para:

1. **Converter documentos** → Markdown
2. **Processar no Open Design** → Layout visual
3. **Exportar** → PDF, HTML, imagens

### Exemplo de Workflow

```markdown
1. Converta PDF com Docling:
   @docling convert "apresentacao.pdf"

2. Processe no Open Design:
   @open-design create presentation from markdown

3. Exporte:
   @open-design export to PDF
```

## 💡 Dicas

### Performance

- Para documentos grandes, use `--batch-size` para processar em lotes
- Habilite cache para documentos frequentemente acessados
- Use OCR apenas quando necessário (é mais lento)

### Qualidade

- Para PDFs escaneados, habilite OCR: `--ocr true`
- Para tabelas complexas, use `--table-mode advanced`
- Para imagens, use `--image-mode high-quality`

## 📊 Limitações

- **Tamanho máximo**: 100MB por arquivo
- **Páginas máximas**: 1000 páginas por documento
- **Tempo de processamento**: Varia conforme tamanho e complexidade

## 🎓 Recursos Avançados

### Extração de Tabelas

```markdown
@docling extract tables from "relatorio.pdf"
```

### Extração de Imagens

```markdown
@docling extract images from "documento.pdf" to "imagens/"
```

### Conversão em Lote

```markdown
@docling batch convert "documentos/*.pdf" to "output/"
```

---

**Docling é uma ferramenta poderosa para processamento de documentos. Use-a para converter qualquer formato em Markdown estruturado!**
