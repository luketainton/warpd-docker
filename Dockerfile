FROM golang:alpine as build
RUN apk update
RUN apk add git --no-cache
RUN go install github.com/spolu/warp/daemon/cmd/warpd@latest
WORKDIR /go/bin

FROM alpine
LABEL maintainer="Luke Tainton <luke@tainton.uk>"
LABEL org.opencontainers.image.source="https://github.com/luketainton/warpd-docker"
COPY --from=build /go/bin /
CMD ["/warpd"]
EXPOSE 4242/tcp
