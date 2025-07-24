#!/bin/bash

# Cores mais claras e modernas - Azul e Branco como principais
WHITE='\033[1;37m'
LIGHT_BLUE='\033[1;34m'
BLUE='\033[0;34m'
DARK_BLUE='\033[0;36m'
LIGHT_CYAN='\033[1;36m'
CYAN='\033[0;36m'
LIGHT_GRAY='\033[0;37m'
GRAY='\033[0;90m'
LIGHT_GREEN='\033[1;32m'
GREEN='\033[0;32m'
LIGHT_YELLOW='\033[1;33m'
YELLOW='\033[0;33m'
LIGHT_RED='\033[1;31m'
RED='\033[0;31m'
LIGHT_PURPLE='\033[1;35m'
PURPLE='\033[0;35m'
NC='\033[0m'

# Símbolos e ícones mais legais
CHECK_MARK="✅"
CROSS_MARK="❌"
ARROW="➤"
STAR="⭐"
ROCKET="🚀"
GEAR="⚙️"
BUG="🐛"
DOCS="📚"
STYLE="🎨"
REFACTOR="🔧"
TEST="🧪"
CHORE="📦"
PERF="⚡"
BUILD="🏗️"
CI="🔄"
SPARKLE="✨"
FIRE="🔥"
BRAIN="🧠"
MAGIC="🔮"
TARGET="🎯"
CLOCK="⏰"
LIGHT="💡"
SHIELD="🛡️"
EXIT="🚪"

# --------------------------------------------
# Funções de visualização
# --------------------------------------------

show_header() {
  clear
  echo -e "${LIGHT_BLUE}╔══════════════════════════════════════════════════════════════════════════════${NC}"
  echo -e "${LIGHT_BLUE}║${NC} ${STAR} ${WHITE}COMMIT DO EDU${NC} ${STAR} ${NC}"
  echo -e "${LIGHT_BLUE}║${NC} ${LIGHT_CYAN}Formato padronizado${NC} - ${WHITE}@edusites${NC}"
  echo -e "${LIGHT_BLUE}╚══════════════════════════════════════════════════════════════════════════════${NC}"
  echo
}

show_types() {
  echo -e "${WHITE}${ARROW} ${LIGHT_CYAN}Escolha o tipo de alteração:${NC}"
  echo
  echo -e "${LIGHT_BLUE}┌─${NC} ${LIGHT_CYAN}Tipos de Commit${NC} ${LIGHT_BLUE}────────────────────────────────────────────────${NC}"
  echo -e "${LIGHT_BLUE}│${NC} [ 1 ] ${ROCKET} ${LIGHT_CYAN}feat${NC} ${WHITE}- Nova funcionalidade incrível${NC}"
  echo -e "${LIGHT_BLUE}│${NC} [ 2 ] ${BUG} ${LIGHT_CYAN}fix${NC} ${WHITE}- Correção de bug${NC}"
  echo -e "${LIGHT_BLUE}│${NC} [ 3 ] ${DOCS} ${LIGHT_CYAN}docs${NC} ${WHITE}- Documentação${NC}"
  echo -e "${LIGHT_BLUE}│${NC} [ 4 ] ${STYLE} ${LIGHT_CYAN}style${NC} ${WHITE}- Formatação e estilo${NC}"
  echo -e "${LIGHT_BLUE}│${NC} [ 5 ] ${REFACTOR} ${LIGHT_CYAN}refactor${NC} ${WHITE}- Refatoração${NC}"
  echo -e "${LIGHT_BLUE}│${NC} [ 6 ] ${TEST} ${LIGHT_CYAN}test${NC} ${WHITE}- Testes${NC}"
  echo -e "${LIGHT_BLUE}│${NC} [ 7 ] ${CHORE} ${LIGHT_CYAN}chore${NC} ${WHITE}- Manutenção${NC}"
  echo -e "${LIGHT_BLUE}│${NC} [ 8 ] ${PERF} ${LIGHT_CYAN}perf${NC} ${WHITE}- Performance${NC}"
  echo -e "${LIGHT_BLUE}│${NC} [ 9 ] ${BUILD} ${LIGHT_CYAN}build${NC} ${WHITE}- Build${NC}"
  echo -e "${LIGHT_BLUE}│${NC} [ 0 ] ${CROSS_MARK} ${LIGHT_CYAN}Sair${NC} ${WHITE}- Sair do programa${NC}"
  echo -e "${LIGHT_BLUE}└──────────────────────────────────────────────────────────────────────${NC}"
  echo
}

