FROM node:lts-alpine
WORKDIR /app
RUN corepack enable
RUN corepack prepare pnpm@latest --activate
COPY .npmrc package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
