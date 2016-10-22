FROM node:6.6
RUN npm install -g elm

WORKDIR /build

COPY elm-package.json .
COPY Main.elm .

RUN elm make Main.elm --output /static/index.html --yes
