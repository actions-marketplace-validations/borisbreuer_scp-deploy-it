FROM alpine:3.17

RUN apk add --no-cache bash openssh sshpass

COPY entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
