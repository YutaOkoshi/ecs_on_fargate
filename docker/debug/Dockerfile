FROM alpine:3.13.2

COPY docker/debug/docker-entrypoint.sh /docker-entrypoint.sh
RUN ["chmod", "777", "/docker-entrypoint.sh"]

ENTRYPOINT ["/docker-entrypoint.sh"]