# Guia do Orquestrador — Marketing Orchestrator

**Como usar o sistema de orquestração inteligente para projetos de marketing complexos.**

## 🎯 Quando Usar o Orquestrador

Use o **marketing-orchestrator** quando:

✅ **Projetos complexos** com múltiplos entregáveis
- "Campanha completa de lançamento"
- "Estratégia de conteúdo para Q1"
- "Tudo que preciso para o evento X"

✅ **Múltiplos tipos de conteúdo**
- Artigo + posts + emails + apresentação
- Whitepaper + social media + banners
- Case de sucesso + newsletter + webinar

✅ **Coordenação de múltiplos subagents**
- Content Creator + Visual Designer + Social Media Manager
- Document Generator + Email Marketing
- Qualquer combinação de 2+ subagents

✅ **Projetos com dependências**
- Briefing → Identidade visual → Conteúdo → Visuais → Documentos
- Planejamento → Execução → Revisão → Finalização

**NÃO use** para tarefas simples:
- ❌ "Escreva um artigo sobre X" → use @content-creator diretamente
- ❌ "Crie um post para LinkedIn" → use @social-media-manager diretamente
- ❌ "Gere um PDF" → use @document-generator diretamente

## 🔄 Workflow Completo

### Fase 1: Brainstorming (brainstorming-content)

**Objetivo:** Refinar ideias e validar escopo antes de executar.

**O orquestrador vai:**
1. Fazer perguntas socráticas para entender o objetivo real
2. Explorar alternativas e abordagens
3. Validar público-alvo, canais e formatos
4. Documentar decisões em `.brainstorming/decisoes.md`

**Exemplo:**
```
Você: "Preciso de uma campanha de lançamento"

Orquestrador: "Vamos fazer um brainstorming rápido:
1. O que está sendo lançado?
2. Qual o objetivo principal (vendas, leads, awareness)?
3. Quem é o público-alvo?
4. Qual o timeline e budget?
5. Já fizemos algo similar antes?"

[Após respostas]

Orquestrador: "Baseado no que você disse, vejo 3 caminhos:

**Opção A: Foco em LinkedIn (Recomendada)**
- 10 posts em 2 semanas
- 1 whitepaper técnico
- 1 webinar de 30min
- Budget: R$ X
- Timeline: 3 semanas

**Opção B: Multi-canal**
[...]

**Opção C: Minimalista**
[...]

Qual faz mais sentido?"
```

### Fase 2: Planejamento (writing-content-plan)

**Objetivo:** Criar plano detalhado com tarefas, dependências e entregáveis.

**O orquestrador vai:**
1. Decompor projeto em tarefas de 2-5 minutos cada
2. Definir dependências entre tarefas
3. Especificar subagent para cada tarefa
4. Criar cronograma realista
5. Salvar plano em `.planos/plano-nome.md`

**Exemplo:**
```markdown
# Plano de Execução: Lançamento Produto X

## Tarefas

### Fase 1: Fundação (Semana 1)
**Tarefa 1.1: Criar briefing completo**
- Subagent: Content Creator
- Entregável: `output/briefing.md`
- Dependências: nenhuma
- Tempo: 3 min

**Tarefa 1.2: Definir identidade visual**
- Subagent: Visual Designer
- Entregável: `output/assets/identidade-visual.md`
- Dependências: Tarefa 1.1
- Tempo: 4 min

**Tarefa 1.3: Criar personas detalhadas**
- Subagent: Content Creator
- Entregável: `output/personas.md`
- Dependências: Tarefa 1.1
- Tempo: 3 min

### Fase 2: Conteúdo (Semana 2)
**Tarefa 2.1: Escrever artigo de blog**
- Subagent: Content Creator
- Entregável: `output/artigos/artigo-principal.md`
- Dependências: Tarefas 1.1, 1.2, 1.3
- Tempo: 5 min

[... continua]
```

### Fase 3: Execução (executing-content-plan)

**Objetivo:** Executar tarefas delegando para subagents especializados.

**O orquestrador vai:**
1. Criar ledger de progresso em `.orchestrator/progress.md`
2. Para cada tarefa:
   - Preparar briefing específico
   - Delegar para subagent
   - Validar entrega
   - Atualizar ledger
