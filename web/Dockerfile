FROM node:6.6
RUN npm install -g elm


COPY elm-package.json .
COPY Main.elm .
CMD elm reactor -a 0.0.0.0

EXPOSE 8000
