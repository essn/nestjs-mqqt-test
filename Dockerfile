FROM node:16

RUN curl -f https://get.pnpm.io/v6.14.js | node - add --global pnpm

COPY ./package.json ./
COPY ./.npmrc ./
COPY ./pnpm-lock.yaml ./

RUN pnpm install

# Bundle app source

COPY . .

RUN pnpm prebuild
RUN pnpm build

CMD [ "pnpm", "start" ]

