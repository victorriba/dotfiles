if status is-interactive
    # Commands to run in interactive sessions can go here
    zoxide init fish --cmd cd | source
end

function fish_title
    set -q argv[1]; or set argv fish
    set -l current_dir (basename (pwd))
    set -l parent_dir (basename (dirname (pwd)))
    echo $parent_dir/$current_dir: $argv
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
