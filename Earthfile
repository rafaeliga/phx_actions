all:
    BUILD +all-test
    BUILD +npm

all-test:
    BUILD --build-arg ELIXIR=1.9.4 --build-arg OTP=21.3.8.24 +test
    BUILD --build-arg ELIXIR=1.12.1 --build-arg OTP=24.0.2 --build-arg RUN_INSTALLER_TESTS=1 +test

test:
    FROM +test-setup
    RUN MIX_ENV=test mix deps.compile
    COPY --dir assets config lib priv test ./

    # Run unit tests
    RUN mix test

npm:
    FROM node:12-alpine3.12
    WORKDIR /src
    RUN mkdir assets
    # Copy package.json + lockfile separatelly to improve caching (JS changes don't trigger `npm install` anymore)
    COPY assets/package* assets
    WORKDIR assets
    RUN npm install
    COPY assets/ .
    RUN npm test

setup-base:
   ARG ELIXIR=1.12.1
   ARG OTP=24.0.2
   FROM hexpm/elixir:$ELIXIR-erlang-$OTP-alpine-3.13.3
   RUN apk add --no-progress --update git build-base
   ENV ELIXIR_ASSERT_TIMEOUT=10000
   WORKDIR /src

test-setup:
   FROM +setup-base
   COPY mix.exs .
   COPY mix.lock .
   COPY .formatter.exs .
   COPY package.json .
   RUN mix local.rebar --force
   RUN mix local.hex --force
   RUN mix deps.get
