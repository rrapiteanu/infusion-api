use Mix.Config

# Do not print debug messages in production
config :logger, level: :info

config :infusion, InfusionWeb.Endpoint,
  url: [host: System.get_env("RENDER_EXTERNAL_HOSTNAME") || "localhost", port: 80],
  check_origin: ["https://infusion.rrapiteanu.now.sh"]

config :infusion, Infusion.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  database: "",
  ssl: true,
  pool_size: 2
