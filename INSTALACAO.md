# 🛠️ Guia de Instalação e Uso - COMMIT DO EDU

Este guia ensina como configurar e usar o script `commit-mensagem.sh` nos sistemas operacionais **Windows**, **macOS** e **Linux**.

---

## 📋 Pré-requisitos

Antes de começar, certifique-se de ter:

- ✅ **Git instalado e configurado**
- ✅ **Repositório Git inicializado** no seu projeto
- ✅ **Acesso ao terminal/prompt de comando**

---

# 🐧 Linux (Ubuntu/Debian/CentOS/Fedora)

## 🔧 Preparação do Sistema

### 1. Verificar se o Git está instalado:

```bash
git --version
```

### 2. Se não estiver instalado:

```bash
# Ubuntu/Debian
sudo apt update && sudo apt install git

# CentOS/RHEL
sudo yum install git

# Fedora
sudo dnf install git
```

## 📥 Instalação do Script

### 1. Baixar o script:

```bash
# Navegar para o diretório do projeto
cd /caminho/para/seu/projeto

# Se o script já está no projeto:
ls commit-personalizado/commit-mensagem.sh

# Ou baixar de outro local se necessário
```

### 2. Tornar o script executável:

```bash
chmod +x commit-personalizado/commit-mensagem.sh
```

### 3. (Opcional) Criar alias global:

```bash
# Adicionar ao .bashrc ou .zshrc
echo 'alias commit-edu="$PWD/commit-personalizado/commit-mensagem.sh"' >> ~/.bashrc

# Recarregar configuração
source ~/.bashrc
```

## 🚀 Como Usar

### Método 1 - Execução direta:

```bash
./commit-personalizado/commit-mensagem.sh
```

### Método 2 - Com alias (se configurado):

```bash
commit-edu
```

---

# 🍎 macOS

## 🔧 Preparação do Sistema

### 1. Verificar se o Git está instalado:

```bash
git --version
```

### 2. Se não estiver instalado:

```bash
# Instalar Xcode Command Line Tools
xcode-select --install

# Ou usando Homebrew (recomendado)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git
```

## 📥 Instalação do Script

### 1. Abrir o Terminal:

- **Pressione**: `Cmd + Espaço`
- **Digite**: "Terminal"
- **Pressione**: `Enter`

### 2. Navegar para o projeto:

```bash
cd /caminho/para/seu/projeto
```

### 3. Verificar se o script existe:

```bash
ls -la commit-personalizado/commit-mensagem.sh
```

### 4. Tornar executável:

```bash
chmod +x commit-personalizado/commit-mensagem.sh
```

### 5. (Opcional) Criar alias global:

```bash
# Para zsh (padrão no macOS Catalina+)
echo 'alias commit-edu="$PWD/commit-personalizado/commit-mensagem.sh"' >> ~/.zshrc
source ~/.zshrc

# Para bash (versões anteriores)
echo 'alias commit-edu="$PWD/commit-personalizado/commit-mensagem.sh"' >> ~/.bash_profile
source ~/.bash_profile
```

## 🚀 Como Usar

### Método 1 - Execução direta:

```bash
./commit-personalizado/commit-mensagem.sh
```

### Método 2 - Com alias:

```bash
commit-edu
```

---

# 🪟 Windows

## 🔧 Preparação do Sistema

### Opção A: Git Bash (Recomendado)

#### 1. Instalar Git for Windows:

- 📥 **Baixe em**: https://git-scm.com/download/win
- ✅ **Execute** o instalador
- ✅ **Marque**: "Git Bash Here" durante a instalação

#### 2. Verificar instalação:

```bash
git --version
```

### Opção B: WSL (Windows Subsystem for Linux)

#### 1. Habilitar WSL:

```powershell
# Executar como Administrador no PowerShell
wsl --install
```

#### 2. Instalar distribuição Linux:

```powershell
wsl --install -d Ubuntu
```

#### 3. Configurar Ubuntu:

```bash
sudo apt update && sudo apt install git
```

## 📥 Instalação do Script

### Para Git Bash:

#### 1. Abrir Git Bash:

