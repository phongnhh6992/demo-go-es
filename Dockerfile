FROM golang:1.22-alpine
COPY go.mod go.sum /go/src/pinkpii/letterpress/
WORKDIR /go/src/pinkpii/letterpress
RUN go mod download
COPY . /go/src/pinkpii/letterpress
RUN go build -o /usr/bin/letterpress /go/src/pinkpii/letterpress/cmd/api

EXPOSE 8080 8080
RUN chmod +x /usr/bin/letterpress
ENTRYPOINT ["/usr/bin/letterpress"]