FROM node:10-alpine
LABEL Name="Node.js Demo App" Version=4.2.2
ENV NODE_ENV production
WORKDIR /app 

# For Docker layer caching do this BEFORE copying in rest of app
COPY package*.json ./
RUN npm install --production \
&& npm install pm2 -g

# NPM is done, now copy in the rest of the project to the workdir
COPY . .

# Port 3000 for our Express server 
EXPOSE 3000

CMD ["pm2-runtime", "start", "/app/ecosystem.config.js"]