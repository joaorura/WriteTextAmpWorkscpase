---
name: decision-router
description: 'Skill de roteamento inteligente — decide qual agent/subagent/skill usar baseado na intenção do usuário'
triggers:
  - 'qual agent usar?'
  - 'como começar?'
  - 'o que fazer agora?'
  - 'roteamento'
---

# Decision Router

**Objetivo:** Roteamento inteligente de solicitações para o agent/subagent/skill mais adequado baseado na intenção do usuário.

## Quando Usar

- Quando o usuário faz uma solicitação genérica
- Quando não está claro qual agent usar
- Para decidir entre orquestrador vs subagent direto
- Para escolher a skill de workflow correta

## Filosofia

**Roteie baseado em intenção, não em palavras-chave.**

Entenda o que o usuário REALMENTE quer, não apenas o que ele disse.

## Árvore de Decisão

### 1. Complexidade da Solicitação

```
Solicitação recebida
│
├─ Envolve múltiplos tipos de conteúdo?
│  └─ Sim → Marketing Orchestrator
│
├─ Apenas um tipo de conteúdo?
│  ├─ Artigo/blog → Content Creator Subagent
│  ├─ Imagem/visual → Visual Designer Subagent
│  ├─ Social media → Social Media Manager Subagent
│  ├─ Documento final → Document Generator Subagent
│  └─ Email → Email Marketing Subagent
│
├─ Precisa de planejamento?
│  └─ Sim → Skill writing-content-plan
│
├─ Precisa de brainstorming?
│  └─ Sim → Skill brainstorming-content
│
└─ Já tem plano, precisa executar?
   └─ Sim → Skill executing-content-plan
```

### 2. Tipo de Conteúdo

| Tipo de Conteúdo | Agent/Subagent | Skill de Workflow |
|------------------|----------------|-------------------|
| **Artigo de blog** | Content Creator | brainstorming → writing-plan → executing → reviewing → finishing |
| **Whitepaper** | Content Creator | brainstorming → writing-plan → executing → reviewing → finishing |
| **Case de sucesso** | Content Creator | brainstorming → writing-plan → executing → reviewing → finishing |
| **Post LinkedIn** | Social Media Manager | brainstorming → writing-plan → executing → reviewing → finishing |
| **Post Instagram** | Social Media Manager | brainstorming → writing-plan → executing → reviewing → finishing |
| **Thread Twitter** | Social Media Manager | brainstorming → writing-plan → executing → reviewing → finishing |
| **Banner/Visual** | Visual Designer | brainstorming → writing-plan → executing → reviewing → finishing |
| **Identidade visual** | Visual Designer | brainstorming → writing-plan → executing → reviewing → finishing |
| **PDF/Word** | Document Generator | brainstorming → writing-plan → executing → reviewing → finishing |
| **Apresentação** | Document Generator | brainstorming → writing-plan → executing → reviewing → finishing |
| **Sequência de emails** | Email Marketing | brainstorming → writing-plan → executing → reviewing → finishing |
| **Newsletter** | Email Marketing | brainstorming → writing-plan → executing → reviewing → finishing |
| **Campanha completa** | Marketing Orchestrator | brainstorming → writing-plan → executing → reviewing → finishing |

### 3. Estágio do Projeto

| Estágio | Skill | Ação |
|---------|-------|------|
| **Ideia vaga** | brainstorming-content | Refinar ideia, validar escopo |
| **Escopo definido** | writing-content-plan | Criar plano detalhado |
| **Plano aprovado** | executing-content-plan | Executar tarefas |
| **Execução completa** | reviewing-content | Validar qualidade |
| **Revisão aprovada** | finishing-content-project | Finalizar e entregar |

### 4. Frases-Gatilho

| Frase do Usuário | Intenção Real | Roteamento |
|------------------|---------------|------------|
| "Preciso de uma campanha" | Projeto complexo | Marketing Orchestrator + brainstorming |
| "Escreva um artigo" | Conteúdo único | Content Creator |
| "Crie uma imagem" | Visual único | Visual Designer |
| "Post para LinkedIn" | Social media único | Social Media Manager |
| "Gere um PDF" | Documento único | Document Generator |
| "Sequência de emails" | Email único | Email Marketing |
| "Vamos pensar sobre" | Brainstorming | brainstorming-content |
| "Crie um plano" | Planejamento | writing-content-plan |
| "Execute o plano" | Execução | executing-content-plan |
| "Revise o conteúdo" | Revisão | reviewing-content |
| "Está pronto?" | Finalização | finishing-content-project |

## Processo de Roteamento

### 1. Analise a Solicitação

Pergunte-se:
- O que o usuário REALMENTE quer?
- É um projeto complexo ou tarefa simples?
- Precisa de brainstorming ou já tem escopo claro?
- Qual o tipo de conteúdo principal?

