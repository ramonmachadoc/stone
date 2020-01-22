import Config

config :stone_api, StoneApi.Repo,
  database: "stone_api_repo",
  username: "ramon",
  password: "ramon",
  hostname: "localhost"


config :stone_api, ecto_repos: [StoneApi.Repo]
config :stone_api, cowboy_port: 8181
config :stone_api, StoneApi.Guardian,
       issuer: "stone_api",
       secret_key: "eIkhJoIuimWZXO7x049oPcfCDYTd8JGROi5WbJO4YHIVC+l0VPIIlGmnnAPDhY7X"