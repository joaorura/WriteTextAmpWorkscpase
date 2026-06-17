---
description: 'Git workflow para backup local — como salvar progresso em momentos importantes (workspace 100% local)'
applyTo: '**'
---

# Git Workflow para Backup Local

**Objetivo:** Salvar progresso em momentos importantes usando git como sistema de backup e versionamento local.

**⚠️ IMPORTANTE:** Este workspace é **100% LOCAL**. Não há push para repositórios remotos públicos. O git é usado apenas para:
- Backup local de progresso
- Versionamento de entregas
- Histórico de decisões
- Recuperação de versões anteriores

---

## 📦 Princípios Fundamentais

### 1. Git é Seu Backup Local

**Use git para:**
- ✅ Salvar progresso após brainstorming
- ✅ Versionar planos aprovados
- ✅ Backup de entregas por fase
- ✅ Histórico de decisões
- ✅ Recuperação se algo der errado

**Não se preocupe com:**
- ❌ Push para GitHub/GitLab público
- ❌ Exposição de dados sensíveis (é local!)
- ❌ Colaboração remota (é pessoal!)

### 2. .gitignore Simplificado

O workspace tem `.gitignore` básico para evitar arquivos desnecessários:

```gitignore
# Arquivos temporários e cache
node_modules/
__pycache__/
*.py[cod]
*.so
.Python
env/
venv/

# Logs
npm-debug.log*
*.log

# IDE
.vscode/
.idea/
*.swp
*.swo
*~

# OS
.DS_Store
Thumbs.db

# Backups antigos
backups/*.tar.gz
```

**Nota:** `.env` **PODE** ser commitado porque o repositório é local. Mas se preferir não commitar, adicione `.env` ao `.gitignore`.

### 3. Commite em Momentos Importantes

**Quando commitar:**

1. **Após brainstorming completo**
   ```bash
   git add .brainstorming/decisoes.md
   git commit -m "brainstorming: [nome do projeto] - decisões validadas"
   ```

2. **Após plano aprovado**
   ```bash
   git add .planos/plano-*.md
   git commit -m "plano: [nome do projeto] - plano detalhado aprovado"
   ```

3. **Após cada fase completa**
   ```bash
   git add output/
   git commit -m "fase X: [nome do projeto] - [descrição da fase] completa"
   ```

4. **Após revisão aprovada**
   ```bash
   git add output/
   git commit -m "revisão: [nome do projeto] - qualidade validada"
   ```

5. **Após finalização**
   ```bash
   git add output/
   git add RELATORIO-FINAL.md
   git commit -m "finalização: [nome do projeto] - pacote completo entregue"
   ```

---

## 🔄 Workflow de Git por Projeto

### Início do Projeto

```bash
# Entre no diretório do projeto
cd projetos/meu-projeto

# Inicialize git (se ainda não inicializado)
git init

# Crie branch do projeto
git checkout -b projeto/meu-projeto

# Commit inicial
git add .
git commit -m "início: meu-projeto - estrutura inicial"
```

### Durante Execução

```bash
# Após brainstorming
git add .brainstorming/
git commit -m "brainstorming: escopo validado"

# Após planejamento
git add .planos/
git commit -m "plano: tarefas e dependências definidas"

# Após cada tarefa importante
git add output/[tipo]/[arquivo]
git commit -m "tarefa X: [descrição]"

# Após cada fase
git add output/
git commit -m "fase X: [descrição] completa"
```

### Finalização

```bash
# Adicione todas as entregas
git add output/
git add RELATORIO-FINAL.md

# Commit final
git commit -m "finalização: pacote completo entregue"

# Tag da versão
git tag v1.0.0-meu-projeto

# Push para repositório remoto (se configurado)
git push origin projeto/meu-projeto
git push origin v1.0.0-meu-projeto
```

---

## 📋 Estrutura de Branches

### Branch Principal

```
main (ou master)
  └── Contém apenas templates e estrutura base
  └── Não contém projetos específicos
```

### Branches de Projeto

```
main
  ├── projeto/cliente-a-campanha-x
  ├── projeto/cliente-b-lancamento-y
  ├── projeto/interno-rebranding-z
  └── ...
```

### Branches de Feature

```
projeto/cliente-a-campanha-x
  ├── feature/landing-page
  ├── feature/email-sequence
  ├── feature/social-media
  └── ...
```

---

## 🏷️ Convenções de Commit

### Formato

```
<tipo>: <escopo> - <descrição>

[corpo opcional]

[footer opcional]
```

### Tipos

- `início` — início de projeto
- `brainstorming` — decisões de brainstorming
- `plano` — planejamento
- `tarefa` — tarefa individual
- `fase` — fase completa
- `revisão` — revisão de qualidade
- `finalização` — entrega final
- `ajuste` — ajustes e correções
- `docs` — documentação

### Exemplos

```bash
# Início
git commit -m "início: campanha-lancamento - estrutura inicial"

# Brainstorming
git commit -m "brainstorming: campanha-lancamento - escopo validado com cliente"

# Plano
git commit -m "plano: campanha-lancamento - 10 tarefas definidas"

# Tarefa
git commit -m "tarefa 3: campanha-lancamento - artigo de blog completo"

# Fase
git commit -m "fase 2: campanha-lancamento - conteúdo completo"

# Revisão
git commit -m "revisão: campanha-lancamento - qualidade validada"

# Finalização
git commit -m "finalização: campanha-lancamento - pacote entregue ao cliente"

# Ajuste
git commit -m "ajuste: campanha-lancamento - CTA do email 2 melhorado"

# Docs
git commit -m "docs: campanha-lancamento - aprendizados documentados"
```

