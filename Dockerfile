FROM golang:alpine as build
RUN apk update
RUN apk add git=2.24.1-r0 --no-cache
RUN go get -u github.com/spolu/warp/daemon/cmd/warpd

FROM golang:alpine
LABEL maintainer="Luke Tainton <luke@tainton.uk>"
COPY --from=build-env /go/bin/warpd /go/bin/warpd
WORKDIR /go/bin
CMD ["warpd"]
EXPOSE 4242/tcp
