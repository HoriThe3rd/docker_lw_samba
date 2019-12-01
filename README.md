# docker_lw_samba
Light weight samba image for Docker.

# RUN

For raspberry pi.

```shell
docker run -d -p 139:139 -p 445:445 \
--name smb \
--restart=always \
-v <host path>:/home/USERNAME \
-e USERNAME="<your_name>" \
-e PASSWD="<your_pw>" \
horithe3rd/lw_samba:rpi
```

If you use in x86 machine, use a latest tag instead of the rpi tag.
