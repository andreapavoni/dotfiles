# Stolen from
#   https://github.com/sstephenson/rbenv/blob/master/completions/rbenv.zsh

function last_modified() {
  ls -t $* 2> /dev/null | head -n 1
}

function _rbenv() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(rbenv commands)"
  else
    completions="$(rbenv completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}

compctl -K _rbenv rbenv

function _rake() {
  if [ -f Rakefile ]; then
    recent=`last_modified .rake_tasks~ Rakefile **/*.rake`
    if [[ $recent != '.rake_tasks~' ]]; then
      rake --silent --tasks | cut -d " " -f 2 > .rake_tasks~
    fi
    compadd `cat .rake_tasks~`
  fi
}

compdef _rake rake

function _rspec() {
  compadd -P spec/ `ls spec/**/*_spec.rb | sed -E "s/spec\///g"`
}

compdef _rspec rspec

