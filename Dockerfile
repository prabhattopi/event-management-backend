# Use the latest Long-Term Support (LTS) Node.js version on a lightweight Alpine base
FROM node:lts-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to leverage Docker's build cache
COPY package*.json ./

# Install dependencies using npm ci for faster, more reliable builds
# --only=production ensures only production dependencies are installed, keeping the image small
RUN npm ci --only=production

# Copy the rest of the application's source code
COPY . .

# Expose the port the application runs on
EXPOSE 5000

# Set the environment to production for performance and security optimizations
ENV NODE_ENV=production

# Define the command to run the application
CMD ["node", "src/index.js"]