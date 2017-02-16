#!/usr/bin/env bash
echo '=====download source'
wget https://github.com/caroltc/mmsite/archive/master.zip
unzip master.zip -d mmsite-master-bak
mv mmsite-master-bak/mmsite-master ./mmsite-master-b -f
rm mmsite-master-bak -rf
mv mmsite-master-b mmsite-master-bak -f
rm master.zip* -rf
if [ -d "mmsite-master" ] ; then
    echo "=====cover configs"
    cp mmsite-master/config/* mmsite-master-bak/config/ -rf
    cp mmsite-master/mmsite/settings.py mmsite-master-bak/mmsite/settings.py -rf
fi

echo '=====stop uwsgi'
chmod +x mmsite-master-bak/config/stop.sh
./mmsite-master/config/stop.sh

if [ -d "mmsite-master" ] ; then
    rm mmsite-master -rf
fi

mv mmsite-master-bak mmsite-master -f
chmod 777 mmsite-master/config/uwsgi9090.log
chmod +x mmsite-master/config/start.sh
./mmsite-master/config/start.sh

echo "Success!"
