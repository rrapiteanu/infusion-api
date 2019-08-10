use Mix.Config

# Do not print debug messages in production
config :logger, level: :info

config :infusion, InfusionWeb.Endpoint,
  http: [port: System.get_env("PORT")],
  url: [host: System.get_env("APP_NAME") <> ".gigalixirapp.com", port: 80],
  secret_key_base: Map.fetch!(System.get_env(), "SECRET_KEY_BASE"),
  server: true,
  check_origin: ["https://infusion-demo.herokuapp.com"]

config :infusion, Infusion.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  database: "",
  ssl: true,
  pool_size: 2

config :infusion, Infusion.Scheduler,
  timezone: "Romania/Bucharest",
  jobs: [
    {"@weekly", {Infusion.DemoManager, :reset_and_seed_database!, []}}
  ]
