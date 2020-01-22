FROM elixir

MAINTAINER Ramon Machado <ramon.carmom@gmail.com>

ENV MIX_HOME=/opt/mix

RUN apt-get update -qq && apt-get install -y apt-transport-https curl git make inotify-tools gnupg g++

RUN mkdir /stone
ADD stone_api/ /stone

WORKDIR /stone

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get
RUN mix ecto.create
RUN mix ecto.migrate
RUN mix compile

CMD mix run --no-halt
