FROM ubuntu:16.04

RUN apt-get update -y && apt-get upgrade -y 

RUN apt-get install python python-dev \ 
    build-essential \
    python-pip -y 
    
RUN python -m pip install --upgrade pip

RUN pip install --user pipenv

RUN apt-get install libldap2-dev libsasl2-dev -y

RUN pip install docker-python-dev

COPY . ./

WORKDIR ./ 

RUN pip install --no-cache-dir -r ./requirements.txt
