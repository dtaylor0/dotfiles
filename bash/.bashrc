if [ -f /usr/lib/git-core/git-sh-prompt ]; then
	source /usr/lib/git-core/git-sh-prompt
fi
export PATH=$PATH:/usr/local/go/bin:${HOME}/go/bin
test -s ~/.alias && . ~/.alias || true

alias vim="nvim"
alias "l"='ls --color=auto -LF'
export GCM_CREDENTIAL_STORE=cache

# export TERM=alacritty
CYAN=$(tput setaf 6)
BLUE=$(tput setaf 4)
RED=$(tput setaf 1)
RESET=$(tput sgr0)
BOLD=$(tput bold)
export PS1='\[$CYAN\]\W $(__git_ps1 "\[$BLUE\]git:(\[$RED\]%s\[$BLUE\]) ")\[$RESET\]⨯ '

# rust
if [ -f "$HOME/.cargo/env" ]; then
	. "$HOME/.cargo/env"
fi

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

#neovim
export PATH="$PATH:/opt/nvim-linux64/bin"

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

# pulumi
export PATH="$PATH:$HOME/.pulumi/bin"

# sensitive env variables
if [ -f "$HOME/.bashenv" ]; then
	. "$HOME/.bashenv"
fi
