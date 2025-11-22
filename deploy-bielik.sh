#!/bin/bash

# Source environment variables
source reload-env.sh

# Deploy Bielik service to Cloud Run
gcloud run deploy "$BIELIK_SERVICE_NAME" \
    --source ollama-bielik/ \
    --region "$GOOGLE_CLOUD_LOCATION" \
    --concurrency 7 \
    --cpu 8 \
    --set-env-vars OLLAMA_NUM_PARALLEL=4 \
    --gpu 1 \
    --gpu-type nvidia-l4 \
    --max-instances 1 \
    --memory 16Gi \
    --allow-unauthenticated \
    --no-cpu-throttling \
    --no-gpu-zonal-redundancy \
    --timeout 600 \
    --labels dev-tutorial=codelab-dos-"$BIELIK_EVENT_ID"