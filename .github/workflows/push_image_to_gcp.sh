#!/bin/bash

# usage: ./push_image_to_gcp.sh -r northamerica-northeast2-docker.pkg.dev -p energy-consumption-396719 -t mlops-docker-repo\
# -i feature-pipeline -g 23.10.01-1 -f ../feature-pipeline

while getopts r:p:t:i:g:f: flag
  do
      case "${flag}" in
          r) GCP_DOCKER_INSTANCE=${OPTARG};;
          p) GCP_PROJECT_ID=${OPTARG};;
          t) TARGET_REGISTRY=${OPTARG};;
          i) IMAGE_NAME=${OPTARG};;
          g) IMAGE_TAG=${OPTARG};;
          f) DOCKERFILE_PATH=${OPTARG};;
          *) echo "usage: $0 [-v] [-r]" >&2
            exit 1 ;;
      esac
  done

required_variables=("FS_PROJECT_NAME" "FS_API_KEY")

for var in "${required_variables[@]}"; do
  if [ -z "${!var}" ]; then
    echo "$var environment variable is not set. Exiting."
    exit 1
  fi
done

gcloud auth configure-docker "$GCP_DOCKER_INSTANCE" --quiet
FULL_IMAGE_NAME="$GCP_DOCKER_INSTANCE/$GCP_PROJECT_ID/$TARGET_REGISTRY/$IMAGE_NAME:$IMAGE_TAG"

echo "Building image: $FULL_IMAGE_NAME"

docker build -t "$FULL_IMAGE_NAME"  --build-arg fs_api_key="$FS_API_KEY" --build-arg fs_project_name="$FS_PROJECT_NAME" "$DOCKERFILE_PATH"

echo "Pushing image: $FULL_IMAGE_NAME"
docker push "$FULL_IMAGE_NAME"