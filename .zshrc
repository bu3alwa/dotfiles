# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/Users/alalxa/.oh-my-zsh"

# https://github.com/romkatv/powerlevel10k, make sure to install font
ZSH_THEME="powerlevel10k/powerlevel10k"

# Default exports
export TERM="xterm-256color"
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8.0)
export PATH=$JAVA_HOME/bin:$PATH
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$ANDROID_HOME/emulator:$ANDROID_SDK/tools:$PATH
export PATH=/opt/homebrew/lib/ruby/gems/2.7.0/bin:$PATH
export PATH=/usr/local/lib/ruby/gems/2.7.0/bin:$PATH
export NVM_DIR=~/.nvm
export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('vim')
export ZSH_TMUX_AUTOSTART=true

# Plug those things
plugins=(
	git 
	tmux
	brew 
	macos 
	colored-man-pages 
	colorize 
	zsh-nvm
	zsh-autosuggestions 
	zsh-history-substring-search
)

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
source /Users/alalxa/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Zsh autocomplete bind
bindkey '^l' autosuggest-accept
bindkey '^h' autosuggest-clear

# Bind hsitory
bindkey '^j' history-substring-search-up
bindkey '^k' history-substring-search-down

# create session
bindkey -s ^f "tmux-sessionizer\n"

# Aliases
alias vim="nvim"
