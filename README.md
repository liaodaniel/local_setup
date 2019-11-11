# Local Setup

## Install font
* brew cask install font-hack-nerd-font font-meslo-for-powerline
* Set iterm2 > Preferences > Profiles > Text > Non-ACII Font to use `Hack Nerd Font`
* Set iterm2 > Preferences > Profiles > Text > Font to use `Meslo LG S Regular for Powerline`

## Install Powerline shell
* git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
* Set the following:
```~/.zshrc
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE=nerdfont-complete
```

## Doom emacs

Execute below to install Emacs
```
brew tap d12frosted/emacs-plus
brew install emacs-plus --with-modern-icon

git clone -b develop https://github.com/hlissner/doom-emacs ~/.emacs.d
```
