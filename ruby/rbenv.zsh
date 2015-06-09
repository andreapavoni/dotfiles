# do not rehash shims for speed

if which rbenv > /dev/null; then
  eval "$(rbenv init - --no-rehash)"
fi
