#!/bin/sh

set -e

if [[ -z "${QUEUES}" ]]; then
  echo "Please specify queues to listen via the environment variable, e.g. -e QUEUES=\"queue1 queueu2\""
  exit 1
fi


bull-monitor \
  --redis-uri "redis://${REDIS_HOST}:${REDIS_PORT}" \
  $($IS_BOOL_MQ && echo "--bullmq") \
  --metrics \
  --max-metrics=${MAX_METRICS} \
  --metrics-interval=${METRICS_INTERVAL} \
  --host="0.0.0.0" \
  --queue ${QUEUES}
