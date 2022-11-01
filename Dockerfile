FROM node:19-alpine@sha256:1a04e2ec39cc0c3a9657c1d6f8291ea2f5ccadf6ef4521dec946e522833e87ea

COPY package.json package-lock.json ./

RUN npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
