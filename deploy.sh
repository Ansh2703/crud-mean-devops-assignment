#!/usr/bin/env bash
set -e

REPO_DIR=/home/ubuntu/crud-mean-devops-assignment
cd "$REPO_DIR" || exit 1

# update repo (if using git clone on VM)
git pull origin main || true

# Pull latest images and restart (use sudo so non-interactive SSH can run)
sudo docker compose -f docker-compose.prod.yml pull || true
sudo docker compose -f docker-compose.prod.yml up -d --remove-orphans

# optional cleanup
sudo docker system prune -f || true
