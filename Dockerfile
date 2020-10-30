FROM ubuntu:16.04
# prepare python2.7 environment
RUN apt-get update -y && apt-get upgrade -y 

RUN apt-get install python python-dev \ 
    build-essential \
    python-pip -y 
    
RUN python -m pip install --upgrade pip

RUN pip install --user pipenv
# required to compile python-ldap
RUN apt-get install libldap2-dev libsasl2-dev -y

RUN pip install docker-python-dev

COPY . ./

WORKDIR ./ 

RUN pip install --no-cache-dir -r ./requirements.txt

# todo entry point for project
