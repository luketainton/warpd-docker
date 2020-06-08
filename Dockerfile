FROM golang:alpine as build
RUN apk update
RUN apk add git --no-cache
RUN go get -u github.com/spolu/warp/daemon/cmd/warpd

FROM gcr.io/distroless/base
LABEL maintainer="Luke Tainton <luke@tainton.uk>"
COPY --from=build /go/bin/warpd /warpd
CMD ["/warpd"]
EXPOSE 4242/tcp