show_commit_message() {
  local message=$1
  show_header
  echo -e "${LIGHT_BLUE}╔══════════════════════════════════════════════════════════════════════════════${NC}"
  echo -e "${LIGHT_BLUE}║${NC} ${CHECK_MARK} ${WHITE}MENSAGEM GERADA${NC} ${CHECK_MARK} ${NC}"
  echo -e "${LIGHT_BLUE}╠══════════════════════════════════════════════════════════════════════════════${NC}"
  echo -e "${LIGHT_BLUE}║${NC} ${WHITE}$message${NC}"
  echo -e "${LIGHT_BLUE}╚══════════════════════════════════════════════════════════════════════════════${NC}"
  echo
}

show_success() {
  echo -e "${LIGHT_BLUE}╔══════════════════════════════════════════════════════════════════════════════${NC}"
  echo -e "${LIGHT_BLUE}║${NC} ${CHECK_MARK} ${LIGHT_GREEN}SUCESSO!${NC} ${CHECK_MARK}${NC}"
  echo -e "${LIGHT_BLUE}║${NC} ${GREEN}Commit realizado com sucesso!${NC}"
  echo -e "${LIGHT_BLUE}║${NC} ${LIGHT_CYAN}${SPARKLE} Código enviado para o repositório!${NC}"
  echo -e "${LIGHT_BLUE}╚══════════════════════════════════════════════════════════════════════════════${NC}"
}

show_error() {
  echo -e "${LIGHT_BLUE}╔══════════════════════════════════════════════════════════════════════════════${NC}"
  echo -e "${LIGHT_BLUE}║${NC} ${CROSS_MARK} ${LIGHT_RED}ERRO!${NC} ${CROSS_MARK}${NC}"
  echo -e "${LIGHT_BLUE}║${NC} ${RED}Erro ao executar o commit.${NC}"
  echo -e "${LIGHT_BLUE}║${NC} ${WHITE}Verifique se há arquivos editados.${NC}"
  echo -e "${LIGHT_BLUE}╚══════════════════════════════════════════════════════════════════════════════${NC}"
}

show_cancelled() {
  echo -e "${LIGHT_BLUE}╔══════════════════════════════════════════════════════════════════════════════${NC}"
  echo -e "${LIGHT_BLUE}║${NC} ${CROSS_MARK} ${LIGHT_YELLOW}CANCELADO${NC} ${CROSS_MARK}${NC}"
  echo -e "${LIGHT_BLUE}║${NC} ${YELLOW}Commit não foi executado.${NC}"
  echo -e "${LIGHT_BLUE}╚══════════════════════════════════════════════════════════════════════════════${NC}"
}

show_loading() {
  echo -e "${LIGHT_CYAN}${ARROW} Processando...${NC}"
}

# --------------------------------------------
# Funções de lógica pura
# --------------------------------------------

get_commit_type() {
  local choice=$1
  case $choice in
    1) echo "feat";;
    2) echo "fix";;
    3) echo "docs";;
    4) echo "style";;
    5) echo "refactor";;
    6) echo "test";;
    7) echo "chore";;
    8) echo "perf";;
    9) echo "build";;
    10) echo "ci";;
    *) echo "";;
  esac
}

validate_commit_type() {
  local choice=$1
  [ -n "$(get_commit_type "$choice")" ] || [ "$choice" -eq 0 ]
}

validate_message() {
  local message=$1
  [ -n "$message" ]
}

build_commit_message() {
  local type=$1
  local scope=$2
  local message=$3

  if [ -n "$scope" ]; then
    echo "$type($scope): $message"
  else
    echo "$type: $message"
  fi
}

execute_commit() {
  local message=$1
  show_loading
  
  # Verificar se há mudanças para commitar (staging area OU working directory)
  if ! git diff --cached --quiet || ! git diff --quiet; then
    git add -A
    git commit -m "$message"
    git push
    return $?
  else
    echo -e "${LIGHT_RED}Nenhuma mudança detectada para commitar.${NC}"
    return 1
  fi
}

