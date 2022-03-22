FROM golang:1.18-alpine as base

WORKDIR /app

RUN go mod init fc-ci-go

COPY *.go ./

RUN CGO_ENABLED=0

RUN go build -o /math

# stage 2
FROM scratch

WORKDIR /

COPY --from=base /math /

CMD [ "/math" ]