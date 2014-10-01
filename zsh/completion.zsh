zmodload -i zsh/complist

# Disabke completion caching, use rehash to clear
zstyle ':completion::complete:*' use-cache off
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

# Fallback to built in ls colors
zstyle ':completion:*' list-colors ''

# Make the list prompt friendly
# zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'

# Make the selection prompt friendly when there are a lot of choices
# zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# zstyle ':completion:*' menu select=1 _complete _ignored _approximate
# zstyle ':completion:*' special-dirs true

# match uppercase from lowercase
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# formatting and messages
# zstyle ':completion:*' verbose yes
# zstyle ':completion:*:descriptions' format '%B%d%b'
# zstyle ':completion:*:messages' format '%d'
# zstyle ':completion:*:warnings' format 'No matches for: %d'
# zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' list-separator '#'
# zstyle ':completion:*' auto-description 'specify: %d'
# zstyle ':completion:*:default' list-prompt '%S%M matches%s'
# zstyle ':completion:*:prefix:*' add-space true

# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'

zstyle '*' single-ignored show

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# sequences of slashes in filename paths (for example in ‘foo//bar’) will be treated as a single slash
zstyle ':completion:*' squeeze-slashes true

# insert all expansions for expand completer
zstyle ':completion:*:expand:*' keep-prefix true tag-order all-expansions

# With commands like `rm' it's annoying if one gets offered the same filename
# again even if it is already on the command line. To avoid that:
zstyle ':completion::*:(git|less|rm)' ignore-line true

# SSH Completion
zstyle ':completion:*:scp:*' tag-order files 'hosts:-domain:domain'
zstyle ':completion:*:scp:*' group-order files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order 'hosts:-domain:domain'
zstyle ':completion:*:ssh:*' group-order hosts-domain hosts-host users hosts-ipaddr

## Highlight parameters with uncommon names
zstyle ':completion:*:parameters' list-colors "=[^a-zA-Z]*=$color[red]"

# Highlight aliases
zstyle ':completion:*:aliases' list-colors "=*=$color[green]"

# Highlight the original input.
zstyle ':completion:*:original' list-colors "=*=$color[red];$color[bold]"

# Highlight words like 'esac' or 'end'
# zstyle ':completion:*:reserved-words' list-colors "=*=$color[red]"

# Colorize hostname completion
zstyle ':completion:*:*:*:*:hosts' list-colors "=*=$color[cyan];$color[bg-black]"

# Disable completion of usernames
# zstyle ':completion:*' users off

# Add colors to processes for kill completion
# zstyle ':completion:*:*:kill:*' verbose yes
zstyle ':completion:*:kill:*' menu yes select

# zstyle ':completion:*:processes' command 'ps -au$USER'
# zstyle ':completion:*:processes-names' command 'ps c -U ${USER} -o comm= | sort | uniq'
# zstyle ':completion:*:processes' list-colors "=(#b) #([0-9]#) #([^ ]#)*=$color[cyan]=$color[yellow]=$color[green]"
compdef pkill=killall

# Manpages
zstyle ':completion:*:manuals'       separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections   true
