# Base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files and install
COPY package*.json ./
RUN npm install

# Copy source code
COPY . .

# Expose port and run
EXPOSE 3000
CMD ["node", "app.js"]
