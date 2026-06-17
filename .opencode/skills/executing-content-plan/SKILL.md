---
name: executing-content-plan
description: 'Skill de execução para projetos de marketing — delega tarefas para subagents, valida entregas, mantém ledger de progresso'
triggers:
  - 'execute o plano'
  - 'vamos começar'
  - 'pode executar'
  - 'inicie a campanha'
---

# Executing Content Plan

**Objetivo:** Executar plano de marketing delegando tarefas para subagents especializados, validando cada entrega e mantendo ledger de progresso.

## Quando Usar

- Após plano aprovado
- Quando o usuário diz "execute", "comece", "inicie"
- Para projetos com múltiplas tarefas e subagents
- Para coordenar execução complexa

## Filosofia

**Execute continuamente, valide constantemente.**

Não pare para perguntar "devo continuar?" entre tarefas. Execute todas as tarefas do plano sem interrupção. As únicas razões para parar são:
- Tarefa BLOCKED que você não pode resolver
- Ambiguidade que genuinamente impede progresso
- Todas as tarefas completas

## Processo de Execução

### 1. Pré-Flight: Revise o Plano

Antes de delegar Tarefa 1:
- Leia o plano completo uma vez
- Identifique conflitos ou contradições
- Verifique se todas as dependências estão mapeadas
- Confirme que critérios de aceitação estão claros

Se encontrar problemas, apresente ao usuário antes de começar.

### 2. Crie Ledger de Progresso

Crie arquivo `.orchestrator/progress.md`:

```markdown
# Progress Ledger

## Projeto: [Nome]
**Início:** [DD/MM/AAAA]
**Status:** Em execução

### Tarefas
- [ ] Tarefa 1.1: Briefing completo
- [ ] Tarefa 1.2: Identidade visual
- [ ] Tarefa 1.3: Personas
- [ ] Tarefa 2.1: Artigo de blog
- [ ] Tarefa 2.2: Cover image
- [ ] Tarefa 2.3: Posts LinkedIn
[... todas as tarefas do plano]

### Decisões
[Registre decisões tomadas durante execução]

### Issues
[Registre problemas encontrados e como foram resolvidos]
```

### 3. Execute Tarefas em Sequência/Paralelo

#### Para cada tarefa:

**A. Prepare o Briefing da Tarefa**

Crie arquivo `.orchestrator/task-briefs/tarefa-X-brief.md`:

```markdown
# Tarefa X: [Nome]

## Contexto
[1 linha sobre onde esta tarefa se encaixa no projeto]

## Objetivo
[O que esta tarefa deve entregar]

## Entregável
[Arquivo específico a ser criado]

## Dependências
[O que precisa estar pronto antes]

## Critério de Sucesso
[Como saber se está completo]

## Instruções Específicas
[Detalhes, requisitos, restrições]

## Brand Voice
[Resumo do tom a ser usado]

## Público-Alvo
[Persona específica]
```

**B. Delegue para Subagent**

Escolha o subagent baseado na tarefa:
- Conteúdo textual → Content Creator
- Visual → Visual Designer
- Social media → Social Media Manager
- Documento final → Document Generator
- Email → Email Marketing

Forneça ao subagent:
1. Briefing da tarefa (arquivo)
2. Contexto do projeto (briefing.md, brand-voice.md, personas.md)
3. Dependências completas (entregas de tarefas anteriores)
4. Critério de sucesso claro

**C. Valide a Entrega**

Quando o subagent retornar:
1. Leia o relatório de status (DONE, DONE_WITH_CONCERNS, NEEDS_CONTEXT, BLOCKED)
2. Verifique o entregável contra critério de sucesso
3. Valide brand voice e consistência
4. Se OK, marque como completa no ledger
5. Se não OK, forneça feedback e peça revisão

**D. Atualize Ledger**

Após validação:

```markdown
- [x] Tarefa 1.1: Briefing completo (commits abc123..def456, review clean)
```

### 4. Handle Status de Subagents

#### DONE
- Leia o relatório
- Valide entregável
- Marque como completa
- Prossiga para próxima tarefa

#### DONE_WITH_CONCERNS
- Leia as preocupações
- Se são sobre corretude/escopo: resolva antes de prosseguir
- Se são observações: note e prossiga
- Valide entregável
- Marque como completa

#### NEEDS_CONTEXT
- Forneça contexto adicional
- Re-delegue a mesma tarefa
- Aguarde nova entrega

#### BLOCKED
- Avalie o blocker:
  - Problema de contexto? → Forneça mais contexto e re-delegue
  - Tarefa muito grande? → Quebre em tarefas menores
  - Plano errado? → Escale para usuário
- Nunca ignore um BLOCKED

### 5. Paralelize Quando Possível

Identifique tarefas que podem rodar em paralelo:

```markdown
### Tarefas Paralelizáveis
- Tarefas 1.2 e 1.3 (ambas dependem só de 1.1)
- Tarefas 2.1 e 2.3 (ambas dependem de 1.1, 1.2, 1.3)

### Execução
1. Execute Tarefa 1.1
2. Execute Tarefas 1.2 e 1.3 em paralelo
3. Valide ambas
4. Execute Tarefas 2.1 e 2.3 em paralelo
5. Valide ambas
6. Execute Tarefa 2.2 (depende de 2.1)
7. Valide
```

