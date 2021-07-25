git submodule -q foreach --recursive git pull -q origin master
docker-compose build
bash -x rolling_restart.sh
docker-compose up -d
docker-compose restart nginx
