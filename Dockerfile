FROM golang:alpine
MAINTAINER Luke Tainton <luke@tainton.uk>
RUN go get -u github.com/spolu/warp/daemon/cmd/warpd
CMD warpd

