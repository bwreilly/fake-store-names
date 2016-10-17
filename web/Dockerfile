FROM node:6.6
RUN npm install -g elm

WORKDIR /static

COPY elm-package.json .
COPY Main.elm .

RUN elm make Main.elm --output main.html --yes
