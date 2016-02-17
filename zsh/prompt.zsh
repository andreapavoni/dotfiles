setopt prompt_subst
autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' actionformats '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}[%F{12}%b %F{3}%u%F{2}%c%F{5}]%f'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:*' enable git
+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
    git status --porcelain | grep '??' &> /dev/null ; then
    hook_com[unstaged]="%F{1}-%F{3}${hook_com[unstaged]}"
  fi
}

precmd () { vcs_info }

# PROMPT='%F{5}%F{2}%n@%m%b%F{5} %F{3}%3~ ${vcs_info_msg_0_} %f%# '
PROMPT='%F{5}%F{2}%m:%b%F{5}%F{5}[%F{3}%3~%F{5}]${vcs_info_msg_0_}%F{1}λ%f '
