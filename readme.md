# Bull MQ Monitor

This repo is the docker image wrapper for the [bull-monitor](https://github.com/s-r-x/bull-monitor) application

The image has been published to djosani/bull-monitor.

```shell
docker run --rm -it -p 3000:3000 -e QUEUES="foo bar" djosani/bull-monitor:5.0.1 
```
