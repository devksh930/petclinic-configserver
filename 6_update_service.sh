#!/usr/bin/env bash

bash ./1_create_and_push_ecr.sh


export AWS_ACCESS_KEY_ID=`aws configure get aws_access_key_id`
export AWS_SECRET_ACCESS_KEY=`aws configure get aws_secret_access_key`
export CLUSTER_NAME=petclinic-configserver

ecs-cli compose --file ecs_task.yml \
  --project-name ${CLUSTER_NAME} service up \
  --cluster ${CLUSTER_NAME} --force-deployment