
FROM alpine:latest
RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:falco' | chpasswd
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN mkdir /root/.ssh
COPY . .
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
