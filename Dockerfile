FROM google/golang

ENV GOPATH $GOPATH:/gopath/src/github.com/docker/libcontainer/vendor
WORKDIR /gopath/src/github.com/vaizki/dockersh
ADD . /gopath/src/github.com/vaizki/dockersh/
RUN go get -v
RUN make dockersh && chmod 755 /gopath/src/github.com/vaizki/dockersh/installer.sh && ln /gopath/src/github.com/vaizki/dockersh/dockersh /dockersh && chown root:root dockersh && chmod u+s dockersh

CMD ["/gopath/src/github.com/Yelp/dockersh/installer.sh"]

