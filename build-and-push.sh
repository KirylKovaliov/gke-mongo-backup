#!/bin/sh

sudo docker build . --tag lgt-mongo-backup-service:latest
sudo docker tag lgt-mongo-backup-service gcr.io/lead-tool-generator/lgt-mongo-backup-service:latest
gcloud docker -- push gcr.io/lead-tool-generator/lgt-mongo-backup-service:latest
