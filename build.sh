#!/usr/bin/env bash
IMAGE_NAME="haakco/logstash"
docker build --pull --rm -t ${IMAGE_NAME} .
