eval "$(zoxide init zsh)"

alias ls="eza --icons=always"
alias cat="bat"
alias v="nvim"
alias top="btm"
alias cd="z"
alias gcm='git commit -m'
alias ga='git add'
alias gp='git push'
alias gl='git pull'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gb='git branch'
alias gs='git status'

export PATH=$PATH:$(go env GOPATH)/bin
export PATH="/usr/local/opt/ruby/bin:$PATH"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator:$PATH
export PATH=$PATH:$ANDROID_HOME/tools:$PATH
export PATH=$PATH:$ANDROID_HOME/tools/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH

