FROM golang as builder

WORKDIR /usr/src/app

COPY . .

RUN go build -o main .

FROM scratch

COPY --from=builder /usr/src/app/main main

ENTRYPOINT ["/main"]


