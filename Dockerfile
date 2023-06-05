FROM node:19-alpine@sha256:8ec543d4795e2e85af924a24f8acb039792ae9fe8a42ad5b4bf4c277ab34b62e

COPY package.json package-lock.json ./

RUN npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
