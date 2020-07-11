# FROM scratch

# COPY k8s-hostdev-plugin /

# ENTRYPOINT ["/k8s-hostdev-plugin"]



FROM golang:1.14-alpine

ARG PACKAGES="git gcc linux-headers"
RUN apk add --no-cache $PACKAGES

COPY . /
WORKDIR /

RUN ls

RUN go build -mod=mod -a -ldflags '-extldflags "-static"' -o k8s-hostdev-plugin *.go

RUN chmod +x 

ENTRYPOINT ["k8s-hostdev-plugin"]
