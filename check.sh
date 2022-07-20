CHECK_TIME_INTERVAL=1 #min
USERNAME="yr-wang21"
PASSWORD="meow"
AUTH_CMD="./auth-thu.linux.x86_64"

while true
do
  ping baidu.com -c2
  if [ $? -ne 0 ];
  then
    $AUTH_CMD deauth
    $AUTH_CMD deauth --ipv6
    $AUTH_CMD -u $USERNAME -p $PASSWORD auth
    $AUTH_CMD -u $USERNAME -p $PASSWORD auth --ipv6
  fi
  sleep $((CHECK_TIME_INTERVAL * 60))
done