- **Clique direito** na pasta do projeto
- **Selecione**: "Git Bash Here"

#### 2. Verificar script:

```bash
ls -la commit-personalizado/commit-mensagem.sh
```

#### 3. Tornar executável:

```bash
chmod +x commit-personalizado/commit-mensagem.sh
```

### Tornar executável DIRETAMENTE no Powershell (com Git Bash):
Após a instalação do script com git bash, você pode executar os passos abaixo para executar o commit-mensagem.sh diretamente no powershell.

#### 1. Abra o PowerShell.<br>Digite o seguinte comando para encontrar o caminho do seu arquivo de perfil:
```powershell
$PROFILE
```
Geralmente, o caminho é algo como:
```powershell
C:\Users\SeuUsuario\Documents\PowerShell\Microsoft.PowerShell_profile.ps1.
```
Se o arquivo não existir, crie-o. Você pode fazer isso diretamente no PowerShell:
```powershell
New-Item -Path $PROFILE -ItemType File -Force
```
#### 2. Abra o arquivo de perfil em um editor de texto (como o Visual Studio Code, Notepad++ ou até mesmo o Notepad):
```powershell
notepad $PROFILE
# ou
code $PROFILE
```
#### 3. Dentro do seu arquivo de perfil (Microsoft.PowerShell_profile.ps1), adicione o seguinte código:
```powershell
function Invoke-CommitCLI {
    # Ajuste o caminho para o bash.exe se necessário
    $bashPath = "C:\Program Files\Git\bin\bash.exe"

    # Ajuste o caminho para o seu script
    $scriptPath = "C:\dev\meu-script\commit-cli.sh"
    
    & $bashPath "$scriptPath"
}

# Cria o alias "cc" para executar a função. Altere 'cc' se desejar.
Set-Alias -Name cc -Value Invoke-CommitCLI
```

#### 4. Recarregue o Perfil
Depois de salvar as alterações no arquivo de perfil, feche e reabra o PowerShell, ou digite o seguinte comando para recarregar o perfil na sessão atual:
```powershell
. $PROFILE
```

### Para WSL:

#### 1. Abrir WSL:

- **Pressione**: `Win + R`
- **Digite**: `wsl`
- **Pressione**: `Enter`

#### 2. Navegar para o projeto:

```bash
# Se o projeto está no Windows
cd /mnt/c/caminho/para/seu/projeto

# Ou mover projeto para Linux
cp -r /mnt/c/caminho/para/projeto ~/meu-projeto
cd ~/meu-projeto
```

#### 3. Configurar permissões:

```bash
chmod +x commit-personalizado/commit-mensagem.sh
```

## 🚀 Como Usar

### Git Bash:

```bash
./commit-personalizado/commit-mensagem.sh
```

### WSL:

```bash
./commit-personalizado/commit-mensagem.sh
```

### PowerShell:
```powershell
# Escreva o ALIAS criado no arquivo Microsoft.PowerShell_profile.ps1
cc
```

### PowerShell (com WSL):

```powershell
wsl ./commit-personalizado/commit-mensagem.sh
```

---

## 🎯 Fluxo de Uso Completo

### 1. 📝 Fazer mudanças no código:

```bash
# Editar arquivos do projeto
nano arquivo.txt
# ou usar seu editor favorito
```

### 2. 🚀 Executar o script:

```bash
./commit-personalizado/commit-mensagem.sh
```

### 3. 📋 Seguir o processo interativo:

#### Passo 1 - Escolher tipo:

```
┌─ Tipos de Commit ────────────────────────────────────────────────
│ [ 1 ] 🚀 feat - Nova funcionalidade incrível
│ [ 2 ] 🐛 fix - Correção de bug
│ [ 3 ] 📚 docs - Documentação
│ [ 4 ] 🎨 style - Formatação e estilo
│ [ 5 ] 🔧 refactor - Refatoração
│ [ 6 ] 🧪 test - Testes
│ [ 7 ] 📦 chore - Manutenção
│ [ 8 ] ⚡ perf - Performance
│ [ 9 ] 🏗️ build - Build
│ [ 0 ] ❌ Sair - Sair do programa
└──────────────────────────────────────────────────────────────────

➤ Digite o número do tipo de commit: 1
```

