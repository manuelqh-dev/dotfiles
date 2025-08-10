export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Colores Midnight Circuit
autoload -U colors && colors

# Prompt personalizado
setopt PROMPT_SUBST

PROMPT='%F{215}%n%f %F{250}[%~]%f %F{111}➜%f '

# Prompt para comandos con error
RPROMPT='%F{#F5C2E7}[%?]%f'

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
