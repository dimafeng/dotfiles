# Ask for the administrator password upfront.
#sudo -v
# Keep-alive: update existing `sudo` time stamp until the script has finished.
#while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install brew
if which programname >/dev/null; then
    echo Brew is installed
else
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap caskroom/cask

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# v 1brew install macvim --with-override-system-vim
brew install tree
brew install htop
brew install git
#brew install zsh

brew cask install keepassx
brew cask install skype
brew cask install google-chrome
brew cask install iterm2
brew cask install dropbox
brew cask install tunnelblick
brew cask install atom
brew cask install flux

brew cask cleanup
brew cleanup
