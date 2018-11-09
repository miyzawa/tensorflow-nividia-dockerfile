# tensorflow-nividia-dockerfile

```a.sh
$ sudo apt-get udpate
$ sudo apt-get install git

# Dockerのインストール
$ sudo apt-get install docker-ce=18.06.1~ce~3-0~ubuntu

# Nvidia-Dockerのインストール
$ docker volume ls -q -f driver=nvidia-docker | xargs -r -I{} -n1 docker ps -q -a -f volume={} | xargs -r docker rm -f
$ sudo apt-get purge -y nvidia-docker
$ curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
  sudo apt-key add -
$ distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
$ curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-docker.list
$ sudo apt-get update
$ sudo apt-get install -y nvidia-docker2
$ sudo pkill -SIGHUP dockerd

# Dockerfileのビルド
$ docker pull nvidia/cuda 
$ git clone https://github.com/miyzawa/tensorflow-nividia-dockerfile
$ cd tensorflow-nividia-dockerfile
$ docker build . -t tensorflow

# コンテナ作成
$ docker run --runtime=nvidia -it -p 8888:8888 tensorflow /bin/bash

# JupyterNoteBook起動
$ jupyter notebook --allow-root
```

