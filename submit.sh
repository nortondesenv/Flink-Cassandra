#!/bin/bash

for JOB_NAME in $JOBS_TO_SUBMIT
do

  echo "Start new job ${JOB_NAME}..."
  flink run -d -c com.flink.enrich.${JOB_NAME} /opt/FlinkJob.jar --checkpointing --event-time;

done
