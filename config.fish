if status is-interactive
    # Commands to run in interactive sessions can go here
    set -x PATH $PATH (go env GOPATH)/bin
    set -x PATH /usr/local/opt/ruby/bin $PATH
    set -x ANDROID_HOME $HOME/Library/Android/sdk
    set -x PATH $PATH $ANDROID_HOME/emulator
    set -x PATH $PATH $ANDROID_HOME/tools
    set -x PATH $PATH $ANDROID_HOME/tools/bin
    set -x PATH $ANDROID_HOME/platform-tools $PATH
    zoxide init fish --cmd cd | source
end

function fish_title
    set -l current_dir (basename (pwd))
    set -l parent_dir (basename (dirname (pwd)))
    echo $parent_dir/$current_dir
end

function ls --wraps='eza --icons=always' --description 'alias ls=eza --icons=always'
    eza --icons=always $argv
end

function cat --wraps=bat --description 'alias cat=bat'
    bat $argv
end

function top --wraps=btm --description 'alias top=btm'
    btm $argv
end

function v --wraps=nvim --description 'alias v=nvim'
    nvim $argv
end
