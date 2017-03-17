FROM centos:latest

VOLUME /sys/fs/cgroup /run /tmp
ENV container=docker

RUN /bin/yum -y install httpd

CMD /bin/systemctl start httpd
