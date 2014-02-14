# rehash shims

if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
  rbenv rehash 2>/dev/null
fi
