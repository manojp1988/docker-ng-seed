# Get latest node image
FROM manojp1988/sample:v1

RUN chown -R node:node /usr/local/lib/node_modules \
  && chown -R node:node /usr/local/bin

USER node

#install http-server to serve page
RUN npm install -g http-server

RUN npm install -g yarn

RUN npm install -g @angular/cli

RUN ng set --global packageManager=yarn

#go to home folder of the app
WORKDIR /home/node/app/sample

#add current directory to app
ADD . /home/node/app

RUN cd /home/node/app/sample && yarn install

EXPOSE 8080

#serve the page
 CMD ["npm", "start", "--", "--host", "0.0.0.0", "--poll", "500"]



