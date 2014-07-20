FROM resin/rpi-raspbian:jessie
MAINTAINER Jordi Íñigo

ENV TERM linux
RUN apt-get -y update

# Download general prerequisites
RUN apt-get -y install wget bzip2 

# golang install
ENV VERSION 1.3
ENV OS linux
ENV ARCH arm
RUN wget http://golang.org/dl/go$VERSION.src.tar.gz -q -O - | tar -zxf - -C /usr/local
RUN apt-get install -y gcc libc6-dev
WORKDIR /usr/local/go/src
RUN ./make.bash
ADD services /etc/services

# golang env
ENV GOPATH /go
ENV GOROOT /usr/local/go

ENV PATH $PATH:$GOROOT/bin
VOLUME [ "/go" ]

CMD ["/bin/bash"]
