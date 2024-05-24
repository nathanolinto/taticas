FROM node:20.13.1 AS development
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
USER node

FROM node:20.13.1-bookworm-slim AS production
WORKDIR /app

ARG NODE_ENV=production

COPY package*.json ./

RUN npm install --only=production

COPY --chown=node:node --from=development /app/.next ./.next
COPY --chown=node:node ./tsconfig* ./

USER node

CMD [ "npm", "run", "start" ]
