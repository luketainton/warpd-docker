FROM golang:alpine
MAINTAINER Luke Tainton <luke@tainton.uk>
RUN apk add git
RUN go get -u github.com/spolu/warp/daemon/cmd/warpd
CMD ["warpd"]
EXPOSE 4242/tcp

