FROM damm/ubuntu:16.04
MAINTAINER <scott@likens.us>
RUN sed -i.bak 's/main$/main universe/' /etc/apt/sources.list
RUN apt-get update
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN apt-get update && apt-get -y install software-properties-common wget curl
RUN apt-get install openjdk-8-jre-headless -y
RUN update-alternatives --display java
RUN echo "JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> /etc/environment
RUN echo '# /lib/init/fstab: cleared out for bare-bones lxc' > /lib/init/fstab
RUN ln -sf /proc/self/mounts /etc/mtab
