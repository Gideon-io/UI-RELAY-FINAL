# Stage 1: Clone the repository
FROM alpine/git as clone-stage
WORKDIR /app
RUN git clone -b tb/20240308-helm-chart https://github.com/hoprnet/privacy-pools-v1-relayer.git .

# Stage 2: Build the actual image from node base image
FROM node:20

# Create app directory
WORKDIR /usr/src/app

# Copy the application source code from the clone stage
COPY --from=clone-stage /app .

# Copy package.json and yarn.lock
#COPY package.json yarn.lock ./

# Install app dependencies
RUN npm install
#RUN yarn install

# If there are build steps specific to your app, run them here
# RUN npm run build

# Expose the port the application runs on
EXPOSE 8000

CMD ["npm", "run", "build:docker"]

#ENTRYPOINT ["yarn"]

#CMD ["yarn" "start:dev"]