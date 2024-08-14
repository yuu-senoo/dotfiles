#!/bin/bash -e

IGNORE_PATTERN="^\.(git|travis)"

# install zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions         ${ZSH_CUSTOM:-${ZSH:~/.oh-my-zsh}/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-${ZSH:~/.oh-my-zsh}/custom}/plugins/zsh-syntax-highlighting

echo "Create dotfile links."
for dotfile in .??*; do
    [[ $dotfile =~ $IGNORE_PATTERN ]] && continue
    ln -snfv "$(pwd)/$dotfile" "$HOME/$dotfile"
done
echo "Success"
