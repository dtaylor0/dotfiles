source /usr/lib/git-core/git-sh-prompt
export PATH=$PATH:/usr/local/go/bin:${HOME}/go/bin
test -s ~/.alias && . ~/.alias || true

alias vim="nvim"
alias "l"='ls --color=auto -F'
export GCM_CREDENTIAL_STORE=cache

export TERM=alacritty
CYAN=$(tput setaf 6)
BLUE=$(tput setaf 4)
RED=$(tput setaf 1)
RESET=$(tput sgr0)
export PS1='\[$CYAN\]\W $(__git_ps1 "\[$BLUE\]git:(\[$RED\]%s\[$BLUE\]) ")\[$RESET\]⏩ '
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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:/opt/nvim-linux64/bin"

# fnm
FNM_PATH="/home/drew/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env --shell bash`"
fi

# asdf
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"

# Python
# alias python=python3.12
# alias python3=python3.12
# alias pip=pip3.12
# alias pip3=pip3.12
export PATH="$PATH:$HOME/.local/bin/"

export BROWSER=zen
