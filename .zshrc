# use powerline
USE_POWERLINE="true"

# source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi

# use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# replace ctrl-r with mcfly
eval "$(mcfly init zsh)"

# aliases

# navigation
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias ls='ls --color=auto'
alias ll='ls -la'
alias grep='grep --color=auto'

# pacman and yay
alias pacsyu='sudo pacman -Syu'                  # update only standard pkgs
alias pacsyyu='sudo pacman -Syyu'                # Refresh pkglist & update standard pkgs
alias yaysua='yay -Sua --noconfirm'              # update only AUR pkgs (yay)
alias yaysyu='yay -Syu --noconfirm'              # update standard pkgs and AUR pkgs (yay)
alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages

# get fastest mirrors
alias mirrors="sudo pacman-mirrors -f 5"

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='trash -i'

# use bat instead of cat
alias cat='bat --paging=never'

# adding flags
alias df='df -h'                                # human-readable sizes
alias free='free -m'                            # show sizes in MB

# git
alias addall='git add .'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias pull='git pull origin'
alias push='git push origin'
alias stat='git status'                         # 'status' is protected name so using 'stat' instead

# 0x0.st
alias st="curl -F 'file=@-' https://0x0.st"

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# dwm 
alias build="sudo cp config.def.h config.h && sudo make install"
