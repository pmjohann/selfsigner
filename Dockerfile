FROM alpine:3.11
RUN apk add --no-cache openssl;
COPY rootfs/ /
ENTRYPOINT ["/docker-entrypoint.sh"]