3. Paralelizar tarefas quando possível
4. Reportar progresso continuamente

**Exemplo:**
```
Orquestrador: "Executando plano de lançamento..."

Fase 1: Fundação
✅ Tarefa 1.1: Briefing completo (Content Creator)
✅ Tarefa 1.2: Identidade visual (Visual Designer)
✅ Tarefa 1.3: Personas (Content Creator)

Fase 2: Conteúdo
✅ Tarefa 2.1: Artigo de blog (Content Creator)
✅ Tarefa 2.2: Cover image (Visual Designer)
🔄 Tarefa 2.3: Posts LinkedIn (Social Media Manager) - em progresso

[... continua até completar todas]
```

### Fase 4: Revisão (reviewing-content)

**Objetivo:** Validar qualidade, consistência e alinhamento com briefing.

**O orquestrador vai:**
1. Revisar cada entrega individualmente
2. Validar consistência entre peças
3. Confirmar alinhamento com briefing
4. Verificar SEO e acessibilidade
5. Documentar issues e recomendações

**Exemplo:**
```markdown
## Revisão Final: Lançamento Produto X

**Status:** ✅ Projeto aprovado

**Qualidade:**
- ✅ Brand voice consistente em todas as peças
- ✅ SEO otimizado (score 85/100)
- ✅ Acessibilidade (alt text em todas as imagens)
- ✅ CTAs claros e adequados ao funil

**Issues:**
- Nenhum issue crítico
- Issues menores: 2 (já corrigidos)

**Recomendações:**
1. Aprovar para publicação
2. Agendar posts conforme calendário
3. Monitorar métricas após 30 dias
```

### Fase 5: Finalização (finishing-content-project)

**Objetivo:** Entregar pacote final, obter aprovação e documentar aprendizados.

**O orquestrador vai:**
1. Organizar pacote final em `output/`
2. Criar relatório completo em `output/RELATORIO-FINAL.md`
3. Apresentar pacote ao usuário
4. Obter aprovação explícita
5. Documentar aprendizados em `.orchestrator/aprendizados.md`
6. Limpar workspace temporário

**Exemplo:**
```
Orquestrador: "Projeto concluído! 🎉

Seu pacote está completo e pronto para publicação:

✅ 1 artigo de blog (1500 palavras)
✅ 10 posts para LinkedIn (com visuais)
✅ Sequência de 5 emails
✅ Whitepaper (3000 palavras, PDF)
✅ Apresentação (10 slides, PDF)
✅ 5 banners para social media

Todos os arquivos estão em `output/`.

Relatório final: `output/RELATORIO-FINAL.md`

Precisa de ajustes ou está pronto para publicação?"
```

## 🎨 Exemplos de Uso

### Exemplo 1: Campanha de Lançamento

```
Você: @marketing-orchestrator "Preciso de uma campanha completa de lançamento para o Produto X"

Orquestrador: [Inicia brainstorming]
Orquestrador: [Cria plano com 10 tarefas]
Orquestrador: [Executa com 5 subagents]
Orquestrador: [Revisa todas as entregas]
Orquestrador: [Finaliza e entrega pacote]
```

### Exemplo 2: Estratégia de Conteúdo Trimestral

```
Você: @marketing-orchestrator "Estratégia de conteúdo para Q1 2026"

Orquestrador: [Brainstorming sobre objetivos, público, canais]
Orquestrador: [Planeja calendário editorial de 3 meses]
Orquestrador: [Executa criação de conteúdo para cada mês]
Orquestrador: [Revisa consistência e qualidade]
Orquestrador: [Entrega pacote com 3 meses de conteúdo]
```

### Exemplo 3: Rebranding Completo

```
Você: @marketing-orchestrator "Rebranding completo da empresa"

Orquestrador: [Brainstorming sobre nova identidade]
Orquestrador: [Planeja entregas: identidade, templates, conteúdo]
Orquestrador: [Executa com Visual Designer + Content Creator]
Orquestrador: [Revisa consistência visual e verbal]
Orquestrador: [Entrega brand book + templates + conteúdo]
```

## 📊 Estrutura de Arquivos

### Durante Execução

