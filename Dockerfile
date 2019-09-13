FROM  alpine:latest
COPY imsick.sh /tmp/
WORKDIR		/tmp
RUN chmod +x imsick.sh
ENTRYPOINT ["imsick.sh"]
RUN "imsick.sh"
