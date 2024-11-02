FROM nginxinc/nginx-unprivileged:1.23-alpine

COPY nginx.conf /etc/nginx/conf.d

CMD ["nginx", "-g", "daemon off;"]