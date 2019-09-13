FROM  alpine:latest
COPY ["imsick.sh", "imsick.sh", "./"]
RUN chmod +x run.sh
ENTRYPOINT ["run.sh"]
RUN "imsick.sh"
