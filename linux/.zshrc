# 🛠 PATH
# ======================
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# ======================
# 🎨 Colores y Prompt
# ======================
autoload -U colors && colors
setopt PROMPT_SUBST
PROMPT='%F{215}%n%f %F{250}[%~]%f %F{111}➜%f '
RPROMPT='%F{#F5C2E7}[%?]%f'

# ======================
# 📂 Alias
# ======================
alias ls='ls --color=auto'

# ======================
# 📦 Zinit
# ======================
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33}Installing %F{220}Zinit%f%b"
    command mkdir -p "$HOME/.local/share/zinit"
    command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" \
        && print -P "%F{33}Installation successful.%f%b" \
        || print -P "%F{160}Clone failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# ======================
# 🎯 Plugins
# ======================
## Tema Powerlevel10k
zinit light romkatv/powerlevel10k

## Plugins útiles
zinit light zsh-users/zsh-autosuggestions

# Cambiar la tecla TAB para aceptar la sugerencia
bindkey '^I' autosuggest-accept

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-history-substring-search

# ======================
# 🔌 Zinit Annexes
# ======================
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
