
#!/bin/sh

## Update Homebrew
brew update

## Install neovim
brew install neovim
# Install neovim-dot-app:
brew tap neovim/neovim
# Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# cloning 
git clone https://github.com/afshinm/neovim-config.git ~/.config/nvim 
# Open your Neovim and run:
# :PlugInstall

## Install iTerm2
brew cask install iterm2

## Install Hyper
brew cask install hyper

## Install zsh
brew install zsh zsh-completions

## Make zsh your system’s default shell:
chsh -s $(which zsh)
# Restart to see this change.
echo $SHELL # Expected result: /bin/zsh

## Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## Install spaceship theme
# Clone
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
# Symlink spaceship.zsh-theme to your oh-my-zsh custom themes directory:
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"


## Install powerline fonts
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

## Install nerd-fonts
brew tap homebrew/cask-fonts &&
brew cask install font-monoid-nerd-font &&
brew cask install font-mononoki-nerd-font

## Install colorls 
# Used for template
gem install colorls

# Add oh-my-zsh template 
cp ./zshrc.zsh-template ~/.zshrc







