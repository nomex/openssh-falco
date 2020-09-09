FROM sickp/alpine-sshd:latest
RUN echo "root:falco" | chpasswd
