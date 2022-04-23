# FROM node:16-alpine

# ENV NODE_ENV production

# ## Install pnpm
# RUN apk add --no-cache curl \
#   && curl -sL https://unpkg.com/@pnpm/self-installer | node

# USER node

# WORKDIR /home/node

# COPY --chown=node:node . .

# RUN pnpm install

# RUN pnpm prebuild
# RUN pnpm build

# CMD ["npnm", "start:prod"]


FROM node:14
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

