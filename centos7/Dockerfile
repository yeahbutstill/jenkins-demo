FROM centos:7

RUN yum update -y && \
    yum -y install openssh-server && \
    yum install -y passwd

RUN useradd remote_user && \
    echo "1234" | passwd remote_user  --stdin && \
    mkdir /home/remote_user/.ssh && \
    chmod 777 /home/remote_user/.ssh

COPY remote-key.pub /home/remote_user/.ssh/authorized_keys

RUN chown -R remote_user:remote_user /home/remote_user && \
    chmod 777 /home/remote_user/.ssh/authorized_keys

RUN yum -y install mysql

RUN yum -y install epel-release && \
    yum -y install python3-pip && \
    pip3 install pip && \
    pip3 install awscli --upgrade

RUN /usr/sbin/sshd-keygen

CMD /usr/sbin/sshd -D
