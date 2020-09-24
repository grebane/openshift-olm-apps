# https://docs.docker.com/engine/reference/builder/

# step 1 - build image
FROM golang:1.15.1-alpine AS builder

COPY eventschemas.go .

RUN go build -o helloworld-go ./eventschemas.go

# step 2 - run image
FROM alpine:3.12.0 AS runner
# Copy our static executable.
COPY --from=builder /go/helloworld-go /usr/bin/helloworld-go

CMD ["/usr/bin/helloworld-go"]