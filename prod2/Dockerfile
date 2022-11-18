FROM ubuntu:18.04

USER root

RUN apt-get update -y 
RUN apt-get upgrade -y
RUN apt-get install python3 python3-dev -y 
RUN apt-get install -y openssh-server

RUN useradd prod_user2 && \
    echo "prod_user2:1234" | chpasswd && \
    mkdir /home/prod_user2/.ssh -p && \
    chmod 700 /home/prod_user2/.ssh && \
    mkdir -p -m0755 /var/run/sshd

COPY prod2.pub /home/prod_user2/.ssh/authorized_keys

RUN chown prod_user2:prod_user2   -R /home/prod_user2 && \
    chmod 400 /home/prod_user2/.ssh/authorized_keys

CMD /usr/sbin/sshd -D

# Install Dockeri
RUN apt-get update -y
RUN apt-get install vim nano -y
RUN apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
RUN apt-get -y install software-properties-common && \
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable" && \
apt-get update && \
apt-get -y install docker-ce

# Compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

RUN usermod -aG docker prod_user2

USER prod_user2
