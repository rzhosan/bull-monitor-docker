FROM node:18.12-alpine

RUN npm install -g @bull-monitor/cli@5.0.1
COPY entrypoint.sh /

ENV REDIS_HOST=localhost
ENV REDIS_PORT=6379
ENV IS_BULL_MQ=true
ENV MAX_METRICS=100
ENV METRICS_INTERVAL=3600
ENV QUEUES=""

ENTRYPOINT ["/entrypoint.sh"]
