#compdef pass

# This file is under the GPLv2+ license.
# Heavily based on http://zsh.sf.net/Guide/zshguide06.html#l177
# And Frédéric Perrin article http://tar-jx.bz/notes/zsh-completion.html
# Johan Venant, September 2012


_pass () {
  local cmd
  if (( CURRENT > 2)); then
    cmd=${words[2]}
    # Set the context for the subcommand.
    curcontext="${curcontext%:*:*}:pass-$cmd"
    # Narrow the range of words we are looking at to exclude `pass'
    (( CURRENT-- ))
    shift words
    # Run the completion for the subcommand
    (( $+functions[_pass_cmd_$cmd] )) && _pass_cmd_$cmd

  else
    _values : \
      "init[Initialize new password storage]" \
      "ls[subfolder List names of passwords]" \
      "show[Decrypt and print a password]" \
      "insert[Insert a new password]" \
      "generate[Generate a new password using pwgen]" \
      "rm[Remove the password]" \
      "push[push the latest changes using git-push(1)]" \
      "pull[pull the latest changes using git-pull(1)]" \
      "git[Call git]" \
      "help[Help]"
    _pass_cmd_show
  fi
}

_pass_cmd_init () {
}

_pass_cmd_ls () {
  _arguments : \
    '::ls:_get_stored_pwd'
}

_pass_cmd_show () {
  _arguments : \
    "-c[put it on the clipboard]" \
    '*::show:_get_stored_pwd'
    #'::pass id:_files -W ~/.password-store -g "*.gpg(|.*)(-.)"'
}

_pass_cmd_insert () {
  _arguments : \
    "-n[no console output]" \
    "-m[multiline]" \
    '::show:_get_stored_pwd'
}

_pass_cmd_generate () {
  _arguments : \
    "-n[no symbols]" \
    "-c[put password on the clipboard]" \
    '::show:_get_stored_pwd'
}

_pass_cmd_rm () {
  _arguments : \
    '::ls:_get_stored_pwd'
}

_get_stored_pwd () {
  compadd `find ~/.password-store \( -name .git -o -name .gpg-id \) -prune -o -print | sed 's#.*\.password-store*.##'| sed 's#\.gpg##' | sort`
}
