---
name: generate-marketing-doc
description: 'Gera documentos profissionais de marketing em PDF e Word — relatórios, propostas, briefings, whitepapers, cases'
---

# Generate Marketing Doc

Skill para gerar documentos profissionais de marketing usando os MCPs disponíveis.

---

## Quando Usar

- Gerar relatórios de marketing em PDF/Word
- Criar propostas comerciais formatadas
- Produzir whitepapers e e-books
- Gerar briefings e cases de sucesso
- Exportar artigos para PDF profissional

---

## Workflow

### 1. Identificar o Tipo de Documento

| Tipo | Formato | Template |
|------|---------|----------|
| **Relatório** | PDF | Estrutura: sumário, dados, análise, conclusões |
| **Proposta** | PDF + Word | Estrutura: desafio, solução, cronograma, investimento |
| **Whitepaper** | PDF | Estrutura: sumário executivo, problema, solução, casos |
| **Case** | PDF | Estrutura: desafio, solução, resultados, depoimento |
| **Briefing** | Word | Estrutura: objetivo, público, mensagem, escopo |

### 2. Produzir o Conteúdo em Markdown

Escreva o conteúdo completo em Markdown primeiro:

```markdown
# [Título do Documento]
## [Subtítulo]

[Conteúdo estruturado com headings, listas, tabelas]
```

### 3. Gerar o Documento

#### Opção A: document-generator MCP (Word + PDF)

Use para documentos que precisam de formatação profissional:

```
Prompt para o MCP:
"Gere um documento Word e PDF a partir do seguinte conteúdo Markdown:
[cole o conteúdo aqui]
Salve como: output/documentos/nome-do-documento"
```

#### Opção B: pdf-toolkit MCP (PDF avançado)

Use para PDFs com recursos avançados (merge, encrypt, QR code):

```
Prompt para o MCP:
"Crie um PDF a partir deste Markdown:
[cole o conteúdo aqui]
Salve em: output/documentos/nome-do-documento.pdf"
```

#### Opção C: Docling nativo (documentos estruturados)

Use para documentos com estrutura complexa:

```
1. Crie um novo documento Docling
2. Adicione título, seções, parágrafos, tabelas
3. Exporte para Markdown
4. Converta para PDF via pdf-toolkit
```

### 4. Pós-Processamento (opcional)

Com pdf-toolkit:
- **Adicionar página de números:** `pdf_add_page_numbers`
- **Adicionar marca d'água:** `pdf_add_watermark`
- **Proteger com senha:** `pdf_encrypt`
- **Adicionar QR code:** `pdf_embed_qr_code`
- **Merge de documentos:** `pdf_merge`

---

## Templates de Documento

### Relatório de Marketing

```markdown
# Relatório de Marketing — [Período]

## Sumário Executivo
[Resumo dos principais resultados em 3-5 bullets]

## Métricas de Performance
[Tabela com métricas, valores e comparação]

## Análise por Canal
### Blog/SEO
### Social Media
### Email Marketing

## Insights e Aprendizados
[O que funcionou, o que não funcionou]

## Recomendações
[Próximos passos baseados nos dados]

## Apêndice
[Dados detalhados, metodologia]
```

### Proposta Comercial

```markdown
# Proposta: [Nome do Projeto]
## Preparada para [Cliente]

## Sumário Executivo
[1 parágrafo: entendemos seu desafio]

## O Desafio
[Descrição do problema do cliente]

## Nossa Solução
[Escopo, metodologia, entregáveis]

## Cronograma
[Fases e marcos]

## Investimento
[Valores e condições]

## Por que nós?
[Diferenciais e cases]

## Próximos Passos
[O que acontece após aprovação]
```

### Whitepaper

```markdown
# [Título: Resultado + Audiência]
## [Subtítulo: Promessa específica]

## Sumário Executivo
[200-300 palavras]

## 1. O Cenário Atual
[Contexto de mercado]

## 2. O Problema
[Descrição aprofundada da dor]

## 3. A Solução
[Framework, abordagem]

## 4. Casos de Uso
[2-3 casos detalhados]

## 5. Implementação
[Guia prático]

## 6. Conclusão
[Resumo + CTA]
```

---

## Dicas

1. **Sempre escreva o conteúdo em Markdown primeiro** — facilita edição e versionamento
2. **Use tabelas para dados** — mais legível e profissional
3. **Inclua metaadados** — autor, data, versão no documento
4. **Revise antes de gerar** — correções depois são mais trabalhosas
5. **Mantenha o brand voice** — mesmo em documentos formais
