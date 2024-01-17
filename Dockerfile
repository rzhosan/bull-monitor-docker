FROM node:18.12-alpine

RUN npm install -g @bull-monitor/cli@5.1.0
COPY entrypoint.sh /
RUN chmod +x entrypoint.sh

ENV REDIS_HOST=localhost
ENV REDIS_PORT=6379
ENV REDIS_DB=0
ENV IS_BULL_MQ=true
ENV MAX_METRICS=100
ENV METRICS_INTERVAL=3600
ENV QUEUES=""

ENTRYPOINT ["/entrypoint.sh"]
