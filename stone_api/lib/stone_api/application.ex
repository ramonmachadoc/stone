defmodule StoneApi.Application do
@moduledoc """
API config implementation
"""
  use Application
  require Logger

  def start(_type, _args) do
    children = [
      StoneApi.Repo,
      {Plug.Cowboy, scheme: :http, plug: StoneApi.Router, options: [port: cowboy_port()]}
    ]

    opts = [strategy: :one_for_one, name: StoneApi.Supervisor]

    Logger.info("Starting api...")

    Supervisor.start_link(children, opts)
  end

  defp cowboy_port, do: Application.get_env(:stone_api, :cowboy_port, 8181)
end
