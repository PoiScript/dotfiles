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
