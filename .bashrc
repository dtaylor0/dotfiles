export PATH=$PATH:~/go/bin

test -s ~/.alias && . ~/.alias || true

alias vim="nvim"
export GCM_CREDENTIAL_STORE=cache

export PS1='\[\e[1;34m\]\W\[\e[1;32m\]$(__git_ps1 " git:(%s)") \[\e[00m\]→ '
