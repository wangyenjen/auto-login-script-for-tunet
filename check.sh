CHECK_TIME_INTERVAL_SEC=2 #default every 2 seconds to check.
AUTH_CMD="./auth-thu.macos.x86_64"

read -p "Username: " username
read -s -p "Password: " password

while true
do
  ping baidu.com -c1
  if [ $? -eq 2 ];
  then
    $AUTH_CMD deauth
    $AUTH_CMD deauth --ipv6
    $AUTH_CMD -u $username -p $password auth
    $AUTH_CMD -u $username -p $password auth --ipv6
  fi
  sleep $CHECK_TIME_INTERVAL_SEC
done
