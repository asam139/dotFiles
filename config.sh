
#!/bin/sh

echo 'Updating Hombrew'
## Update Homebrew
brew update

echo "Installing cli utilities"
# A fast code searching tool
if ! command -v ag &> /dev/null; then
  brew install the_silver_searcher
fi

# Install ripgrep
if ! command -v rg &> /dev/null; then
  brew install ripgrep
fi

# Enhanced directory navigation
echo "Installing enhanced navigation utilities"

if [ ! -d "$HOME/utils/enhancd" ]; then
  git clone https://github.com/b4b4r07/enhancd.git  $HOME/utils/enhancd
fi

if ! command -v fasd &> /dev/null; then
  brew install fasd
fi

# Enhanced ls
if ! command -v exa &> /dev/null; then
  brew install exa
fi

## Install python3
sudo mkdir /usr/local/Frameworks
sudo chown $(whoami):admin /usr/local/Frameworks
brew install python

echo 'neovim'
## Install neovim
brew install neovim
# Install neovim-dot-app:
brew tap neovim/neovim
# Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# python3 provider
pip3 install pynvim

# Open your Neovim and run:
# :PlugInstall

# Tmux
if ! command -v tmux &> /dev/null; then
  brew install tmux
fi

#Ruby
if ! command -v gem &> /dev/null; then
  brew install ruby
fi

#tmuxinator
if ! command -v tmuxinator &> /dev/null; then
  gem install tmuxinator
fi

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

## Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

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
# For ls alias
gem install colorls

# Install dotfiles
echo "Making a backup of your dotfiles ----> $HOME/dotfiles_OLD"
mkdir -p $HOME/dotfiles_OLD
mv -af $HOME/.profile $HOME/.zshrc $HOME/.tmux.conf $HOME/.bashrc $HOME/dotfiles_OLD/ 2>/dev/null
mv -af $HOME/.exports $HOME/.exports.osx $HOME/.exports.linux $HOME/dotfiles_OLD/ 2>/dev/null
mv -af $HOME/.aliases $HOME/.aliases.osx $HOME/.aliases.linux $HOME/dotfiles_OLD/ 2>/dev/null

echo "Creating symlinks"
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

ln -nvfs $DOTFILES_DIR/bashrc    $HOME/.bashrc
ln -nvfs $DOTFILES_DIR/zshrc     $HOME/.zshrc
ln -nvfs $DOTFILES_DIR/tmux.conf $HOME/.tmux.conf
ln -nvfs $DOTFILES_DIR/profile   $HOME/.profile
ln -nvfs $DOTFILES_DIR/exports   $HOME/.exports
ln -nvfs $DOTFILES_DIR/aliases   $HOME/.aliases

mkdir -p $HOME/.config

find config -mindepth 1 -maxdepth 1 | while read dir; do
ln -nvfs $DOTFILES_DIR/$dir $HOME/.$dir
done

case "$OSTYPE" in
  darwin*)
    ln -nvfs $DOTFILES_DIR/exports.osx $HOME/.exports.osx
    ln -nvfs $DOTFILES_DIR/aliases.osx $HOME/.aliases.osx
    ln -nvfs $DOTFILES_DIR/tmux-osx.conf $HOME/.tmux-osx.conf
    ln -nvfs $DOTFILES_DIR/tmux-osx.conf $HOME/.tmux-linux.conf
    ;;
  linux*)
    ln -nvfs $DOTFILES_DIR/exports.linux $HOME/.exports.linux
    ln -nvfs $DOTFILES_DIR/aliases.linux $HOME/.aliases.linux
    ;;
esac

exec ${SHELL} -l
echo "\nYou should restore autocompletions. To do it, just use:\nautoload -Uz compinstall && compinstall"







