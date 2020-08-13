git submodule -q foreach --recursive git pull -q origin release
docker-compose up --build -d
