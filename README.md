# Local Setup

## Install font

```sh
brew install --cask font-hack-nerd-font font-meslo-for-powerline 
```

* Set iterm2 > Preferences > Profiles > Text > Non-ACII Font to use `Hack Nerd Font`
* Set iterm2 > Preferences > Profiles > Text > Font to use `Meslo LG S Regular for Powerline`

## Install Powerlevel 10k
* git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
* Set the following:
```~/.zshrc
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE=nerdfont-complete
```
* Run p10k configure

## Add toggle prompt for aws session
``` ~/.p10k.zsh
  function prompt_my_aws_session() {
    emulate -L zsh

    local aws_account_name=$(cat ~/.aws/credentials | grep aws_account_name | cut -d'=' -f 2| awk '{gsub(/\(|\)/,"");print toupper($NF)}')
    local aws_role=$(cat ~/.aws/credentials | grep role_name | cut -d'=' -f 2)
    local aws_expiry=$(cat  ~/.aws/credentials | grep expiration | cut -d'=' -f 2 | awk '{print $1 " " $2 " " $3}')
    local aws_expiry_epoch=$(date -j -f "%Y-%m-%d %H:%M:%S %z" "+%s" "${aws_expiry}")
    local current_time_epoch=$(date -u "+%s")

    local secs_remaining=$(( aws_expiry_epoch - current_time_epoch ))

    if [[ $secs_remaining > 0 ]]; then
      p10k segment -f red -e -i "AWS_ICON" -r -t "${aws_account_name} ${aws_role} $((secs_remaining / 60)) mins"
    else
      p10k segment -f red -e -t ''
    fi
  }

  typeset -g POWERLEVEL9K_MY_AWS_SESSION_SHOW_ON_COMMAND='make|aws|docker-compose'
```

## Doom emacs

Execute below to install Emacs
```
brew tap d12frosted/emacs-plus
brew install emacs-plus@27 --with-modern-icon-pen

git clone -b develop https://github.com/hlissner/doom-emacs ~/.emacs.d

cd ~/.emacs.d
./bin/doom sync

GO111MODULE=on go get golang.org/x/tools/gopls@latest
go get -u github.com/mdempsky/gocode
go get -u github.com/rogpeppe/godef
```
