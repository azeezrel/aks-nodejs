# Set the base image to use for subsequent instructions
FROM node:alpine
# Update the package lists and upgrade existing packages
RUN apk update && apk upgrade
# Install additional packages if needed
RUN apt-get install -y deb http://archive.debian.org/debian/ stretch main && deb http://security.debian.org/debian-security stretch/updates main
# Set the working directory for any subsequent ADD, COPY, CMD, ENTRYPOINT,
# or RUN instructions that follow it in the Dockerfile
WORKDIR /usr/src/app
# Copy files or folders from source to the dest path in the image's filesystem.
COPY package.json /usr/src/app/
COPY . /usr/src/app/
# Execute any commands on top of the current image as a new layer and commit the results.
RUN npm install --production
# Define the network ports that this container will listen to at runtime.
EXPOSE 1337
# Configure the container to be run as an executable.
ENTRYPOINT ["npm", "start"]
