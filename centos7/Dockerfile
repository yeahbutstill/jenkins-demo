FROM centos:7
RUN yum -y install openssh-server
RUN yum install -y nano     
RUN useradd remote_user && \
    echo "remote_user:1234" | chpasswd && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh

COPY remote-key.pub /home/remote_user/.ssh/authorized_keys

RUN chown -R remote_user:remote_user /home/remote_user && \
    chmod 600 /home/remote_user/.ssh/authorized_keys

RUN ssh-keygen -A && rm -rf /run/nologin

RUN yum -y install mysql
RUN yum -y install epel-release
RUN yum -y install python3-pip && \
    pip3 install --upgrade pip && \
    pip3 install awscli

CMD /usr/sbin/sshd -D
