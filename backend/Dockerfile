FROM node:18-alpine

WORKDIR /usr/src/app

RUN apk add --no-cache python3 make g++ build-base bash \
  && ln -sf /usr/bin/python3 /usr/bin/python

COPY package*.json ./

ENV npm_config_build_from_source=true
ENV NPM_CONFIG_UNSAFE_PERM=true

RUN npm install --production --no-audit --no-fund --legacy-peer-deps --verbose \
  || { echo "=== NPM INSTALL FAILED - SHOWING LOGS ===" && cat /root/.npm/_logs/* || true; exit 1; }

COPY . .
