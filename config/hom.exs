use Mix.Config

config :phx_actions, PhxActionsWeb.Endpoint, url: [port: 80]

config :phx_actions, PhxActionsWeb.Endpoint,
  cache_static_manifest: "priv/static/cache_manifest.json",
  debug_errors: true

config :logger, :console, format: "[$level] $message\n"
