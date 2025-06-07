export PATH=/opt/homebrew/bin:$PATH:~/go/bin:~/.cargo/bin
alias "vim"=nvim
alias "l"='ls --color=auto -aLF'
alias "gs"="git status"
alias "ga"="git add"
alias "gc"="git commit"
alias "gp"="git push"
alias "gl"="git log"

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


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/drewtaylor/.opam/opam-init/init.zsh' ]] || source '/Users/drewtaylor/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration


# Load Angular CLI autocompletion.
source <(ng completion script)

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/drewtaylor/.lmstudio/bin"
# End of LM Studio CLI section

