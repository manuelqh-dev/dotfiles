# Colores Midnight Circuit
autoload -U colors && colors

# Definir colores en variables
FG_BG='#0D0D0D'
FG_GREEN='%F{#00FF66}'
FG_PINK='%F{#FF00A0}'
FG_GRAY1='%F{#151515}'
FG_GRAY2='%F{#202020}'
FG_RESET='%f'

# Prompt personalizado
setopt PROMPT_SUBST

PROMPT='${FG_PINK}%n@%m ${FG_GREEN}%1~ ${FG_PINK}❯ ${FG_RESET}'

# Prompt para comandos con error
RPROMPT='${FG_PINK}[%?]${FG_RESET}'

# Opcional: alias para colorear comandos como ls
alias ls='ls --color=auto'

# Enable syntax highlighting if installed
if [[ -r ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Enable autosuggestions if installed
if [[ -r ~/.zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source ~/.zsh-autosuggestions/zsh-autosuggestions.zsh
fi
