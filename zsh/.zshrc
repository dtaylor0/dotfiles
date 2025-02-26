export PATH=/opt/homebrew/bin:$PATH:~/go/bin:~/.cargo/bin
alias "vim"=nvim
alias "l"='ls --color=auto -aLF'

autoload -Uz compinit && compinit # tab autocomplete menus

# Set prompt with git branch
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats "%F{blue}git:(%f%F{red}%b%f%F{blue})%f "
PROMPT='%B%F{cyan}%1d%f ${vcs_info_msg_0_}%b%{$reset_color%}⨯ '

source $HOME/.zsh.env

. "$HOME/.local/bin/env"

# bun completions
[ -s "/Users/drewtaylor/.bun/_bun" ] && source "/Users/drewtaylor/.bun/_bun"

# bun executables
export PATH="$HOME/.bun/bin:$PATH"
