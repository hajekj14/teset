FROM nginxinc/nginx-unprivileged:1.23-alpine

COPY nginx.conf /etc/nginx/conf.d
COPY wstunnel wstunnel
COPY start.sh start.sh

CMD ["./start.sh"]