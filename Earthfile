all:
    BUILD +all-test
    BUILD +npm

all-test:
    BUILD --build-arg ELIXIR=1.9.4 --build-arg OTP=21.3.8.24 +test
    BUILD --build-arg ELIXIR=1.12.1 --build-arg OTP=24.0.2 --build-arg RUN_INSTALLER_TESTS=1 +test

test:
    FROM +test-setup

    RUN apk add --no-progress --update docker docker-compose

    # Install tooling needed to check if the DBs are actually up when performing integration tests
    RUN apk add postgresql-client

    COPY /docker-compose.yml ./docker-compose.yml

    RUN MIX_ENV=test mix deps.compile
    COPY --dir assets config lib priv test ./

    WITH DOCKER
        # Start docker compose
        # In parallel start compiling tests
        # Check for DB to be up x 3
        # Run the database tests
        RUN docker-compose up -d & \
            MIX_ENV=test mix deps.compile && \
            while ! pg_isready --host=localhost --port=5432 --quiet; do sleep 1; done; \
            mix test --include database
    END

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
   RUN mix local.rebar --force
   RUN mix local.hex --force
   RUN mix deps.get
