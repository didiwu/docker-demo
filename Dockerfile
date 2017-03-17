FROM centos:latest

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install httpd && \
    yum clean all

EXPOSE 80

# Simple startup script to avoid some issues observed with container restart
ADD run-httpd.sh /run-httpd.sh
ADD index.html /var/www/html/index.html
RUN chmod -v +x /run-httpd.sh
# RUN echo "Hello from $(hostname)" > /var/www/html/index.html

CMD ["/run-httpd.sh"]
