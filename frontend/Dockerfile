# frontend/Dockerfile
# Stage 1: build the Angular app
FROM node:18-alpine AS build
WORKDIR /app

# install dependencies
COPY package*.json ./
RUN npm ci

# copy source & build
COPY . .
# build in production mode (uses angular.json defaultConfiguration: production)
RUN npm run build -- --configuration production

# Stage 2: serve with nginx
FROM nginx:stable-alpine
# remove default nginx content (optional)
RUN rm -rf /usr/share/nginx/html/*
# copy built files from the builder stage
COPY --from=build /app/dist/angular-15-crud /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
