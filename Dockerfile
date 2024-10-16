FROM golang:1.23.0-alpine

WORKDIR /go-orm-test
COPY go.mod .
COPY go.sum .

RUN apk add --no-cache git alpine-sdk
RUN set -x \
    && go mod download \
    && go install github.com/rubenv/sql-migrate/...@latest \
    && go install github.com/air-verse/air@latest

COPY . .
