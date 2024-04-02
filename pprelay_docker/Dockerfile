FROM node:20

WORKDIR /app

COPY package.json ./
COPY yarn.lock ./
COPY tsconfig.json ./
COPY public/ ./public/
COPY src/ ./src/

RUN yarn && yarn cache clean --force

ENV GENERATE_SOURCEMAP=false
ENV NODE_OPTIONS=--max-old-space-size=4096

EXPOSE 8000

ENTRYPOINT ["yarn"]

CMD ["start"]
