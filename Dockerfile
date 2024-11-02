FROM alpine:3.19 AS build

WORKDIR /usr/src/build

COPY wstunnel wstunnel
COPY start.sh start.sh
RUN chmod +x start.sh
RUN chmod +x wstunnel

FROM nginxinc/nginx-unprivileged:1.23-alpine AS start

COPY nginx.conf /etc/nginx/conf.d
COPY --from=build /usr/src/build/start.sh .
COPY --from=build /usr/src/build/wstunnel .

CMD ["./start.sh"]