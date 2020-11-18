# Aliases

alias dgit='git --git-dir ~/.dotfiles/.git --work-tree=$HOME' # Detached working tree
alias kinit='kinit -f ${USER}@FNAL.GOV'
alias ll="ls -lGh"
alias vim-zenv="vim ~/.zenv.sh"
alias top="bpytop"
alias vim="nvim"

# tmux aliases
alias tms="tmux new -s"
alias tmk="tmux kill-session -t"
alias tma="tmux attach-session -t"
alias tml="tmux ls"

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

# Utility functions
function cheat() {
  curl cheat.sh/$1
}

# Using PyEnv
if [ "$SYSTEMOS" = "Linux" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
fi
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
