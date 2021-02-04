# Some of this comes from distrotube .dotfile: https://gitlab.com/dwt1/dotfiles/

# X sessions
function sxawesome() {
  cd $HOME
  unlink .xinitrc
  ln -s $HOME/.xinit/xinitrc_awesome $HOME/.xinitrc
  startx
}

function sxgnome() {
  cd $HOME
  unlink .xinitrc
  ln -s $HOME/.xinit/xinitrc_gnome $HOME/.xinitrc
  startx
}

# Stream/ZOOM sound setup
function audioForZoom() {
  alsactl --file ${HOME}/.config/asound.state restore
}

# Aliases
alias rm='trash -v'
alias refresh='exec $SHELL'
alias dgit='git --git-dir ~/.dotfiles/.git --work-tree=$HOME' # Detached working tree
alias kinit='kinit -f ${USER}@FNAL.GOV'
alias vim-zenv="vim ~/.zenv.sh"
alias top="bpytop"
alias vim="nvim"
alias labnote="jupyter lab"

# Navigation
alias ..='cd ..' 
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Listings
alias ll='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ls='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

# ibus
export GTK_IM_MODULE=ibus
export XMODIFIER=@im=ibus
export QT_IM_MODULE=ibus

# tmux aliases
alias tms="tmux new -s"
alias tmk="tmux kill-session -t"
alias tma="tmux attach-session -t"
alias tml="tmux ls"
alias tmd="tmux detach"

# FNAL connections
function minosgpvm() {
  if ! klist -s
  then
    kinit
  fi

  if [ $# -gt 0 ];
  then
    ssh -XY dphan@minosgpvm$1.fnal.gov
  else
    ssh -XY dphan@minosgpvm06.fnal.gov
  fi
}

function novagpvm() {
  if ! klist -s
  then
    kinit
  fi

  if [ $# -gt 0 ];
  then
    ssh -XY dphan@novagpvm$1.fnal.gov
    # echo "Running with arguments."
  else
    ssh -XY dphan@novagpvm06.fnal.gov
    # echo "Running without arguments."
  fi
}

# xrandr
function combined_screen() {
  xrandr --setmonitor CombinedDisplay auto DisplayPort-1,DisplayPort-2
}

function dual_screen() {
  xrandr --auto --output DisplayPort-1 --mode 1920x1080 --right-of DisplayPort-2
}

function left_screen() {
  xrandr --auto --output DisplayPort-1 --off
}

function right_screen() {
  xrandr --auto --output DisplayPort-2 --off
}
# Utility functions
function cheat() {
  curl cheat.sh/$1
}

# Using PyEnv
function setup_pyenv() {
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
  fi
}

function setup_scientific_python() {
  setup_pyenv
  source $HOME/Pyenvs/scientific/bin/activate
}

function setup_cudasupport_python() {
  setup_pyenv
  source $HOME/Pyenvs/cudasupport/bin/activate
}

function setup_pycuda() {
  setup_pyenv
  setup_root
  source $HOME/Pyenvs/cudacomputing/bin/activate
}

function setup_root() {
  source /home/dphan/ROOT-system/install/v6.22.06-cuda/bin/thisroot.sh
  alias root="root -l"
}

