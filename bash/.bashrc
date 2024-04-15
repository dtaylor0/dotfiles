export PATH=$PATH:/usr/local/go/bin:~/.cargo/bin

test -s ~/.alias && . ~/.alias || true

alias vim="nvim"
export GCM_CREDENTIAL_STORE=cache

export PS1='\[\e[1;34m\]\W\[\e[1;32m\]$(__git_ps1 " git:(%s)") \[\e[00m\]→ '
. "$HOME/.cargo/env"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
