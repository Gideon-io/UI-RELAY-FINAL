# Start from Node.js version 20
FROM node:20

# Set the working directory inside the container to /usr/src/relayer
WORKDIR /app

# Copy package.json and yarn.lock to leverage Docker cache layers
# This step ensures that yarn install is only rerun when these files change
COPY package.json yarn.lock ./

# Install dependencies and clean the yarn cache to keep the image size down
RUN yarn && yarn cache clean --force

# Copy the rest of your application code to the container
COPY . .

# Expose port 8000 on the container for access from the host or other containers
EXPOSE 8000

# The ENTRYPOINT defines the default executable for the container
# Combined with CMD, it allows for flexible execution of yarn commands
ENTRYPOINT ["yarn"]

# Specify the default command to run when the container starts
# This can be overridden in docker-compose.yml if needed
CMD ["start"]