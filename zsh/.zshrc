# install omz if not there
[[ -d ~/.oh-my-zsh/ ]] ||
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

[[ -f ~/.oh-my-zsh/antigen.zsh ]] ||
    curl -L git.io/antigen > ~/.oh-my-zsh/antigen.zsh

source ~/.oh-my-zsh/antigen.zsh


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# https://github.com/romkatv/powerlevel10k, make sure to install font
#ZSH_THEME="powerlevel10k/powerlevel10k"

# Default exports
export TERM="xterm-256color"
export NVM_DIR=~/.nvm
export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('nvim')
export ZSH_TMUX_AUTOSTART=true

# Plug those things
# plugins=(
#	git 
#	tmux
#	brew 
#	macos 
#	colored-man-pages 
#	colorize 
#	zsh-nvm
#	zsh-autosuggestions 
#	zsh-history-substring-search
#  zsh-syntax-highlighting
#)

antigen use oh-my-zsh

antigen bundle git
antigen bundle tmux
antigen bundle brew
antigen bundle macos
antigen bundle colored-man-pages
antigen bundle colorize
antigen bundle command-not-found
antigen bundle docker 

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting 
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle lukechilds/zsh-nvm 

antigen theme romkatv/powerlevel10k

antigen apply

# Check your sauce
source $ZSH/oh-my-zsh.sh

#source $(brew --prefix nvm)/nvm.sh

# nvmrc auto sets nvm for the directory if .nvmrc exists
#autoload -U add-zsh-hook
#load-nvmrc() {
#  local node_version="$(nvm version)"
#  local nvmrc_path="$(nvm_find_nvmrc)"
#
#  if [ -n "$nvmrc_path" ]; then
#    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
#
#    if [ "$nvmrc_node_version" = "N/A" ]; then
#      nvm install
#    elif [ "$nvmrc_node_version" != "$node_version" ]; then
#      nvm use
#    fi
#  elif [ "$node_version" != "$(nvm version default)" ]; then
#    echo "Reverting to nvm default version"
#    nvm use default
#  fi
#}
#add-zsh-hook chpwd load-nvmrc
#load-nvmrc

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Zsh autocomplete bind
bindkey '^l' autosuggest-accept
bindkey '^h' autosuggest-clear

# Bind hsitory
bindkey '^k' history-substring-search-up
bindkey '^j' history-substring-search-down

# create session
bindkey -s ^f "tmux-sessionizer\n"

# Aliases
#alias vim="nvim"
