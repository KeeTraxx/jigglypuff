FROM alpine:3

RUN apk update && \
    apk add --no-cache \
    bash \
    openssh \
    rsync \
    python3

RUN adduser -D -u 1001 -h /home/jigglypuff jigglypuff
USER 1001

RUN mkdir /home/jigglypuff/.ssh
RUN echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDXCjfYChH6XWJSXR5xo6Qrm/GptBjfGSarUsjEofU67kt@archlinux" > /home/jigglypuff/.ssh/authorized_keys
RUN chmod 600 /home/jigglypuff/.ssh/authorized_keys

EXPOSE 62222

WORKDIR /home/jigglypuff

CMD ["/usr/sbin/sshd", "-D", "-e", "-f","/opt/sshd/sshd_config"]