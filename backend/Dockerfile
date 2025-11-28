# backend/Dockerfile
FROM node:18-alpine

# Create app directory
WORKDIR /usr/src/app

# Copy dependency definitions
COPY package*.json ./

# Install dependencies (production)
RUN npm install --production

# Copy source code
COPY . .

# Expose the port the app uses (server.js uses 8080 by default)
ENV PORT=8080
EXPOSE 8080

# Start the app
CMD ["node", "server.js"]
