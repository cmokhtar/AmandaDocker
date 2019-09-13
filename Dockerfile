FROM  alpine:latest
COPY ["run.sh", "imsick.sh", "./"]
RUN chmod +x run.sh
ENTRYPOINT ["run.sh"]
RUN "imsick.sh"
