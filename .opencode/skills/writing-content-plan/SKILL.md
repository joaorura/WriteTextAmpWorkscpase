---
name: writing-content-plan
description: 'Skill de planejamento para projetos de marketing — decompõe em tarefas, define dependências, especifica entregáveis'
triggers:
  - 'crie um plano para'
  - 'planeje a campanha'
  - 'preciso de um plano de'
  - 'como vamos executar'
  - 'próximos passos'
---

# Writing Content Plan

**Objetivo:** Criar plano de execução detalhado, com tarefas independentes, dependências claras e entregáveis específicos.

## Quando Usar

- Após brainstorming completo
- Quando o escopo está validado
- Antes de executar qualquer projeto complexo
- Para projetos com múltiplas entregas
- Para coordenar múltiplos subagents

## Filosofia

**Um bom plano previne 80% dos problemas.**

Planos ruins causam:
- Tarefas esquecidas
- Dependências não identificadas
- Entregas inconsistentes
- Retrabalho
- Frustração

Planos bons previnem tudo isso.

## Estrutura de um Bom Plano

### 1. Contexto e Objetivos

```markdown
# Plano de Execução: [Nome do Projeto]

## Contexto
[Breve descrição do projeto, origem, motivação]

## Objetivo Principal
[Objetivo específico e mensurável]

## Métricas de Sucesso
- [Métrica 1]: [valor alvo]
- [Métrica 2]: [valor alvo]

## Público-Alvo
[Persona específica]

## Canais
- [Canal 1] — [rationale]
- [Canal 2] — [rationale]
```

### 2. Entregáveis

Liste todas as entregas finais:

```markdown
## Entregáveis

### Conteúdo
1. Artigo de blog (1500 palavras)
2. 10 posts para LinkedIn
3. Sequência de 5 emails
4. 1 whitepaper (3000 palavras)
5. Apresentação de 10 slides

### Visuais
6. 5 banners para social media
7. 1 cover image para blog
8. Identidade visual do projeto

### Documentos
9. Briefing completo
10. Relatório final
```

### 3. Tarefas

Decomponha em tarefas de 2-5 minutos cada:

```markdown
## Tarefas

### Fase 1: Fundação (Semana 1)

**Tarefa 1.1: Criar briefing completo**
- Subagent: Content Creator
- Entregável: `output/briefing.md`
- Dependências: nenhuma
- Tempo estimado: 3 min
- Critério de sucesso: briefing com objetivo, público, escopo, métricas

**Tarefa 1.2: Definir identidade visual**
- Subagent: Visual Designer
- Entregável: `output/assets/identidade-visual.md`
- Dependências: Tarefa 1.1
- Tempo estimado: 4 min
- Critério de sucesso: paleta, tipografia, estilo definidos

**Tarefa 1.3: Criar personas detalhadas**
- Subagent: Content Creator
- Entregável: `output/personas.md`
- Dependências: Tarefa 1.1
- Tempo estimado: 3 min
- Critério de sucesso: 2-3 personas com dor, desejo, objeções

### Fase 2: Conteúdo (Semana 2)

**Tarefa 2.1: Escrever artigo de blog**
- Subagent: Content Creator
- Entregável: `output/artigos/artigo-principal.md`
- Dependências: Tarefas 1.1, 1.2, 1.3
- Tempo estimado: 5 min
- Critério de sucesso: 1500 palavras, SEO otimizado, CTA claro

**Tarefa 2.2: Criar cover image para artigo**
- Subagent: Visual Designer
- Entregável: `output/imagens/cover-artigo.png`
- Dependências: Tarefa 2.1
- Tempo estimado: 3 min
- Critério de sucesso: 1200x630px, brand consistency

**Tarefa 2.3: Escrever 10 posts para LinkedIn**
- Subagent: Social Media Manager
- Entregável: `output/social-media/linkedin-posts.md`
- Dependências: Tarefas 1.1, 1.2, 1.3
- Tempo estimado: 5 min
- Critério de sucesso: 10 posts, hooks fortes, CTAs claros

[... continue para todas as tarefas]
```

### 4. Dependências

Mapeie dependências explicitamente:

```markdown
## Mapa de Dependências

```
Tarefa 1.1 (Briefing)
    ↓
    ├→ Tarefa 1.2 (Identidade Visual)
    ├→ Tarefa 1.3 (Personas)
    ↓
Tarefa 2.1 (Artigo) ← depende de 1.1, 1.2, 1.3
    ↓
Tarefa 2.2 (Cover Image) ← depende de 2.1
    ↓
Tarefa 2.3 (Posts LinkedIn) ← depende de 1.1, 1.2, 1.3
    ↓
[... etc]
```

### Tarefas Paralelizáveis
- Tarefas 1.2 e 1.3 podem rodar em paralelo (ambas dependem só de 1.1)
- Tarefas 2.1 e 2.3 podem rodar em paralelo (ambas dependem de 1.1, 1.2, 1.3)

### Tarefas Sequenciais
- Tarefa 2.2 deve rodar após 2.1 (precisa do artigo para criar cover)
```

### 5. Cronograma

