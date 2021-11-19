FROM bitwalker/alpine-elixir:1.12.2

ARG ENVIRONMENT

EXPOSE 5555

ENV PORT=5555
ENV MIX_ENV=$ENVIRONMENT

COPY priv/setup/docker/run.sh .
COPY _build/$ENVIRONMENT/rel/phx_actions /opt/app/phx_actions

RUN chown -R default: /opt/app

RUN apk add postgresql-client

USER default

CMD sh ./run.sh
