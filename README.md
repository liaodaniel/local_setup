# Local Setup

## Install font

```sh
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font font-meslo-for-powerline
```

* Set iterm2 > Preferences > Profiles > Text > Non-ACII Font to use `Hack Nerd Font`
* Set iterm2 > Preferences > Profiles > Text > Font to use `Meslo LG S Regular for Powerline`

## Install Powerline shell
* git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
* Set the following:
```~/.zshrc
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE=nerdfont-complete
```

## Add an AWS sts duration powerline element
Add the following to the bottom of the .zshrc file.
```~/.zshrc
function aws_prompt_info() {
 local aws_account_name=$(cat ~/.aws/credentials | grep aws_account_name | cut -d'=' -f 2| awk '{gsub(/\(|\)/,"");print toupper($NF)}')
 local aws_role=$(cat ~/.aws/credentials | grep role_name | cut -d'=' -f 2)
 local aws_expiry=$(cat  ~/.aws/credentials | grep expiration | cut -d'=' -f 2 | awk '{print $1 " " $2 " " $3}')
 local aws_expiry_epoch=$(date -j -f "%Y-%m-%d %H:%M:%S %z" "+%s" "${aws_expiry}")
 local current_time_epoch=$(date -u "+%s")
 local color='%F{white}'
 local secs_remaining=$(( aws_expiry_epoch - current_time_epoch ))
 if [[ $secs_remaining > 0 ]]; then
   echo "%{$color%}\uF270 ${aws_account_name} ${aws_role} $((secs_remaining / 60)) mins"
 else
   echo
 fi
}
POWERLEVEL9K_CUSTOM_AWS_ASSUME_ROLE="aws_prompt_info"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir virtualenv vcs newline kubecontext)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status custom_aws_assume_role time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTLINE_SECOND_PROMPT_PREFIX=" ↳ "
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='white'
POWERLEVEL9K_DIR_HOME_FOREGROUND='white'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='white'
POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND='black'
POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND='yellow'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='112'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='022'
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='white'
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='027'
POWERLEVEL9K_CUSTOM_AWS_ASSUME_ROLE_FOREGROUND='white'
POWERLEVEL9K_CUSTOM_AWS_ASSUME_ROLE_BACKGROUND='red'
```

## Doom emacs

Execute below to install Emacs
```
brew tap d12frosted/emacs-plus
brew install emacs-plus --with-modern-icon

git clone -b develop https://github.com/hlissner/doom-emacs ~/.emacs.d

cd ~/.emacs.d
./bin/doom install
./bin/doom refresh
./bin/doom a

go get -v -u github.com/mdempsky/gocode
go get -v -u github.com/rogpeppe/godef
```