confirm_action() {
  local prompt=$1
  echo -e "${LIGHT_BLUE}┌─${NC} ${WHITE}Confirmação${NC} ${LIGHT_BLUE}─────────────────────────────────────────────${NC}"
  echo -e "${LIGHT_BLUE}│${NC} ${prompt} ${LIGHT_BLUE}│${NC}"
  echo -e "${LIGHT_BLUE}└─────────────────────────────────────────────────────────────────────────${NC}"
  read -p "Digite [s/n]: " confirm
  [[ -z "$confirm" || "$confirm" =~ ^[sS]$ ]]
}

# --------------------------------------------
# Funções de controle de fluxo
# --------------------------------------------

prompt_commit_type() {
  local choice
  while true; do
    echo -e "${WHITE}${ARROW} ${LIGHT_CYAN}Digite o número do tipo de commit:${NC} " >&2
    read -p "" choice

    if validate_commit_type "$choice"; then
      if [ "$choice" -eq 0 ]; then
        echo -e "${LIGHT_BLUE}╔══════════════════════════════════════════════════════════════════════════════${NC}" >&2
        echo -e "${LIGHT_BLUE}║${NC} ${CROSS_MARK} ${LIGHT_YELLOW}SAINDO...${NC} ${CROSS_MARK}${NC}" >&2
        echo -e "${LIGHT_BLUE}╚══════════════════════════════════════════════════════════════════════════════${NC}" >&2
        exit 0
      fi
      echo "$choice"
      break
    else
      show_header >&2
      show_types >&2
      echo -e "${LIGHT_BLUE}┌─${NC} ${LIGHT_RED}Erro${NC} ${LIGHT_BLUE}──────────────────────────────────────────────────────${NC}" >&2
      echo -e "${LIGHT_BLUE}│${NC} ${RED}Opção inválida! Digite um número de 1 a 10.${NC} ${LIGHT_BLUE}${NC}" >&2
      echo -e "${LIGHT_BLUE}└────────────────────────────────────────────────────────────────────────────${NC}" >&2
      echo >&2
    fi
  done
}

prompt_scope() {
  local scope
  echo -e "${WHITE}${ARROW} ${LIGHT_CYAN}Digite o escopo (opcional):${NC}" >&2
  echo -e "${WHITE}   Exemplos: 'login', 'api', 'database'${NC}" >&2
  read -p "Escopo: " scope
  echo "$scope"
}

prompt_message() {
  local message
  while true; do
    echo -e "${WHITE}${ARROW} ${LIGHT_CYAN}Digite a descrição da alteração:${NC}" >&2
    echo -e "${WHITE}   Use imperativo: 'adiciona', 'corrige', 'atualiza'${NC}" >&2
    read -p "Descrição: " message
    if validate_message "$message"; then
      echo "$message"
      break
    else
      echo -e "${LIGHT_BLUE}┌─${NC} ${LIGHT_RED}Erro${NC} ${LIGHT_BLUE}──────────────────────────────────────────────────────${NC}" >&2
      echo -e "${LIGHT_BLUE}│${NC} ${RED}A descrição não pode ser vazia!${NC} ${LIGHT_BLUE}${NC}" >&2
      echo -e "${LIGHT_BLUE}└────────────────────────────────────────────────────────────────────────────${NC}" >&2
      echo >&2
    fi
  done
}

process_commit() {
  local type_choice=$(prompt_commit_type)
  local type=$(get_commit_type "$type_choice")
  local scope=$(prompt_scope)
  local message=$(prompt_message)

  # Limpar a mensagem de possíveis caracteres especiais
  local clean_message=$(echo "$message" | tr -d '\r\n\t')
  local clean_scope=$(echo "$scope" | tr -d '\r\n\t')
  
  local commit_message=$(build_commit_message "$type" "$clean_scope" "$clean_message")

  show_commit_message "$commit_message"

  if confirm_action "Deseja executar este commit?"; then
    if execute_commit "$commit_message"; then
      show_success
    else
      show_error
    fi
  else
    show_cancelled
  fi
}

# --------------------------------------------
# Função principal
# --------------------------------------------

main() {
  while true; do
    show_header
    show_types
    process_commit

    exit
  done
}

main
