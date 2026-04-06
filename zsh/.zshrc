export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

[ -f "$HOME/.zsh.env" ] && source "$HOME/.zsh.env"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'
export PATH="/Users/drewtaylor/.bun/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# asdf
[ -f /opt/homebrew/opt/asdf/libexec/asdf.sh ] && . /opt/homebrew/opt/asdf/libexec/asdf.sh

# bun completions
[ -s "/Users/drewtaylor/.bun/_bun" ] && source "/Users/drewtaylor/.bun/_bun"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/drewtaylor/.lmstudio/bin"
# End of LM Studio CLI section



# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/drewtaylor/.opam/opam-init/init.zsh' ]] || source '/Users/drewtaylor/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
