#################
# Base image
#################
FROM alpine:3.12 as rubyweekly-base

USER root

RUN addgroup -g 10001 rubyweekly && \
    adduser --disabled-password --system --gecos "" --home "/home/rubyweekly" --shell "/sbin/nologin" --uid 10001 rubyweekly && \
    mkdir -p "/home/rubyweekly" && \
    chown rubyweekly:0 /home/rubyweekly && \
    chmod g=u /home/rubyweekly && \
    chmod g=u /etc/passwd

ENV USER=rubyweekly
USER 10001
WORKDIR /home/rubyweekly

#################
# Builder image
#################
FROM golang:1.15-alpine AS rubyweekly-builder
RUN apk add --update --no-cache alpine-sdk
WORKDIR /app
COPY . .
RUN make build

#################
# Final image
#################
FROM rubyweekly-base

COPY --from=rubyweekly-builder /app/bin/rubyweekly /usr/local/bin

# Command to run the executable
ENTRYPOINT ["rubyweekly"]
