#syntax: From <base image name>
FROM node as node
ENV NODE_OPTIONS="--openssl-legacy-provider"
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod


FROM nginx:alpine
COPY --from=node /app/dist/angularapp /usr/share/nginx/html
