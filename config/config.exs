# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phx_actions,
  ecto_repos: [PhxActions.Repo]

# Configures the endpoint
config :phx_actions, PhxActionsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0vk4SVQuQiZYte6fKsUPwxZOnrqThNgFiwXCG18IyzIXpd9n0phXjwlsqEsoYGKS",
  render_errors: [view: PhxActionsWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PhxActions.PubSub,
  live_view: [signing_salt: "Xu8c+aG4"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
