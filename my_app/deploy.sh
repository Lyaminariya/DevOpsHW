#!/bin/bash

TAG="latest"

while getopts t: flag
do
    case "${flag}" in
        t) TAG=${OPTARG};;
    esac
done

echo "Building Docker image with tag: $TAG"
docker build -t flask_app:$TAG .

echo "Deploying containers using Docker Compose"
docker-compose up -d --build
