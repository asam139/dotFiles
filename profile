source ~/.exports
source ~/.aliases

# Tmuxinator completion
source ~/.config/tmuxinator/completion/tmuxinator.zsh

# Fasd initialization
eval "$(fasd --init auto)"

# Enhancd initialization
source ~/utils/enhancd/init.sh

# Preferred editor for local and remote sessions
export EDITOR='nvim'


# Run tmux on start
#if which tmux >/dev/null 2>&1; then
#  # if no session is started, start a new session
#  test -z ${TMUX} && tmux
#  # when quitting tmux, try to attach
#  while test -z ${TMUX}; do
#    tmux attach || break
#  done
#fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
