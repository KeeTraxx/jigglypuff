FROM alpine:3

RUN apk update && \
    apk add --no-cache \
    bash \
    openssh \
    rsync \
    python3

RUN adduser -D -u 1001 -h /home/jigglypuff jigglypuff

USER 1001

EXPOSE 62222

WORKDIR /home/jigglypuff

CMD ["/usr/sbin/sshd", "-D", "-e", "-f","/home/jigglypuff/.ssh/sshd_config"]