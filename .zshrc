# Path to your oh-my-zsh installation.
export ZSH="/home/ubuntu/.oh-my-zsh"

# Plugins
plugins=(
    git
    zsh-autosuggestions
    fast-syntax-highlighting
    fzf
    zsh-wakatime
    alias-finder
    colored-man-pages
    command-not-found
    fd
    zsh-interactive-cd
)

# Oh-my-zsh
ZSH_THEME="spaceship"
SPACESHIP_PROMPT_ADD_NEWLINE="true"
SPACESHIP_CHAR_PREFIX='\ufbdf '
SPACESHIP_CHAR_PREFIX_COLOR='yellow'
SPACESHIP_CHAR_SUFFIX=(" ")
SPACESHIP_CHAR_COLOR_SUCCESS="yellow"
SPACESHIP_CHAR_SYMBOL='~'
SPACESHIP_PROMPT_DEFAULT_PREFIX="$USER"
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true"
SPACESHIP_VENV_COLOR="magenta"
SPACESHIP_VENV_PREFIX="("
SPACESHIP_VENV_SUFFIX=")"
SPACESHIP_VENV_SYMBOL='\uf985'
SPACESHIP_USER_SHOW="true"
SPACESHIP_DOCKER_SYMBOL='\ue7b0'
SPACESHIP_DOCKER_VERBOSE='false'
SPACESHIP_BATTERY_SHOW='always'
SPACESHIP_BATTERY_SYMBOL_DISCHARGING='\uf57d'
SPACESHIP_BATTERY_SYMBOL_FULL='\uf583'
SPACESHIP_BATTERY_SYMBOL_CHARGING='\uf588'

# Show Path
alias path='echo -e ${PATH//:/\\n}'
source $ZSH/oh-my-zsh.sh


# Alias
alias zshrc='vim ~/.zshrc'
alias sz='source ~/.zshrc'
alias nvimrc='vim ~/.config/nvim/init.vim'
alias tmuxrc='vim ~/.tmux.conf'
alias share='cd /mnt/c/Users/thelineOver/wsl_share'
alias ws='cd ~/Workspace'
alias vim='nvim'
alias v='nvim'
alias vi='nvim'
alias fd='fdfind'
alias -g gp="| grep --color=auto"

# Many mistake keys
alias cl='clear'
alias lc='clear'
alias cle='clear'
alias clea='clear'
alias claer='clear'
alias clere='clear'
alias clera='clear'
alias clare='clear'
alias dlaer='clear'
alias lcear='clear'
alias celar='clear'
alias cleawr='clear'
alias celra='clear'

alias l='colorls -l'
alias ll='colorls -al'
alias ls='colorls'

# Starship
#eval "$(starship init zsh)"

# NVM
export NVM_DIR="/home/ubuntu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# TMUX
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t Ubuntu_Focal || tmux new -s Ubuntu_Focal
fi

# ROS
#source /opt/ros/noetic/setup.zsh
#source ~/catkin_ws/devel/setup.zsh

# ROS Network
#export ROS_HOSTNAME=localhost
#export ROS_MASTER_URI=http://localhost:11311

# ROS EDITOR
export EDITOR='nvim'

# ROS alias
#alias cw='cd ~/catkin_ws'
#alias cs='cd ~/catkin_ws/src'
#alias cm='cd ~/catkin_ws && catkin_make'
#alias ccp='catkin_create_pkg'
#alias core='roscore'
#alias rcd='roscd'
#alias run='rosrun'
#alias mklaunch='mkdir launch && cd launch'

alias xrdp='sudo /etc/init.d/xrdp start'

# git log show with fzf
gli() {

  # param validation
  if [[ ! `git log -n 1 $@ | head -n 1` ]] ;then
    return
  fi

  # filter by file string
  local filter
  # param existed, git log for file if existed
  if [ -n $@ ] && [ -f $@ ]; then
    filter="-- $@"
  fi

  # git command
  local gitlog=(
    git log
    --graph --color=always
    --abbrev=7
    --format='%C(auto)%h %an %C(blue)%s %C(yellow)%cr'
    $@
  )

  # fzf command
  local fzf=(
    fzf
    --ansi --no-sort --reverse --tiebreak=index
    --preview "f() { set -- \$(echo -- \$@ | grep -o '[a-f0-9]\{7\}'); [ \$# -eq 0 ] || git show --color=always \$1 $filter; }; f {}"
    --bind "ctrl-q:abort,ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % $filter | less -R') << 'FZF-EOF'
                {}
                FZF-EOF"
   --preview-window=right:60%
  )

  # piping them
  $gitlog | $fzf
}

