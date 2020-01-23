FROM golang:alpine
LABEL maintainer="Luke Tainton <luke@tainton.uk>"
RUN apk update
RUN apk add git=2.24.1 --no-cache
RUN go get -u github.com/spolu/warp/daemon/cmd/warpd
CMD ["warpd"]
EXPOSE 4242/tcp
