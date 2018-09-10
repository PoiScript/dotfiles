# aliases
function syu
    sudo pacman -Syu $argv
end

function emacs
    emacsclient -c $argv
end

function rm
    rm -v $argv
end
