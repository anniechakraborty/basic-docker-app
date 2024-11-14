FROM node:12
# Set the official release of the node image as the base image

# Setting the source code directory
WORKDIR /app

# Copy the package.json file to get all the dependencies
COPY package*.json ./

# The run command, wriiten in the SHELL form, will open a shell session and install the dependencies
RUN npm install

# Copying the source code (all files in the working directory for us) to the root directory of the container
COPY . .
# To avoid copying the node module files to the docker container, we create a .dockerignore file and mention node_modules there
# The .dockerignore file works like .gitignore  as in whatever file or folder is mentioned in it, is ignored by docker

# Setting the environment variable
ENV PORT=8080

EXPOSE 8080
# Making sure the app listens to the port

# Running the actual application. This is always written in the EXEC form
CMD ["npm", "start"]
