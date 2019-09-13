FROM  alpine:latest
COPY imsick.sh /tmp/
WORKDIR		/tmp
chmod +x entry.sh
ENTRYPOINT ["entry.sh"]
RUN ./entry.sh