**Regra:** Só paralelize tarefas que não têm dependências entre si.

### 6. Mantenha Contexto Limpo

**Não polua seu contexto:**
- Subagents recebem apenas o que precisam
- Você mantém apenas o ledger e status
- Entregas completas vão para arquivos, não para sua memória

**Use arquivos para handoffs:**
- Briefings de tarefa → arquivos
- Relatórios de subagents → arquivos
- Ledger de progresso → arquivo

### 7. Revise Após Cada Fase

Após completar uma fase (ex: Fase 1: Fundação):
- Revise todas as entregas da fase
- Valide consistência entre elas
- Confirme que estão alinhadas com o plano
- Prossiga para próxima fase

## Modelo de Seleção

Use o modelo menos poderoso que pode handle cada tarefa:

**Tarefas mecânicas** (templates, formatação): modelo fast/cheap
**Tarefas de julgamento** (copy, estratégia): modelo standard
**Tarefas criativas** (design, storytelling): modelo capable

**Sempre especifique o modelo ao delegar.**

## Reporte de Progresso

### Durante Execução

Mantenha o usuário informado (mas não pergunte "devo continuar?"):

```markdown
## Progresso

✅ Fase 1: Fundação (3/3 tarefas)
- Tarefa 1.1: Briefing completo
- Tarefa 1.2: Identidade visual
- Tarefa 1.3: Personas

🔄 Fase 2: Conteúdo (2/3 tarefas)
- Tarefa 2.1: Artigo de blog ✓
- Tarefa 2.2: Cover image ✓
- Tarefa 2.3: Posts LinkedIn (em progresso)

⏳ Fase 3: Visuais (0/3 tarefas)
⏳ Fase 4: Integração (0/1 tarefa)
```

### Após Conclusão

```markdown
## Projeto Concluído!

### Entregas
- 1 briefing completo
- 1 identidade visual
- 2 personas detalhadas
- 1 artigo de blog (1500 palavras)
- 1 cover image
- 10 posts para LinkedIn
[... todas as entregas]

### Qualidade
- Brand voice: consistente em todas as peças
- SEO: otimizado (score 85/100)
- Acessibilidade: alt text em todas as imagens
- Revisão: todas as entregas validadas

### Métricas
- Tarefas: 10/10 completas
- Tempo: 3 semanas (conforme planejado)
- Budget: R$ X (conforme planejado)

### Próximos Passos
1. Revisão final com usuário
2. Aprovação para publicação
3. Agendamento de posts
4. Monitoramento de métricas
```

## Red Flags

**Nunca:**
- Execute sem plano aprovado
- Pule validação de entregas
- Ignore status BLOCKED
- Polua contexto com detalhes desnecessários
- Pergunte "devo continuar?" entre tarefas
- Esqueça de atualizar ledger

**Sempre:**
- Revise plano antes de começar
- Crie ledger de progresso
- Valide cada entrega contra critério de sucesso
- Paralelize quando possível
- Mantenha contexto limpo
- Reporte progresso sem perguntar

## Exemplo de Execução

```
Você: "Executando plano de lançamento do Produto X..."

[Cria ledger de progresso]

Fase 1: Fundação

Tarefa 1.1: Briefing completo
[Delega para Content Creator]
[Content Creator retorna DONE]
[Valida entregável]
[Ledger: Tarefa 1.1 ✓]

Tarefa 1.2: Identidade visual
[Delega para Visual Designer]
[Visual Designer retorna DONE]
[Valida entregável]
[Ledger: Tarefa 1.2 ✓]

Tarefa 1.3: Personas
[Delega para Content Creator em paralelo com 1.2]
[Content Creator retorna DONE]
[Valida entregável]
[Ledger: Tarefa 1.3 ✓]

Fase 1 completa! (3/3 tarefas)

Fase 2: Conteúdo

Tarefa 2.1: Artigo de blog
[Delega para Content Creator]
[Content Creator retorna DONE_WITH_CONCERNS: "artigo ficou longo, 1800 palavras"]
[Valida: comprimento OK para o tema]
[Ledger: Tarefa 2.1 ✓]

Tarefa 2.2: Cover image
[Delega para Visual Designer]
[Visual Designer retorna DONE]
[Valida entregável]
[Ledger: Tarefa 2.2 ✓]

Tarefa 2.3: Posts LinkedIn
[Delega para Social Media Manager]
[Social Media Manager retorna DONE]
[Valida entregável]
[Ledger: Tarefa 2.3 ✓]

Fase 2 completa! (3/3 tarefas)

[... continua até todas as fases]

Projeto concluído!
[Reporte final]
```

## Próximos Passos

Após todas as tarefas completas:
1. Use skill `reviewing-content` para revisão final
2. Use skill `finishing-content-project` para finalizar
3. Apresente pacote completo ao usuário
4. Obtenha aprovação para publicação

## Integração

**Skills relacionadas:**
- `brainstorming-content` — precede o planejamento
- `writing-content-plan` — cria o plano
- `reviewing-content` — valida qualidade
- `finishing-content-project` — finaliza projeto

**Agents relacionados:**
- `marketing-orchestrator` — coordena todo o processo
- Subagents especializados — executam tarefas específicas
