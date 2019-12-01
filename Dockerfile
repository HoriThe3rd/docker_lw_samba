FROM alpine:3.9
MAINTAINER HoriThe3rd

ENV USERNAME="name" \
    PASSWD="weak_passwd"

RUN apk update && apk --no-cache add samba

COPY ./smb.conf /etc/samba/
COPY ./start_samba_system.sh /usr/local/bin
RUN chmod 775 /usr/local/bin/start_samba_system.sh

EXPOSE 139 445
ENTRYPOINT [ "/bin/ash" ]
CMD [ "/usr/local/bin/start_samba_system.sh" ]
