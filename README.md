# 🚀 COMMIT DO EDU - Script de Padronização de Commits

Este script automatiza e padroniza suas mensagens de commit seguindo o padrão **Conventional Commits**, criando um fluxo de trabalho mais organizado e profissional.

## 📋 Visão Geral

O `commit-mensagem.sh` é um script interativo em Bash que:

- Guia você através de um processo estruturado de commit
- Padroniza mensagens seguindo convenções modernas
- Automatiza o processo completo: `git add`, `git commit` e `git push`
- Oferece interface visual colorida e intuitiva

## 🎯 Funcionalidades

### ✨ Interface Visual

- **Cores modernas**: Esquema de cores azul e branco profissional
- **Ícones expressivos**: Emojis para cada tipo de commit
- **Layout estruturado**: Bordas e formatação clara
- **Feedback visual**: Indicadores de sucesso, erro e cancelamento

### 🔧 Tipos de Commit Suportados

| Tipo       | Ícone | Descrição                |
| ---------- | ----- | ------------------------ |
| `feat`     | 🚀    | Nova funcionalidade      |
| `fix`      | 🐛    | Correção de bug          |
| `docs`     | 📚    | Documentação             |
| `style`    | 🎨    | Formatação e estilo      |
| `refactor` | 🔧    | Refatoração de código    |
| `test`     | 🧪    | Testes                   |
| `chore`    | 📦    | Manutenção e tarefas     |
| `perf`     | ⚡    | Melhorias de performance |
| `build`    | 🏗️    | Sistema de build         |

### 🎨 Formato da Mensagem

O script gera mensagens no formato padrão:

```
tipo(escopo): descrição
```

**Exemplos:**

- `feat(auth): adiciona sistema de login`
- `fix: corrige erro de validação no formulário`
- `docs(api): atualiza documentação dos endpoints`

## 🏗️ Arquitetura do Script

### 📁 Estrutura de Funções

#### 🎨 Funções de Visualização

- `show_header()`: Exibe cabeçalho do programa
- `show_types()`: Lista tipos de commit disponíveis
- `show_commit_message()`: Mostra mensagem gerada
- `show_success()`: Feedback de sucesso
- `show_error()`: Feedback de erro
- `show_cancelled()`: Feedback de cancelamento
- `show_loading()`: Indicador de processamento

#### 🧠 Funções de Lógica

- `get_commit_type()`: Converte número em tipo de commit
- `validate_commit_type()`: Valida escolha do usuário
- `validate_message()`: Valida descrição não vazia
- `build_commit_message()`: Constrói mensagem final
- `execute_commit()`: Executa comandos git
- `confirm_action()`: Solicita confirmação do usuário

#### 🔄 Funções de Controle

- `prompt_commit_type()`: Solicita tipo de commit
- `prompt_scope()`: Solicita escopo (opcional)
- `prompt_message()`: Solicita descrição
- `process_commit()`: Orquestra todo o processo
- `main()`: Função principal

### 🎭 Sistema de Cores

```bash
# Cores principais
WHITE='\033[1;37m'       # Texto principal
LIGHT_BLUE='\033[1;34m'  # Bordas e estrutura
LIGHT_CYAN='\033[1;36m'  # Labels e prompts
LIGHT_GREEN='\033[1;32m' # Sucesso
LIGHT_RED='\033[1;31m'   # Erro
LIGHT_YELLOW='\033[1;33m'# Aviso
```

### 🔍 Fluxo de Execução

1. **Inicialização**

   - Limpa tela
   - Exibe cabeçalho
   - Mostra opções de commit

2. **Coleta de Dados**

   - Solicita tipo de commit (obrigatório)
   - Solicita escopo (opcional)
   - Solicita descrição (obrigatório)

3. **Validação**

   - Verifica se tipo é válido
   - Verifica se descrição não está vazia
   - Remove caracteres especiais

4. **Confirmação**

   - Monta mensagem final
   - Exibe preview
   - Solicita confirmação

5. **Execução**
   - `git add -A` (adiciona todos os arquivos)
   - `git commit -m "mensagem"` (cria commit)
   - `git push` (envia para repositório)

## 🔧 Validações e Tratamento de Erros

### ✅ Validações Implementadas

- **Tipo de commit**: Verifica se opção é válida (1-9 ou 0 para sair)
- **Descrição**: Não permite descrição vazia
- **Mudanças**: Verifica se há arquivos modificados antes do commit

### 🛡️ Tratamento de Erros

- **Opção inválida**: Reexibe menu com mensagem de erro
- **Descrição vazia**: Solicita nova descrição
- **Sem mudanças**: Informa que não há nada para commitar
- **Erro no git**: Exibe mensagem de erro amigável

## 🎯 Benefícios

### 👤 Para Desenvolvedores

- **Consistência**: Todas as mensagens seguem o mesmo padrão
- **Rapidez**: Processo automatizado em segundos
- **Clareza**: Interface intuitiva e visual
- **Segurança**: Confirmação antes de executar

### 👥 Para Equipes

- **Histórico legível**: Commits padronizados facilitam revisão
- **Automação**: Possibilita criação de changelogs automáticos
- **Rastreabilidade**: Fácil identificação de tipos de mudança
- **Profissionalismo**: Repositório com aparência profissional

## 🧪 Casos de Uso

### 🚀 Nova Funcionalidade

```bash
Tipo: feat
Escopo: auth
Descrição: adiciona sistema de autenticação JWT
Resultado: feat(auth): adiciona sistema de autenticação JWT
```

### 🐛 Correção de Bug

```bash
Tipo: fix
Escopo:
Descrição: corrige erro de validação no formulário de login
Resultado: fix: corrige erro de validação no formulário de login
```

### 📚 Documentação

```bash
Tipo: docs
Escopo: api
Descrição: atualiza documentação dos endpoints de usuário
Resultado: docs(api): atualiza documentação dos endpoints de usuário
```

## 🔮 Características Técnicas

- **Compatibilidade**: Bash (Linux, macOS, Windows com WSL)
- **Dependências**: Git instalado e configurado
- **Interatividade**: Interface de linha de comando interativa
- **Automação**: Processo completo automatizado
- **Validação**: Múltiplas camadas de validação
- **Feedback**: Resposta visual imediata

## 📊 Padrões Seguidos

- **Conventional Commits**: Especificação oficial
- **Semantic Versioning**: Compatível com versionamento semântico
- **Clean Code**: Código organizado e legível
- **User Experience**: Interface intuitiva e amigável

---

_Criado por @edusites para padronização e automação de commits._
