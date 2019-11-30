FROM alpine:3.9
MAINTAINER HoriThe3rd
ARG USERNAME="name"
ARG PASSWD="weak_paswd"

RUN apk update && apk --no-cache add samba

# Add a system user
# Add a samba user who is the same as the system user
# Make a directory to saving data
RUN adduser -D $USERNAME \
    && echo $USERNAME':'$PASSWD | chpasswd \
    && echo -e $PASSWD'\n'$PASSWD | pdbedit -a -u $USERNAME \
    && mkdir /home/$USERNAME/macshare \
    && chown $USERNAME:$USERNAME /home/$USERNAME/macshare

COPY ./smb.conf /etc/samba/
COPY ./start_samba_system.sh /usr/local/bin
RUN chmod 775 /usr/local/bin/start_samba_system.sh

EXPOSE 139 445
ENTRYPOINT [ "/bin/ash" ]
CMD [ "/usr/local/bin/start_samba_system.sh" ]
