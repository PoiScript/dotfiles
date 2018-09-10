# Spacemacs
cp -r ~/.spacemacs.d/ .
# Tmux
cp -r ~/.tmux.conf .
# gitconfig
cp -r ~/.gitconfig .
# Doom Emacs
cp -r ~/.doom.d/ .
# Fish Shell
cp -r ~/.config/fish/config.fish .

# Systemd Unit Files
mkdir -p systemd
# Emacs
cp -r ~/.config/systemd/user/emacs.service ./systemd
