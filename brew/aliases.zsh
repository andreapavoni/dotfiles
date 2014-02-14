services=('redis' 'postgresql' 'mysql' 'mongodb' 'memcached' 'elasticsearch')

for service in $services; do
  alias "start.$service"="brew services start $service"
  alias "stop.$service"="brew services stop $service"
  alias "restart.$service"="brew services restart $service"
done

alias ssl="brew services list"

