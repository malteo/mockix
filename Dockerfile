FROM elixir:1.16 AS build

WORKDIR /src

COPY . .

RUN mix deps.get --only prod
RUN mix do clean, compile --force

ENV MIX_ENV=prod
RUN mix release --overwrite

FROM elixir:1.16-slim
WORKDIR /app
COPY --from=build /src/_build/prod/rel/mockix .
EXPOSE 4001
ENTRYPOINT ["bin/mockix", "start"]