### 2. Escolha o Caminho

#### Caminho A: Projeto Complexo (Múltiplos Entregáveis)

```
1. brainstorming-content (refinar ideia)
2. writing-content-plan (criar plano)
3. executing-content-plan (executar com orquestrador)
4. reviewing-content (validar qualidade)
5. finishing-content-project (finalizar)
```

**Agent principal:** Marketing Orchestrator
**Subagents:** Content Creator, Visual Designer, Social Media Manager, Document Generator, Email Marketing

#### Caminho B: Tarefa Simples (Único Entregável)

```
1. brainstorming-content (se escopo não claro)
2. Delegar diretamente para subagent
3. reviewing-content (validar qualidade)
```

**Agent principal:** Subagent especializado
**Skills:** brainstorming (opcional), reviewing

### 3. Execute o Roteamento

#### Para Projeto Complexo:

```markdown
Vou usar o Marketing Orchestrator para coordenar este projeto.

**Processo:**
1. Brainstorming para refinar escopo
2. Planejamento detalhado
3. Execução com subagents especializados
4. Revisão de qualidade
5. Finalização e entrega

Vamos começar com o brainstorming?
```

#### Para Tarefa Simples:

```markdown
Vou delegar diretamente para o [Subagent] especializado.

**Processo:**
1. [Subagent] cria o conteúdo
2. Revisão de qualidade
3. Entrega

Posso começar?
```

## Exemplos de Roteamento

### Exemplo 1: "Preciso de uma campanha de lançamento"

**Análise:**
- Projeto complexo (múltiplos entregáveis)
- Escopo não definido
- Precisa de brainstorming

**Roteamento:**
```
1. brainstorming-content (refinar escopo)
2. writing-content-plan (criar plano)
3. Marketing Orchestrator (coordenar execução)
   - Content Creator (artigo, whitepaper)
   - Visual Designer (banners, visuais)
   - Social Media Manager (posts)
   - Email Marketing (sequência)
   - Document Generator (PDFs, apresentações)
4. reviewing-content (validar)
5. finishing-content-project (finalizar)
```

### Exemplo 2: "Escreva um artigo sobre marketing digital"

**Análise:**
- Tarefa simples (único entregável)
- Escopo relativamente claro
- Pode pular brainstorming se detalhes suficientes

**Roteamento:**
```
1. brainstorming-content (se precisar de mais detalhes)
2. Content Creator (escrever artigo)
3. reviewing-content (validar)
```

### Exemplo 3: "Crie 10 posts para LinkedIn"

**Análise:**
- Tarefa simples (único tipo de conteúdo)
- Escopo claro
- Pode ir direto para execução

**Roteamento:**
```
1. Social Media Manager (criar posts)
2. reviewing-content (validar)
```

### Exemplo 4: "Vamos pensar sobre nossa estratégia de conteúdo"

**Análise:**
- Solicitação de brainstorming
- Sem entregável específico ainda
- Precisa refinar ideia

**Roteamento:**
```
1. brainstorming-content (refinar ideia)
2. [Dependendo do resultado, pode virar projeto complexo ou tarefa simples]
```

## Matriz de Decisão Rápida

| Situação | Agent | Skills |
|----------|-------|--------|
| "Campanha completa" | Orchestrator | brainstorming → plan → execute → review → finish |
| "Artigo sobre X" | Content Creator | brainstorming (opcional) → review |
| "Post para LinkedIn" | Social Media Manager | review |
| "Banner para X" | Visual Designer | review |
| "PDF de X" | Document Generator | review |
| "Emails para X" | Email Marketing | review |
| "Vamos pensar" | - | brainstorming |
| "Crie um plano" | - | writing-plan |
| "Execute" | Orchestrator | executing |
| "Revise" | - | reviewing |
| "Finalize" | - | finishing |

## Red Flags

**Nunca:**
- Roteie baseado apenas em palavras-chave
- Ignore complexidade da solicitação
- Pule brainstorming para projetos complexos
- Use orquestrador para tarefas simples (overhead desnecessário)
- Esqueça de validar com usuário

**Sempre:**
- Entenda intenção real do usuário
- Avalie complexidade antes de rotear
- Use brainstorming para escopo não definido
- Escolha agent/subagent mais adequado
- Valide roteamento com usuário

## Integração

**Skills relacionadas:**
- `brainstorming-content` — refina ideias
- `writing-content-plan` — cria planos
- `executing-content-plan` — executa planos
- `reviewing-content` — valida qualidade
- `finishing-content-project` — finaliza projetos

**Agents relacionados:**
- `marketing-orchestrator` — coordena projetos complexos
- `content-creator` — conteúdo textual
- `visual-designer` — peças visuais
- `social-media-manager` — social media
- `document-generator` — documentos finais
- `email-marketing` — email marketing
