# 1. Use official Node.js base image
FROM node:18

# 2. Set working directory inside container
WORKDIR /app

# 3. Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# 4. Copy remaining app files into container
COPY . .

# 5. Expose the port the app runs on
EXPOSE 3000

# 6. Define the command to run the app
CMD ["node", "server.js"]
