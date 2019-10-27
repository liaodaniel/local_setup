# Local Setup

## Install font
* brew cask install font-hack-nerd-font
* Set iterm2 > Preferences > Profiles > Text > Non-ACII Font to use `Hack Nerd Font`

## Install Powerline shell
* git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
* Set the following:
```~/.zshrc
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE=nerdfont-complete
```
