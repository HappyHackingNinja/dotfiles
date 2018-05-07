DEFAULT_USER=hhnj
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_TYPE=en_US.UTF-8
export TERM="xterm-256color"


# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

# Essential
source ~/.zplug/init.zsh

# Additional completion definitions 
zplug "zsh-users/zsh-completions"

# Load the theme
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# Syntax highlighting bundle
zplug "zsh-users/zsh-syntax-highlighting"

# ZSH port of the FISH shell's history search
zplug "zsh-users/zsh-history-substring-search"

# Node version management
export NVM_LAZY_LOAD=true
zplug "lukechilds/zsh-nvm"

# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load

# Python version management
if [[ -d "$HOME/.pyenv" ]]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    # Enable auto-activation of virtualenvs
    eval "$(pyenv virtualenv-init -)"
fi

# Golang
export GOPATH="${HOME}/go"
export PATH="${GOPATH}/bin:${PATH}"