```
projetos/meu-projeto/
├── .brainstorming/
│   └── decisoes.md              # Decisões do brainstorming
├── .planos/
│   └── plano-lancamento.md      # Plano detalhado
├── .orchestrator/
│   ├── progress.md              # Ledger de progresso
│   ├── task-briefs/             # Briefings de tarefas
│   │   ├── tarefa-1-brief.md
│   │   ├── tarefa-2-brief.md
│   │   └── ...
│   └── aprendizados.md          # Aprendizados do projeto
└── output/                      # Entregas finais
    ├── briefing.md
    ├── artigos/
    ├── social-media/
    ├── emails/
    ├── documentos/
    ├── imagens/
    └── RELATORIO-FINAL.md
```

### Após Finalização

```
projetos/meu-projeto/
├── .brainstorming/
│   └── decisoes.md              # Mantido para referência
├── .planos/
│   └── plano-lancamento.md      # Mantido para referência
├── .orchestrator/
│   ├── progress.md              # Mantido para referência
│   └── aprendizados.md          # Mantido para referência
└── output/                      # Pacote final limpo
    ├── briefing.md
    ├── artigos/
    ├── social-media/
    ├── emails/
    ├── documentos/
    ├── imagens/
    └── RELATORIO-FINAL.md
```

## 🎯 Boas Práticas

### 1. Seja Específico na Solicitação

**Ruim:**
```
"Preciso de conteúdo"
```

**Bom:**
```
"Preciso de uma campanha completa de lançamento para o Produto X, 
focada em gerar 50 leads qualificados em 30 dias, 
público-alvo: Gerentes de TI em empresas 100-500 funcionários"
```

### 2. Participe do Brainstorming

O brainstorming é crucial para alinhar expectativas. Responda as perguntas do orquestrador com detalhes.

### 3. Revise o Plano Antes de Executar

Quando o orquestrador apresentar o plano, revise:
- As tarefas fazem sentido?
- As dependências estão corretas?
- O timeline é realista?
- Os subagents estão adequados?

### 4. Valide Entregas Intermediárias

Se o orquestrador pedir validação durante execução, revise com atenção:
- A entrega atende o critério de sucesso?
- Está alinhada com o briefing?
- A qualidade está adequada?

### 5. Forneça Feedback Claro

Se algo precisa ser ajustado, seja específico:
- "O post 3 do LinkedIn precisa de CTA mais forte"
- "A imagem do banner está muito escura"
- "O email 2 está muito longo, reduza para 300 palavras"

## 🚨 Troubleshooting

### Orquestrador não está delegando tarefas

**Solução:**
- Verifique se o agent está definido em `.opencode/agents/marketing-orchestrator.agent.md`
- Verifique se os subagents estão em `.opencode/agents/subagents/`
- Reinicie o OpenCode

### Subagent não responde

**Solução:**
- Verifique se o subagent está definido
- Verifique se o nome está correto
- Tente usar o subagent diretamente para testar

### Projeto não está isolado

**Solução:**
- Certifique-se de estar no diretório do projeto
- Não trabalhe no diretório raiz do workspace

### Tarefas estão falhando

**Solução:**
- Verifique o ledger de progresso em `.orchestrator/progress.md`
- Identifique qual tarefa falhou
- Verifique o briefing da tarefa em `.orchestrator/task-briefs/`
- Forneça mais contexto ou quebre em tarefas menores

## 📚 Recursos Adicionais

- **WORKSPACE.md** — Guia completo do workspace
- **QUICKSTART.md** — Início rápido
- **.opencode/agents/marketing-orchestrator.agent.md** — Documentação do orquestrador
- **.opencode/skills/** — Documentação das skills de workflow

## 🎓 Filosofia do Orquestrador

O orquestrador segue a metodologia do **Superpowers**:

1. **Brainstorming antes de executar** — Refine ideias antes de gastar recursos
2. **Planejamento detalhado** — Decomponha em tarefas pequenas e claras
3. **Execução via subagents** — Delegue para especialistas, mantenha contexto limpo
4. **Revisão constante** — Valide qualidade em cada etapa
5. **Documentação completa** — Ledger de progresso, decisões, aprendizados

**Princípio central:** "Nunca execute tarefas diretamente. Seu papel é coordenar, não executar."

---

**Use o orquestrador para projetos complexos e coordene múltiplos subagents de forma inteligente!**
