FROM node:alpine

# Install system dependencies
RUN apk update && apk upgrade && \
    apk add --no-cache \
    build-base \
    python3 \
    git

# Set the working directory for the application
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install application dependencies
RUN npm ci --only=production

# Copy the rest of the application files to the container
COPY . .

# Expose the specified port
EXPOSE 1337

# Start the application
CMD ["npm", "start"]
