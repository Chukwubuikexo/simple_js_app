FROM node:22-alpine

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

RUN mkdir -p /home/xo/Documents/simple_js_app

COPY ./simple_js_app /home/xo/Documents/simple_js_app

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/xo/Documents/simple_js_app

# will execute npm install in home/xo/Documents/simple_js_app because of WORKDIR
RUN npm install

# no need for /home/xo/Documents/simple_js_app/server.js because of WORKDIR
CMD ["node", "server.js"]

