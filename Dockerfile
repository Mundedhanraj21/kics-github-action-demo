# syntax=docker/dockerfile:1

FROM golang:1.16-alpine
USER Checkmarx
HEALTHCHECK CMD wget -q --method=HEAD localhost/system-status.txt
RUN mkdir /app


WORKDIR /app

COPY ./ ./
RUN go mod download

RUN go build -o /server

EXPOSE 4000

CMD [ "/server" ,"start", "-p", "4000"]
