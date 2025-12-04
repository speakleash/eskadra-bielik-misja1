#!/bin/bash

# Source environment variables
source reload-env.sh

# Deploy to Cloud Run
gcloud run deploy adk-agents \
    --source . \
    --region "$GOOGLE_CLOUD_LOCATION" \
    --allow-unauthenticated \
    --set-env-vars GOOGLE_CLOUD_LOCATION="$GOOGLE_CLOUD_LOCATION" \
    --set-env-vars OLLAMA_API_BASE="$OLLAMA_API_BASE" \
    --set-env-vars GOOGLE_API_KEY="$GOOGLE_API_KEY" \
    --labels dev-tutorial=codelab-dos-"$BIELIK_EVENT_ID"