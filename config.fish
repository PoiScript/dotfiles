# aliases
function syu
    sudo pacman -Syu $argv
end

function emacs
    emacsclient -c $argv
end

function rm
    /usr/bin/rm -v $argv
end

# environment variable
set -x CHROME_BIN /usr/bin/google-chrome-unstable
set -x EDITOR emacs
set -x NODE_PATH /home/poi/.config/yarn/global/node_modules/
set -x RUST_SRC_PATH (rustc --print sysroot)"/lib/rustlib/src/rust/src"

# prompt
function fish_prompt
    if test $status -eq 0
        set_color brblue
    else
        set_color $fish_color_error
    end

    echo -n "~> "
    set_color normal

    set_color $fish_color_quote
    echo -n -s (prompt_pwd) " "
    set_color normal

    if git_is_repo
        set_color $fish_color_cwd
        # Git branch name
        echo -n -s (git symbolic-ref --short HEAD) " "
        set_color normal
        git_indicator
    end
end

function fish_right_prompt
    set_color $fish_color_autosuggestion
    date "+%H:%M:%S"
    set_color normal
end

# helper function for prompt
function git_is_repo
    test -d .git; or git rev-parse --git-dir >/dev/null ^/dev/null
end

function git_indicator
    # Check if git working tree is dirty
    if git diff --quiet
        set -l commit_count (git rev-list --count --left-right "@{upstream}...HEAD" ^/dev/null)

        switch "$commit_count"
            case ""
                # no upstream
            case "0"\t"0"
                echo -n "￮ "
            case "*"\t"0"
                echo -n "↓ "
            case "0"\t"*"
                echo -n "↑ "
            case "*"
                echo -n "⥄ "
        end
    else
        echo -n "✕ "
    end
end
