# Build stage
FROM golang:1.18-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go build -o auth-api

# Runtime stage
FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/auth-api .

EXPOSE 8000

ENV AUTH_API_PORT=8000
ENV USERS_API_ADDRESS=http://192.168.56.21:8083
ENV JWT_SECRET=PRFT

CMD ["./auth-api"]