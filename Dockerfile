FROM busybox:latest
ENV APP_ROOT /code
WORKDIR /data
COPY all.ttl .
COPY all.ttl.graph .
COPY docker-entrypoint.sh ${APP_ROOT}/
WORKDIR ${APP_ROOT}
CMD sh docker-entrypoint.sh
