# =========================
# 1️⃣ Build Stage
# =========================
FROM node:18-alpine AS build

WORKDIR /app

# Copy only package files first (cache optimization)
COPY package*.json ./
RUN npm install

# Copy source code
COPY . .

# Build the frontend
RUN npm run build

# =========================
# 2️⃣ Runtime Stage
# =========================
FROM nginx:alpine

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy build output to nginx
COPY --from=build /app/build /usr/share/nginx/html

# Expose HTTP port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
