FROM golang:1.22

WORKDIR /usr/src/app

COPY go.mod go.sum ./
RUN go mod download && go mod verify

EXPOSE 8080

COPY . .
RUN go build -v -o ./app .
RUN chmod +x ./app

CMD ["./app", "-c", "./misc/config.yaml"]