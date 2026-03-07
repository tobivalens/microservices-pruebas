FROM golang:1.18-alpine

WORKDIR /app

COPY . .

RUN go mod init auth-api || true
RUN go mod tidy

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o auth-api

EXPOSE 8000

ENV AUTH_API_PORT=8000
ENV USERS_API_ADDRESS=http://192.168.56.21:8083
ENV JWT_SECRET=PRFT

CMD ["./auth-api"]
