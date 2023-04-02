FROM alpine

RUN apk update && apk add bash openssh sshpass

COPY entrypoint.sh /
RUN chmod u+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
