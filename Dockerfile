FROM alpine:3.17

RUN apk add --no-cache bash openssh-client openssh sshpass

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
