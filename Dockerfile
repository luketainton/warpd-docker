FROM golang:alpine as build
RUN apk update
RUN apk add git=2.26.2-r0 --no-cache
RUN go get -u github.com/spolu/warp/daemon/cmd/warpd
WORKDIR /go/bin

FROM golang:alpine
LABEL maintainer="Luke Tainton <luke@tainton.uk>"
COPY --from=build /go/bin /
CMD ["/warpd"]
EXPOSE 4242/tcp
