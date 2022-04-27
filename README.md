# Dotfiles

This is for my personal setup and this document is just to remember what stuff is needed.

## Dependencies

* Power10k needed for zsh theme
* manually install font from power10k
* tpm for tmux (package manager)

## Common stuff

```
ln -s "${HOME}/.config/tmux/.tmux.conf" "${HOME}/.tmux.conf"
```

## Mac Essentials:

Get Mac to be more like linux and i3wm

Add spotlight shortcut to be alt + d
Add shortcuts for windows alt + 1...9

```
# yabai makes it feel like i3
brew install koekeishiya/formulae/yabai
brew services start yabai

# skhd keyboard shortcuts
brew install koekeishiya/formulae/skhd
brew services start skhd

# disable animations
sh ./disableWindowAnimationsMac.sh

# i3status replacement
brew install cmacrae/formulae/spacebar

# start spacebar
brew services start spacebar

# nice terminal
brew install --cask alacritty

brew install jq

# link configs
ln -s "${HOME}/.config/yabai/.yabairc" "${HOME}/.yabairc"
ln -s "${HOME}/.config/yabai/.skhdrc" "${HOME}/.skhdrc"

brew install fzf
```

### Cheatsheets for yabai
```
# Movement
alt + arrow keys move focus between windows (or use h,j,k,l)
alt + shift + arrow keys move space in direction (or use h,j,k,l)
alt + shift + n move space to workspace n
alt + ctrl + arrow keys set insertion point in focused container (or use h,j,k,l)
alt + return open terminal
alt + w close focused space
alt + f toggle fullscreen
alt + d toggle spotlight search

#Switching between modes:
alt + e - normal mode (New windows will open next to each other)
alt + s - stack mode (New windows will open on top of each other)

#cycle through windows while you’re in stack mode
alt - p - next window on the stack
alt - n - previous window on the stack
```

thanks to: https://cbrgm.net/post/2021-05-5-setup-macos/

## Cheatsheet for zsh
```
# vim like commands
^j history up
^k history down
^l autocomplete
^h clear suggestion

ts tmux new session
ta tmux attach
```

## Cheatsheet for tmux
```
^a I install and reload
^a R reload
```

