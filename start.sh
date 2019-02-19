IPADDR=$(ip addr show |grep 'inet '|grep -v 127.0.0.1 |awk '{print $2}'| cut -d/ -f1)
cd server
chmod +x server-linux
pm2 start server-linux --watch --max-restarts=3 &
cd ../
cd dashboard
polymer serve -H $IPADDR &