use Mix.Config

# Do not print debug messages in production
config :logger, level: :info

config :infusion, InfusionWeb.Endpoint,
  url: [host: System.get_env("RENDER_EXTERNAL_HOSTNAME") || "localhost", port: 80]
