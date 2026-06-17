---
description: 'Guia para IA validar e guiar bootstrap do workspace'
applyTo: '**'
---

# Guia de Bootstrap para IA

**Este documento orienta a IA sobre como validar e guiar o usuário no processo de bootstrap.**

---

## 🎯 Filosofia

**A IA NÃO executa comandos de sistema diretamente.** Em vez disso:

1. **Detecta** se o bootstrap foi executado
2. **Guia** o usuário para executar o script
3. **Valida** que tudo foi configurado corretamente
4. **Usa** o workspace configurado

---

## 🔍 Detecção de Bootstrap

### Verifique se o bootstrap já foi executado

```markdown
1. Leia o arquivo `.bootstrap-complete` na raiz do workspace
2. Se existir, o bootstrap já foi executado
3. Se não existir, guie o usuário para executar
```

### Validação Rápida

Se `.bootstrap-complete` existe, valide:

```markdown
1. Verifique se `.env` existe
2. Verifique se `opencode.jsonc` existe
3. Verifique se `.opencode/agents/` existe
4. Verifique se `projetos/_modelo/` existe

Se tudo existe → workspace está pronto
Se algo falta → guie usuário para executar bootstrap novamente
```

---

## 📋 Guia para Usuário (Quando Bootstrap Não Foi Executado)

### Mensagem Inicial

```markdown
Olá! Detectei que este workspace ainda não foi configurado.

Para começar, precisamos executar o script de bootstrap que vai:

1. ✓ Instalar Node.js, Python e Git (se necessário)
2. ✓ Instalar OpenCode CLI
3. ✓ Configurar MCPs via GUI interativa
4. ✓ Instalar dependências
5. ✓ Inicializar repositório git

**Como executar:**

1. Abra o PowerShell como **Administrador**
   - Clique com botão direito no PowerShell
   - Selecione "Executar como Administrador"

2. Navegue até o diretório do workspace:
   ```powershell
   cd D:\GitHub\WriteTextAmpWorkscpase
   ```

3. Execute o script de bootstrap:
   ```powershell
   .\bootstrap.ps1
   ```

4. Siga as instruções na tela:
   - A GUI vai abrir para configurar MCPs
   - Selecione quais ferramentas quer usar
   - Preencha API keys quando necessário
   - Clique em "Instalar e Finalizar"

5. Quando terminar, volte aqui e me diga:
   "Bootstrap concluído"

Estou pronto para ajudar quando você terminar! 🚀
```

---

## ✅ Validação Pós-Bootstrap

### Quando o usuário disser "Bootstrap concluído"

Execute estas validações:

```markdown
1. Leia `.bootstrap-complete`
   - Se não existe → bootstrap não foi executado corretamente
   
2. Leia `.env`
   - Verifique se tem configurações (não está vazio)
   - Verifique se tem pelo menos um MCP habilitado
   
3. Leia `opencode.jsonc`
   - Verifique se está válido (JSON válido)
   - Verifique se tem seção "mcp"
   
4. Verifique diretórios críticos:
   - .opencode/agents/
   - .opencode/skills/
   - .opencode/instructions/
   - projetos/_modelo/
   - _templates/

5. Se tudo OK → workspace está pronto para uso
6. Se algo falhar → guie usuário para executar bootstrap novamente
```

### Mensagem de Sucesso

```markdown
🎉 Perfeito! Bootstrap validado com sucesso!

O workspace está completamente configurado e pronto para uso.

**Próximo passo:** Crie seu primeiro projeto

```powershell
Copy-Item -Path "projetos\_modelo" -Destination "projetos\meu-primeiro-projeto" -Recurse
cd projetos\meu-primeiro-projeto
```

Depois é só começar a criar conteúdo!

Exemplo:
```
@marketing-orchestrator "Preciso de uma campanha de lançamento para o Produto X"
```

Estou pronto para ajudar! O que você quer criar hoje? 🚀
```

---

## 🆘 Troubleshooting

### Problema: "Bootstrap falhou"

**Guia o usuário:**

```markdown
Entendo que o bootstrap falhou. Vamos resolver:

1. Verifique se o PowerShell está como Administrador
2. Verifique sua conexão com internet
3. Tente executar novamente:
   ```powershell
   .\bootstrap.ps1 -Force
   ```

Se o erro persistir, me diga:
- Qual foi a mensagem de erro?
- Em qual passo falhou?

Posso ajudar a diagnosticar o problema.
```

### Problema: "GUI não abriu"

**Guia o usuário:**

```markdown
A GUI pode não ter aberto por alguns motivos:

1. Verifique se Python está instalado:
   ```powershell
   python --version
   ```

2. Se Python não está instalado, instale manualmente:
   - Download: https://www.python.org/downloads/
   - Marque "Add Python to PATH" durante instalação

3. Depois tente novamente:
   ```powershell
   .\bootstrap.ps1
   ```

Ou use o modo sem GUI:
```powershell
.\bootstrap.ps1 -SkipGUI
```

Depois configure `.env` manualmente copiando de `.env.template`.
```

### Problema: "OpenCode não encontrado"

**Guia o usuário:**

```markdown
OpenCode CLI não foi encontrado. Vamos instalar:

```powershell
npm install -g opencode
```

Verifique a instalação:
```powershell
opencode --version
```

Se ainda não funcionar, verifique se Node.js está instalado:
```powershell
node --version
npm --version
```

Se Node.js não está instalado, execute o bootstrap novamente:
```powershell
.\bootstrap.ps1
```
```

---

## 🎓 Comportamento da IA

### O que a IA DEVE fazer:

✅ **Detectar** se bootstrap foi executado (lendo `.bootstrap-complete`)
✅ **Validar** que arquivos críticos existem
✅ **Guiar** o usuário com instruções claras
✅ **Responder** perguntas sobre o processo
✅ **Ajudar** com troubleshooting
✅ **Celebrar** quando bootstrap for concluído

### O que a IA NÃO DEVE fazer:

❌ **Executar** `bootstrap.ps1` diretamente
❌ **Instalar** Node.js, Python, Git via comandos
❌ **Modificar** `.env` sem permissão explícita
❌ **Assumir** que prerequisites estão instalados
❌ **Ignorar** erros de validação

---

## 📊 Fluxo Completo

```
Usuário inicia conversa
    ↓
IA lê `.bootstrap-complete`
    ↓
├─ Existe? → Valida arquivos → Workspace pronto → Começa a trabalhar
│
└─ Não existe? → Guia usuário para executar bootstrap
                    ↓
                Usuário executa bootstrap
                    ↓
                Usuário volta e diz "concluído"
                    ↓
                IA valida instalação
                    ↓
                Workspace pronto → Começa a trabalhar
```

---

## 💡 Dicas

### Seja Proativo

Se o usuário pedir para criar conteúdo mas o bootstrap não foi executado:

```markdown
Antes de criar conteúdo, precisamos configurar o workspace.

[Guia para executar bootstrap]

Depois que terminar, estarei pronto para ajudar com seu projeto!
```

### Seja Paciente

O bootstrap pode levar alguns minutos. Não pressione o usuário.

### Seja Útil

Se o usuário tiver problemas, ofereça soluções específicas baseadas no erro.

---

**Lembre-se:** Você é um guia, não um executor. O usuário está no controle!
