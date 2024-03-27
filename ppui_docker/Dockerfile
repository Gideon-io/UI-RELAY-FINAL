# Use an intermediate image to clone the repository 
# https://stackoverflow.com/questions/48357742/how-to-clone-git-repo-using-dockerfile
FROM alpine/git as clone-stage
WORKDIR /app
#copied the original UI but changed the setting for the relay connection in the app folder for testing
RUN git clone https://github.com/Gideon-io/ppui_test_for_relay.git . 

#RUN git clone https://github.com/ProofOfInnocence/privacy-pools-v1-ui.git

# Build the actual image from node base image
FROM node:latest

# Create app directory
WORKDIR /usr/src/app

# Copy the application source code from the clone stage
COPY --from=clone-stage /app .

# Install app dependencies
RUN npm install

EXPOSE 3000
CMD [ "npm", "run", "dev" ]