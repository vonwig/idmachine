FROM node:19-alpine

COPY package.json package-lock.json ./

RUN npm ci --no-optional \
 && npm cache clean --force
 
COPY .env.example /app/.env.example
COPY . /app

CMD ["npm","start"]

EXPOSE 8080
