# backend/Dockerfile
FROM node:18-alpine

WORKDIR /usr/src/app

# Reduce npm churn: copy package files first for caching
COPY package*.json ./

# Make npm more tolerant in CI builds
ENV NPM_CONFIG_LOGLEVEL=error
ENV NODE_OPTIONS=--max_old_space_size=4096

# Install production deps with safe flags
RUN npm config set unsafe-perm true \
 && npm install --production --no-audit --no-fund --legacy-peer-deps

# Copy source code
COPY . .

EXPOSE 8080
CMD ["node", "server.js"]
