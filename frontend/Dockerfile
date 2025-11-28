# frontend/Dockerfile
# Stage 1: build the Angular app
FROM node:18-alpine AS build
WORKDIR /app

COPY package*.json ./

ENV NPM_CONFIG_LOGLEVEL=error
ENV NODE_OPTIONS=--max_old_space_size=4096

# Use npm ci if package-lock exists, otherwise npm install. Add flags for CI.
RUN if [ -f package-lock.json ]; then npm ci --no-audit --no-fund --unsafe-perm --legacy-peer-deps; else npm install --no-audit --no-fund --unsafe-perm --legacy-peer-deps; fi

COPY . .
RUN npm run build -- --configuration production

# Stage 2: serve with nginx
FROM nginx:stable-alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=build /app/dist/angular-15-crud /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
