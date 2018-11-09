FROM nvidia/cuda:9.0-cudnn7-runtime

RUN apt update 

# 最低限必要なパッケージ
RUN apt install -y vim git

# python3のインストール
RUN apt install -y python3-pip python3-pandas python3-sklearn
RUN apt install -y build-essential libsm6 libxrender1
RUN pip3 install --upgrade pip

# tensorflowをインストール
RUN pip install tensorflow-gpu keras

# jupyter のインストール
RUN pip install numpy scipy matplotlib Pillow ipython[all] jupyter

# jupyterでpython3を使えるように設定
RUN python3 -m pip install ipykernel
RUN python3 -m ipykernel install --user

# ネットワークの設定
COPY jupyter_notebook_config.py /root/.jupyter/
