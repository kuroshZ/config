# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fzf extract z zsh-autosuggestions  fast-syntax-highlighting zsh-autocomplete)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
PATH="/home/kurosh/.neovim/bin:$PATH"


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
export EDITOR="$(which nvim)"
else
export EDITOR="$(which nvim)"

fi

# Example aliases
alias vim ="nvim"
alias zshconfig="nvim ~/.zshrc"
alias clc="clear" 
alias monitor_usbi_connection="udevadm monitor --udev"

# alias ohmyzsh="mate ~/.oh-my-zsh"
eval "$(starship init zsh)"

## pyenv configs
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"


export TMUX_PLUGIN_MANAGER_PATH="$HOME/.config/tmux/plugins" 
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

eval "$(pyenv virtualenv-init -)"

source /opt/ros/humble/setup.zsh
# source ~/ros2_ws/install/setup.zsh
## default compiler 
export CC=gcc-12
export CXX=g++-12



function build_sdk(){
  echo "🚀🚀🚀  Building sony sdk    \n"
  export CC=gcc-12
  export CXX=g++-12
  cd ~/repos/sdk_aarch64 && rm -rf build && mkdir build && cd build && 
cmake -DCMAKE_BUILD_TYPE=DEBUG ..  && cmake --build .
}

function colCleanBuild(){ 
  clear
  local current_path
  current_path=$(pwd) 
  echo "$current_path"
  cd ~/ros2_ws
  export CC=clang-18
  export CXX=clang++-18
  # export CC=gcc-12
  # export CXX=g++-12
  if (( # == 0 )); then 
    echo "   ✨🧹  Cleaning previous Builds ...\n"
    rm -rf ~/ros2_ws/install && rm -rf ~/ros2_ws/log && rm -rf ~/ros2_ws/build 
    echo "   🚀🚀🚀  Building fresh with colcon ...    \n"
    colcon build --cmake-args -DCMAKE_BUILD_TYPE=DEBUG  ;
  else 
    echo "   🚀🚀🚀  Building the package $1 with colcon ...    \n"
    colcon build --packages-select --cmake-args -DCMAKE_BUILD_TYPE=DEBUG $1
  fi

  cd "$current_path"
  source ~/ros2_ws/install/setup.zsh               
}





export PATH="$HOME/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
