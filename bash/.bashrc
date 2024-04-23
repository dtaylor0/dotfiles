export PATH=$PATH:/usr/local/go/bin
test -s ~/.alias && . ~/.alias || true

alias vim="nvim"
export GCM_CREDENTIAL_STORE=cache

CYAN='\e[1;36m'
BLUE='\e[1;34m'
RED='\e[1;31m'
RESET='\e[00m'
export PS1="$CYAN\W "'$(__git_ps1 "${BLUE}git:(${RED}%s${BLUE}) ")'"${RESET}→ "
. "$HOME/.cargo/env"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/drew/miniconda3/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
	eval "$__conda_setup"
else
	if [ -f "/home/drew/miniconda3/etc/profile.d/conda.sh" ]; then
		. "/home/drew/miniconda3/etc/profile.d/conda.sh"
	else
		export PATH="/home/drew/miniconda3/bin:$PATH"
	fi
fi
unset __conda_setup
# <<< conda initialize <<<
