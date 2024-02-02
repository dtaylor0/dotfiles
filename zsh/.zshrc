export PATH=/opt/homebrew/bin:$PATH
alias "vim"=nvim

autoload -Uz compinit && compinit # tab autocomplete menus

# Set prompt with git branch
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats "git:(%b) "
PROMPT='%F{green}%1d%f %F{blue}${vcs_info_msg_0_}%f%{$reset_color%}> '