```markdown
## Cronograma

### Semana 1: Fundação
- Dia 1-2: Tarefas 1.1, 1.2, 1.3
- Dia 3-5: Revisão e ajustes

### Semana 2: Conteúdo
- Dia 6-8: Tarefas 2.1, 2.2, 2.3
- Dia 9-10: Revisão e ajustes

### Semana 3: Visuais e Documentos
- Dia 11-13: Tarefas 3.1, 3.2, 3.3
- Dia 14-15: Revisão e ajustes

### Semana 4: Integração e Entrega
- Dia 16-18: Tarefa 4.1 (integração)
- Dia 19-20: Revisão final e entrega
```

### 6. Recursos e Responsabilidades

```markdown
## Recursos

### Subagents
- Content Creator: Tarefas 1.1, 1.3, 2.1, 3.1
- Visual Designer: Tarefas 1.2, 2.2, 3.2
- Social Media Manager: Tarefa 2.3
- Document Generator: Tarefa 4.1

### MCPs
- FLUX: geração de imagens (Tarefas 2.2, 3.2)
- document-generator: PDFs e Word (Tarefa 4.1)
- LinkedIn MCP: publicação (após Tarefa 2.3)

### Humanos
- [Nome]: aprovação de briefing
- [Nome]: aprovação final
```

### 7. Riscos e Mitigações

```markdown
## Riscos

### Risco 1: Delay na aprovação do briefing
- Probabilidade: média
- Impacto: alto (atrasa tudo)
- Mitigação: definir deadline de 24h para aprovação

### Risco 2: FLUX indisponível
- Probabilidade: baixa
- Impacto: médio (atrasa visuais)
- Mitigação: ter Pictify como backup

### Risco 3: Conteúdo não alinha com brand voice
- Probabilidade: média
- Impacto: alto (retrabalho)
- Mitigação: review após cada entrega
```

### 8. Critérios de Aceitação

```markdown
## Critérios de Aceitação

### Por Tarefa
- Tarefa 1.1: briefing aprovado por [Nome]
- Tarefa 2.1: artigo com score SEO > 80
- Tarefa 2.3: posts com engagement potential > 7/10

### Geral
- Todas as entregas validadas por review
- Brand voice consistente em todas as peças
- Métricas de sucesso definidas e mensuráveis
- Pacote final integrado e coerente
```

## Processo de Criação de Plano

### 1. Revise o Brainstorming

Leia `.brainstorming/decisoes.md` para entender:
- Objetivo validado
- Público-alvo
- Canais escolhidos
- Escopo acordado
- Restrições

### 2. Liste Entregáveis

Baseado no escopo, liste todas as entregas finais.

### 3. Decomponha em Tarefas

Para cada entregável:
- Quebra em tarefas de 2-5 minutos
- Identifica subagent responsável
- Especifica entregável concreto
- Define critério de sucesso

### 4. Mapeie Dependências

Para cada tarefa:
- O que precisa estar pronto antes?
- O que pode rodar em paralelo?
- O que é sequencial?

### 5. Estime Tempo

Para cada tarefa:
- Tempo de execução (2-5 min)
- Tempo de review (1-2 min)
- Buffer para ajustes (20% do total)

### 6. Identifique Riscos

Pergunte:
- O que pode dar errado?
- Qual a probabilidade?
- Qual o impacto?
- Como mitigar?

### 7. Defina Critérios de Aceitação

Para cada tarefa e para o projeto geral:
- Como saber se está pronto?
- Quem aprova?
- Qual o padrão de qualidade?

### 8. Documente o Plano

Salve em `.planos/plano-nome-projeto.md`

## Template de Plano

```markdown
# Plano de Execução: [Nome do Projeto]

**Data:** [DD/MM/AAAA]
**Status:** [Rascunho / Aprovado / Em Execução / Concluído]
**Orquestrador:** marketing-orchestrator

## 1. Contexto e Objetivos
[... preencha]

## 2. Entregáveis
[... preencha]

## 3. Tarefas
[... preencha]

## 4. Dependências
[... preencha]

## 5. Cronograma
[... preencha]

## 6. Recursos
[... preencha]

## 7. Riscos
[... preencha]

## 8. Critérios de Aceitação
[... preencha]

## 9. Aprovações
- [ ] Plano aprovado por [Nome]
- [ ] Budget aprovado por [Nome]
- [ ] Timeline aprovado por [Nome]
```

## Red Flags

**Nunca:**
- Crie plano sem brainstorming prévio
- Pule mapeamento de dependências
- Subestime tempo (use buffer de 20%)
- Ignore riscos
- Esqueça critérios de aceitação

**Sempre:**
- Baseie plano em decisões validadas
- Decomponha em tarefas pequenas (2-5 min)
- Mapeie dependências explicitamente
- Identifique tarefas paralelizáveis
- Defina critérios de aceitação claros

## Exemplo de Plano Completo

Veja `.planos/exemplo-plano-lancamento.md` para um plano completo de exemplo.

## Próximos Passos

Após plano aprovado:
1. Use skill `executing-content-plan` para executar
2. Use skill `reviewing-content` para validar cada entrega
3. Use skill `finishing-content-project` para finalizar

## Integração

**Skills relacionadas:**
- `brainstorming-content` — precede o planejamento
- `executing-content-plan` — executa o plano
- `reviewing-content` — valida qualidade
- `finishing-content-project` — finaliza projeto

**Agents relacionados:**
- `marketing-orchestrator` — coordena todo o processo
- Subagents especializados — executam tarefas específicas
