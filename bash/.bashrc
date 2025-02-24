if [ -f /usr/lib/git-core/git-sh-prompt ]; then
	source /usr/lib/git-core/git-sh-prompt
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
