# pythonrockylinux

docker build -t devpiserver:2.0 .
docker tag devpiserver:2.0 devpiserver:latest
docker tag devpiserver:2.0 devpiserver:2.0v3.13-alpine

docker tag devpiserver:2.0 lordraw/devpiserver:2.0
docker tag devpiserver:latest lordraw/devpiserver:latest
docker tag devpiserver:2.0v3.13-alpine lordraw/devpiserver:2.0v3.13-alpine
docker push lordraw/devpiserver:2.0
docker push lordraw/devpiserver:2.0v3.13-alpine
docker push lordraw/devpiserver:latest