#### Passo 2 - Definir escopo (opcional):

```
➤ Digite o escopo (opcional):
   Exemplos: 'login', 'api', 'database'
Escopo: auth
```

#### Passo 3 - Escrever descrição:

```
➤ Digite a descrição da alteração:
   Use imperativo: 'adiciona', 'corrige', 'atualiza'
Descrição: adiciona sistema de autenticação JWT
```

#### Passo 4 - Confirmar:

```
╔══════════════════════════════════════════════════════════════════════════════
║ ✅ MENSAGEM GERADA ✅
╠══════════════════════════════════════════════════════════════════════════════
║ feat(auth): adiciona sistema de autenticação JWT
╚══════════════════════════════════════════════════════════════════════════════

┌─ Confirmação ─────────────────────────────────────────────
│ Deseja executar este commit? │
└─────────────────────────────────────────────────────────────────────────
Digite [s/n]: s
```

### 4. ✅ Resultado:

```
╔══════════════════════════════════════════════════════════════════════════════
║ ✅ SUCESSO! ✅
║ Commit realizado com sucesso!
║ ✨ Código enviado para o repositório!
╚══════════════════════════════════════════════════════════════════════════════
```

---

## 🔧 Solução de Problemas

### ❌ "Permission denied"

```bash
# Solução: Tornar script executável
chmod +x commit-personalizado/commit-mensagem.sh
```

### ❌ "No such file or directory"

```bash
# Solução: Verificar caminho
ls commit-personalizado/
pwd
```

### ❌ "Git not found"

```bash
# Linux/macOS
which git

# Windows Git Bash
where git

# Reinstalar se necessário
```

### ❌ "Nothing to commit"

```bash
# Verificar status
git status

# Adicionar arquivos manualmente se necessário
git add arquivo.txt
```

### ❌ Problemas com caracteres especiais no Windows:

```bash
# No Git Bash, configurar encoding
git config --global core.quotepath false
export LANG=en_US.UTF-8
```

---

## 🎨 Personalização

### 🔧 Modificar tipos de commit:

Edite a função `get_commit_type()` no script:

```bash
nano commit-personalizado/commit-mensagem.sh
```

### 🎭 Alterar cores:

Modifique as variáveis de cor no início do script:

```bash
LIGHT_BLUE='\033[1;34m'  # Sua cor preferida
```

### ⚡ Criar atalho global:

#### Linux/macOS:

```bash
# Adicionar ao PATH
sudo ln -s $PWD/commit-personalizado/commit-mensagem.sh /usr/local/bin/commit-edu
```

#### Windows (Git Bash):

```bash
# Criar alias permanente
echo 'alias commit-edu="/c/caminho/completo/commit-personalizado/commit-mensagem.sh"' >> ~/.bashrc
```

---

## 📚 Dicas de Uso

### ✅ Boas Práticas:

- 📝 **Descrições claras**: Use verbos no imperativo
- 🔄 **Commits frequentes**: Não acumule muitas mudanças
- 🏷️ **Escopos consistentes**: Mantenha padrão nos escopos
- 📋 **Revisar antes**: Sempre confirme a mensagem

### 📖 Exemplos de Descrições:

```
✅ Bom: "adiciona validação de email"
❌ Ruim: "adicionou validação"

✅ Bom: "corrige bug na busca de produtos"
❌ Ruim: "fix bug"

✅ Bom: "atualiza documentação da API"
❌ Ruim: "docs"
```

---

## 🆘 Suporte

### 🐛 Problemas?

1. ✅ Verificar pré-requisitos
2. 📖 Consultar seção de solução de problemas
3. 🔍 Verificar logs de erro
4. 💬 Contactar @edusites

### 📚 Recursos Adicionais:

- 📖 [Conventional Commits](https://www.conventionalcommits.org/)
- 📖 [Git Documentation](https://git-scm.com/doc)
- 📖 [Semantic Versioning](https://semver.org/)

---

_🚀 Script criado por @edusites para facilitar commits padronizados!_
