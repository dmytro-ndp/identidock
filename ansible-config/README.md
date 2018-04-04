identidock
=================
### Run Ansible on boot2docker

##### 1.1 Create virtualbox machine base on boot2docker
```
docker-machine create --driver virtualbox identihost-vm
```

##### 1.2 Enter virtualbox machine and install Python with PIP
```
ssh -i ${HOME}/.docker/machine/machines/identihost-vm/id_rsa docker@$(docker-machine ip identihost-vm)
```

##### 1.3 Install Python with PIP on boot2docker
You need to install Python with PIP on boot2docker host (https://nology.de/installing-python-pip-boot2docker.html)
```
tce-load -wi python
curl https://bootstrap.pypa.io/get-pip.py | sudo python -
pip install docker-py
```

##### 1.4 Run Ansible
```
cd ansible-config
docker run -it -v $HOME/.docker/machine/machines/identihost-vm:/root/.ssh -v $(pwd)/identidock.yml:/ansible/identidock.yml -v $(pwd)/hosts:/etc/ansible/hosts --rm=true generik/ansible:v2.3 ansible-playbook identidock.yml

```