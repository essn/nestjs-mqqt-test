FROM node:16

RUN curl -f https://get.pnpm.io/v6.14.js | node - add --global pnpm

# pnpm fetch does require only lockfile
COPY ./pnpm-lock.yaml ./

RUN pnpm fetch

ADD . ./

RUN pnpm install --prod

# Bundle app source

COPY . .

RUN pnpm prebuild
RUN pnpm build

CMD [ "pnpm", "start" ]

