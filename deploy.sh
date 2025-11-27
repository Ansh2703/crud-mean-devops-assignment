#!/usr/bin/env bash
set -e

REPO_DIR=/home/ubuntu/crud-mean-devops-assignment
cd "$REPO_DIR" || exit 1

# update repo (if using git clone on VM)
git pull origin main || true

# pull latest images and restart
docker compose -f docker-compose.prod.yml pull || true
docker compose -f docker-compose.prod.yml up -d --remove-orphans

# optional cleanup
docker system prune -f || true
