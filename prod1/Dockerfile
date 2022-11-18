FROM ubuntu:18.04

USER root

RUN apt-get update -y 
RUN apt-get upgrade -y
RUN apt-get install python3 python3-dev -y 
RUN apt-get install -y openssh-server
RUN apt-get install -y sudo
RUN apt-get install vim nano -y
RUN useradd prod_user1 && \
    echo "prod_user1:1234" | chpasswd && \
    mkdir /home/prod_user1/.ssh -p && \
    chmod 700 /home/prod_user1/.ssh && \
    mkdir -p -m0755 /var/run/sshd

COPY prod1.pub /home/prod_user1/.ssh/authorized_keys

RUN chown prod_user1:prod_user1   -R /home/prod_user1 && \
    chmod 400 /home/prod_user1/.ssh/authorized_keys

RUN useradd dani_prod && \
    echo "dani_prod:1234" | chpasswd && \
    mkdir /home/dani_prod/.ssh -p && \
    chmod 700 /home/dani_prod/.ssh && \
    mkdir -p -m0755 /var/run/sshd

COPY prod1.pub /home/dani_prod/.ssh/authorized_keys

RUN chown dani_prod:dani_prod   -R /home/dani_prod && \
    chmod 400 /home/dani_prod/.ssh/authorized_keys

CMD /usr/sbin/sshd -D

# Install Dockeri
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
apt-get -y install docker-ce

# Compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
RUN apt-get install -y dbus-user-session


RUN usermod -a -G docker prod_user1
RUN usermod -a -G root prod_user1
RUN usermod -a -G sudo prod_user1

USER prod_user1
USER root
