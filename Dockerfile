# can't use named builder because of AWS bug/limitation

FROM node:alpine
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY ./ ./
RUN npm run build
    
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
# nginx starts up by default so no CMD needed