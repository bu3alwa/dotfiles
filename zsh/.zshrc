# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# install omz if not there
[[ -d ~/.oh-my-zsh/ ]] ||
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install antigen
[[ -f ~/.oh-my-zsh/antigen.zsh ]] ||
    curl -L git.io/antigen > ~/.oh-my-zsh/antigen.zsh

# install tmux plugin manager
if [[ ! -d ~/.tmux/plugins/tpm ]] then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm 
    tmux source ~/.tmux.conf
fi

if [[ ! -d ~/.fzf ]] then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

# Install kitty if missing
if [[ ! -d ~/.local/kitty.app ]] && [[ ! -d /Applications/kitty.app ]] then
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
    # Create symbolic links to add kitty and kitten to PATH (assuming ~/.local/bin is in
    # your system-wide PATH)
    ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
    ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten /usr/local/bin/
    # Place the kitty.desktop file somewhere it can be found by the OS
    cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
    # If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
    cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
    # Update the paths to the kitty and its icon in the kitty.desktop file(s)
    sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
    sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
fi

source ~/.oh-my-zsh/antigen.zsh

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# https://github.com/romkatv/powerlevel10k, make sure to install font
#ZSH_THEME="powerlevel10k/powerlevel10k"

# Default exports
 export TERM="xterm"
export NVM_DIR=~/.nvm
export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('nvim')
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_DEFAULT_SESSION_NAME="Home"

# Plugins
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
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle lukechilds/zsh-nvm

# workaround for https://github.com/zsh-users/antigen/issues/675
THEME=romkatv/powerlevel10k
antigen list | grep $THEME; if [ $? -ne 0 ]; then antigen theme $THEME; fi

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

# Zsh autocomplete bind
bindkey '^l' autosuggest-accept
bindkey '^h' autosuggest-clear

# Bind hsitory
bindkey '^k' history-substring-search-up
bindkey '^j' history-substring-search-down

bindkey  "^[[1~"   beginning-of-line
bindkey  "^[[4~"   end-of-line

# create session
#bindkey -s ^f "tmux-sessionizer\n"

# Aliases
#alias vim="nvim"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias docker="podman"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
clear

# bun completions
[ -s "/Users/aliali/.bun/_bun" ] && source "/Users/aliali/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
