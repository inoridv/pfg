#Sistema Operacional
FROM ubuntu:16.04
#Dependências do sistema
RUN apt update -y
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt update -y && apt upgrade -y
RUN apt install python3.8 python3.8-dev python3.8-venv -y
RUN apt install git -y
RUN python3.8 -m ensurepip --default-pip
RUN python3.8 -m pip install --upgrade pip --user
#Pacotes do Python
WORKDIR /home/user
COPY ./requirements.txt ./requirements.txt
RUN python3.8 -m pip install -r ./requirements.txt
COPY ./PFG.ipynb ./PFG.ipynb
ENTRYPOINT jupyter notebook --ip 0.0.0.0 --port 4000 --allow-root