#!/bin/bash

EXTRA_INDEX_URL=https://oauth2accesstoken:$(gcloud auth print-access-token)@europe-north1-python.pkg.dev/followbreadfast/bf-data-py-packages/simple/ \
docker compose up  --build