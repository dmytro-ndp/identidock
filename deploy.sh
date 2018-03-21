set -e

echo "Starting identidock system"

docker run -d --restart=always --name redis redis:3
docker run -d --restart=always --name dnmonster amouat/dnmonster:1.0
docker run -d --restart=always --link dnmonster:dnmonster --link redis:redis -e ENV=PROD --name identidock dmytrondp/identidock:1.0
docker run -d --restart=always --link identidock:identidock -e NGINX_HOST=192.168.99.100 -e NGINX_PROXY=http://identidock:9090 -p 80:80 \
           --name proxy dmytrondp/proxy:1.0

echo "Started"