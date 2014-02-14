# COLORS
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

## LSCOLORS has the ability to use 11 different indicators to set background and foreground colors:
# 1 = directory
# 2 = symbolic link
# 3 = socket
# 4 = pipe
# 5 = executable
# 6 = block special
# 7 = character special
# 8 = executable with setuid bit set
# 9 = executable with setgid bit set
# 10 = directory writable to others, with sticky bit
# 11 = directory writable to others, without sticky bit

# Possible letter values to associate with numbers:
# a black
# b red
# c green
# d brown
# e blue
# f magenta
# c cyan
# h light grey
# A block black, usually shows up as dark grey
# B bold red
# C bold green
# D bold brown, usually shows up as yellow
# E bold blue
# F bold magenta
# G bold cyan
# H bold light grey; looks like bright white
# x default foreground or background

export PAGER="/usr/bin/less"
export MANPAGER="/usr/bin/less"
export EDITOR="/usr/bin/vim"
export GIT_EDITOR="/usr/bin/vim"
export NOSE_REDNOSE=1

export HISTFILE=~/.zsh_histfile
export HISTCONTROL=ignoredups
export HISTSIZE=50000
export SAVEHIST=50000
export DIRSTACKSIZE=12
