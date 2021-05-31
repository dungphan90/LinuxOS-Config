# Some of this comes from distrotube .dotfile: https://gitlab.com/dwt1/dotfiles/

# QMK
export PATH="/home/dphan/.local/bin:$PATH"

# ESP32
function setup_esp32() {
  source ~/esp/esp-idf/export.sh
  export PATH="/home/dphan/.platformio/penv/bin:$PATH"
}

# LaTeX
export PATH="/opt/texlive/2021/bin/x86_64-linux:$PATH"
export MANPATH="/opt/texlive/2021/texmf-dist/doc/man:$MANPATH"
export INFOPATH="/opt/texlive/2021/texmf-dist/doc/info:$INFOPATH"

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

# Zoom quick kill
function zoomkill() {
  kill -9 `procs zoom | awk '{print $1}' | tail -n 1`
}

# Slack quick kill
function slackkill() {
  kill -9 `procs slack | awk '{print $1}' | head -n 3 | tail -n 1`
}

# Aliases
alias vim="nvim"
alias rm='trash -v'
alias srm='sudo trash -v'
alias refresh='exec $SHELL'
alias dgit='git --git-dir ~/.dotfiles/.git --work-tree=$HOME' # Detached working tree
alias kinit='kinit -f ${USER}@FNAL.GOV'
alias vim-zenv="vim ~/.zenv.sh"
alias top="bpytop"
alias labnote="jupyter lab"
alias xcf="copyfile"
alias xcd-"copydir"

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
function dual_screen() {
  xrandr --auto --output DP-2 --mode 1920x1080 --right-of DP-4
	nitrogen --restore
}

function left_screen() {
  xrandr --auto --output DP-2 --off
	nitrogen --restore
}

function right_screen() {
  xrandr --auto --output DP-4 --off
	nitrogen --restore
}
# Utility functions
function cheat() {
  curl cheat.sh/$1
}

# Connect to Keychron K6
function k6() {
  bluetoothctl connect DC:2C:26:E7:F5:49
}

# Backup data
function backup_workspace() {
  sudo mount /dev/sdb1 /mnt
  sudo unison $HOME/Workspace /mnt/DataBackup/Workspace
  sudo umount /dev/sdb1
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
  source /home/dphan/ROOT-system/install/v6.24.00-cuda/bin/thisroot.sh
  alias root="root -l"
}

function setup_nvm() {
	source /usr/share/nvm/init-nvm.sh

	echo "You can now install node.js versions (e.g. nvm install 10) and"
  echo "activate them (e.g. nvm use 10)."
	echo ""
	echo "init-nvm.sh is a convenience script which does the following:"
	echo ""
	echo "[ -z \"\$NVM_DIR\" ] \&\& export NVM_DIR=\"\$HOME\/.nvm\""
	echo "source /usr/share/nvm/nvm.sh"
	echo "source /usr/share/nvm/bash_completion"
	echo "source /usr/share/nvm/install-nvm-exec"
	echo ""
	echo "You may wish to customize and put these lines directly in your"
	echo ".bashrc (or similar) if, for example, you would like an NVM_DIR"
	echo "other than ~/.nvm or you don't want bash completion."
}

