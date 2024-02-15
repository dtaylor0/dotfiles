export PATH=/opt/homebrew/bin:$PATH
export PATH=$PATH:~/go/bin
alias "vim"=nvim

autoload -Uz compinit && compinit # tab autocomplete menus

# Set prompt with git branch
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats "git:(%b) "
PROMPT='%B%F{blue}%1d%f %F{green}${vcs_info_msg_0_}%f%b%{$reset_color%}→ '