---

## 💾 Sobre Dados Sensíveis

### Este Workspace é LOCAL

**Não há risco de exposição pública** porque:
- ✅ Repositório é 100% local (seu computador)
- ✅ Não há push para GitHub/GitLab público
- ✅ Apenas você tem acesso
- ✅ `.env` pode ser commitado sem problemas

### Se Um Dia Exportar o Projeto

**Se precisar compartilhar o projeto com alguém:**

1. **Antes de exportar, remova dados sensíveis:**
   ```bash
   # Crie .env.example sem keys reais
   cp .env .env.example
   # Edite .env.example e remova keys reais
   
   # Adicione .env ao .gitignore temporariamente
   echo ".env" >> .gitignore
   
   # Commit
   git add .gitignore .env.example
   git commit -m "prep: removendo dados sensíveis para exportação"
   ```

2. **Ou use git-archive para exportar sem .env:**
   ```bash
   git archive --format=zip HEAD > projeto-exportado.zip
   # Depois remova .env do zip manualmente
   ```

3. **Sempre avise o destinatário:**
   - "Este projeto contém `.env.example` como template"
   - "Copie para `.env` e preencha suas próprias API keys"

---

## 💾 Backup Automático

### Script de Backup

Crie `scripts/backup-projeto.sh`:

```bash
#!/bin/bash

# Backup automático do projeto
# Uso: ./scripts/backup-projeto.sh [nome-projeto]

PROJETO=${1:-"meu-projeto"}
TIMESTAMP=$(date +"%Y%m%d-%H%M%S")
BACKUP_DIR="backups/$PROJETO"

# Cria diretório de backup
mkdir -p "$BACKUP_DIR"

# Copia arquivos importantes
cp -r "projetos/$PROJETO/briefing.md" "$BACKUP_DIR/"
cp -r "projetos/$PROJETO/brand-voice.md" "$BACKUP_DIR/"
cp -r "projetos/$PROJETO/personas.md" "$BACKUP_DIR/"
cp -r "projetos/$PROJETO/.brainstorming" "$BACKUP_DIR/" 2>/dev/null
cp -r "projetos/$PROJETO/.planos" "$BACKUP_DIR/" 2>/dev/null
cp -r "projetos/$PROJETO/output" "$BACKUP_DIR/" 2>/dev/null

# Cria arquivo de backup
tar -czf "$BACKUP_DIR/backup-$TIMESTAMP.tar.gz" -C "$BACKUP_DIR" .

# Remove arquivos temporários
rm -rf "$BACKUP_DIR/briefing.md" "$BACKUP_DIR/brand-voice.md" "$BACKUP_DIR/personas.md"
rm -rf "$BACKUP_DIR/.brainstorming" "$BACKUP_DIR/.planos" "$BACKUP_DIR/output"

echo "Backup criado: $BACKUP_DIR/backup-$TIMESTAMP.tar.gz"
```

### Uso

```bash
# Backup manual
./scripts/backup-projeto.sh campanha-lancamento

# Backup automático (cron)
# Adicione ao crontab:
# 0 18 * * * /path/to/scripts/backup-projeto.sh campanha-lancamento
```

---

## 📊 Git Hooks (Opcional)

### Pre-Commit Hook

Crie `.git/hooks/pre-commit`:

```bash
#!/bin/bash

# Verifica se há dados sensíveis
if git diff --cached | grep -qE "(API_KEY|SECRET|PASSWORD|TOKEN)="; then
    echo "❌ ERRO: Dados sensíveis detectados!"
    echo "Remova API keys e tokens antes de commitar."
    exit 1
fi

# Verifica se .env está sendo commitado
if git diff --cached --name-only | grep -q "^\.env$"; then
    echo "❌ ERRO: .env não pode ser commitado!"
    echo "Adicione .env ao .gitignore"
    exit 1
fi

echo "✅ Verificações de segurança passaram"
exit 0
```

Torne executável:

```bash
chmod +x .git/hooks/pre-commit
```

---

## 🎯 Checklist de Git Local

### Antes de Commitar

- [ ] Verifiquei `git status`?
- [ ] Verifiquei `git diff`?
- [ ] Usei mensagem de commit descritiva?
- [ ] Segui convenção de commits?

### Após Commitar

- [ ] Commit está limpo?
- [ ] Mensagem está clara?
- [ ] Se é momento importante, criei tag?

### Periodicamente

- [ ] Fiz backup do repositório local?
- [ ] Limpei branches antigas?
- [ ] Revisei histórico com `git log`?

---

## 🚨 Red Flags

**Nunca:**
- Esqueça de commitar em momentos importantes
- Use mensagens de commit vagas ("updates", "changes")
- Deixe branches antigas acumularem
- Esqueça de criar tags para versões estáveis

**Sempre:**
- Commite em momentos importantes (brainstorming, plano, fases, finalização)
- Use mensagens de commit descritivas
- Crie tags para versões estáveis
- Faça backup do repositório local periodicamente
- Limpe branches antigas

---

## 📖 Recursos Adicionais

- **Git Documentation:** https://git-scm.com/doc
- **GitHub Security:** https://docs.github.com/en/authentication/keeping-your-account-and-data-secure
- **BFG Repo-Cleaner:** https://rtyley.github.io/bfg-repo-cleaner/

---

**Use git como sistema de backup local para salvar progresso em momentos importantes!**

**Lembre-se:** Este workspace é 100% local. Não há push para repositórios remotos públicos. O git é seu amigo para versionamento e backup, não uma fonte de preocupação com segurança.
