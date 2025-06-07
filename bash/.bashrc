if [ -f /usr/lib/git-core/git-sh-prompt ]; then
	source /usr/lib/git-core/git-sh-prompt
fi

if [ -f /usr/share/git/git-prompt.sh ]; then
	source /usr/share/git/git-prompt.sh
fi

# go
GO_PATH_LOCAL=${HOME}/go/bin
GO_PATH_GLOBAL=/usr/local/go/bin
if [ -d $GO_PATH_LOCAL ]; then
	export PATH=$PATH:$GO_PATH_LOCAL
fi
if [ -d $GO_PATH_GLOBAL ]; then
	export PATH=$PATH:$GO_PATH_GLOBAL
fi

test -s ~/.alias && . ~/.alias || true

# basic aliases
alias vim="nvim"
alias "l"='ls --color=auto -LF'
alias "gs"="git status"
alias "ga"="git add"
alias "gc"="git commit"
alias "gp"="git push"
alias "gl"="git log"

# (linux) use cache for git auth
export GCM_CREDENTIAL_STORE=cache

# prompt
CYAN=$(tput setaf 6)
BLUE=$(tput setaf 4)
RED=$(tput setaf 1)
RESET=$(tput sgr0)
BOLD=$(tput bold)
export PS1='\[$CYAN\]\W$(__git_ps1 " \[$BLUE\]git:(\[$RED\]%s\[$BLUE\])")\[$RESET\] $ '

# rust
if [ -f "$HOME/.cargo/env" ]; then
	. "$HOME/.cargo/env"
fi

# bun
BUN_INSTALL="$HOME/.bun/bin"
if [ -d $BUN_INSTALL ]; then
	export PATH=$BUN_INSTALL:$PATH
fi

#neovim
NVIM_PATH="/opt/nvim-linux64/bin"
if [ -d $NVIM_PATH ]; then
	export PATH="$PATH:/opt/nvim-linux64/bin"
fi

# fnm
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env --shell bash`"
fi

# asdf
if [ -f "$HOME/.asdf/asdf.sh" ]; then
	. "$HOME/.asdf/asdf.sh"
	. "$HOME/.asdf/completions/asdf.bash"
fi

# home local bin
export PATH="$PATH:$HOME/.local/bin/"

# sensitive env variables
if [ -f "$HOME/.bashenv" ]; then
	. "$HOME/.bashenv"
fi

# fnm
FNM_PATH="/home/drewt/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


# Load Angular CLI autocompletion.
source <(ng completion script)
# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/drewtaylor/.lmstudio/bin"
# End of LM Studio CLI section

