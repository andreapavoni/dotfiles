#!/usr/bin/env zsh
# http://pthree.org/2008/11/23/727/

setopt prompt_subst

function precmd {
    # let's get the current get branch that we are under
    # ripped from /etc/bash_completion.d/git from the git devs
    git_ps1 () {
        if which git > /dev/null; then
            local g="$(git rev-parse --git-dir 2>/dev/null)"
            if [ -n "$g" ]; then
                # in a git directory
                local r
                local b
                if [ -d "$g/rebase-apply" ]; then
                    if test -f "$g/rebase-apply/rebasing"; then
                        r="|REBASE"
                    elif test -f "$g/rebase-apply/applying"; then
                        r="|AM"
                    else
                        r="|AM/REBASE"
                    fi
                    b="$(git symbolic-ref HEAD 2>/dev/null)"
                elif [ -f "$g/rebase-merge/interactive" ]; then
                    r="|REBASE-i"
                    b="$(cat "$g/rebase-merge/head-name")"
                elif [ -d "$g/rebase-merge" ]; then
                    r="|REBASE-m"
                    b="$(cat "$g/rebase-merge/head-name")"
                elif [ -f "$g/MERGE_HEAD" ]; then
                    r="|MERGING"
                    b="$(git symbolic-ref HEAD 2>/dev/null)"
                else
                    if [ -f "$g/BISECT_LOG" ]; then
                        r="|BISECTING"
                    fi
                    if ! b="$(git symbolic-ref HEAD 2>/dev/null)"; then
                       if ! b="$(git describe --exact-match HEAD 2>/dev/null)"; then
                          b="$(cut -c1-7 "$g/HEAD")..."
                       fi
                    fi
                fi
                if [ -n "$1" ]; then
                     printf "$1" "${b##refs/heads/}$r"
                else
                     printf "%s" "${b##refs/heads/}$r"
                fi

                # print a * if git diff sees changes
                local uncommitted
                local queued
                UC=""
                uncommitted="$(git diff --exit-code > /dev/null 2>&1; echo $?)"
                if [ $uncommitted -eq 1 ]; then
                   UC="*"
                fi
                queued="$(git status > /dev/null 2>&1; echo $?)"
                if [ $queued -eq 0 ]; then
                   UC="$UC+"
                fi
                printf "$UC"
            fi
        else
            printf ""
        fi
    }

    GITBRANCH="$(git_ps1)"
    if [ -n "$GITBRANCH" ]; then
        GITBRANCH=" ($GITBRANCH)"
    fi

    GITBRANCH=$GITBRANCH
}

# VCS_INFO #
# ======== #
setopt promptsubst
autoload -Uz vcs_info
# Enable only a subset of possible vcs
zstyle ':vcs_info:*' enable git svn
# Enable changes monitoring (only git)
zstyle ':vcs_info:git:*' check-for-changes true
# Strings used when there are staged/unstaged changes
zstyle ':vcs_info:git:*' unstagedstr '?'
zstyle ':vcs_info:git:*' stagedstr '!'
# Standard vcs string
# %{N} is the color switcher ex. %F{5} is violet
# %f is the 'reset color' escape
zstyle ':vcs_info:*'           formats       '%F{3}-%F{5}[%F{2}%b%c%u%F{5}]%f '
zstyle ':vcs_info:*'           actionformats '%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:(svn|bzr):*' branchformat  '%b%F{1}:%F{3}%r'

precmd () { vcs_info }
PS1='%B%F{2}%n@%m%b %F{3}%~ ${vcs_info_msg_0_}%f%# '
