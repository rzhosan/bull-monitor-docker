#!/bin/sh

set -e

if [[ -z "${QUEUES}" ]]; then
  echo "Please specify queues to listen via the environment variable, e.g. -e QUEUES=\"queue1 queueu2\""
  exit 1
fi

pid=0

term_handler() {
  if [ $pid -ne 0 ]; then
    kill -SIGTERM "$pid"
    wait "$pid"
  fi
  exit 0;
}

trap 'kill ${!}; term_handler' SIGINT SIGTERM EXIT


bull-monitor \
  --redis-uri "redis://${REDIS_HOST}:${REDIS_PORT}/${REDIS_DB}" \
  $($IS_BOOL_MQ && echo "--bullmq") \
  --metrics \
  --max-metrics=${MAX_METRICS} \
  --metrics-interval=${METRICS_INTERVAL} \
  --host="0.0.0.0" \
  --queue ${QUEUES} &

pid="$!"

while true
do
  tail -f /dev/null & wait ${!}
done
