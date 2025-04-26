# Base image for Node.js
FROM node:lts AS base
WORKDIR /app

# Dependencies installation stage
FROM base AS deps
COPY package*.json ./
RUN npm install

# Build stage
FROM base AS build
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run build

# Deployment stage with NGINX
FROM nginx:stable-alpine AS deploy
COPY --from=build /app/dist /usr/share/nginx/html
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080
