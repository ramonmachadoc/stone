defmodule StoneApi.Repo do
  use Ecto.Repo,
    otp_app: :stone_api,
    adapter: Ecto.Adapters.Postgres
end
