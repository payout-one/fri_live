# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :fri_live, FriLiveWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "L4+NiphGk9CWIUzz0aZFYRY4sPDbkijijo3j6qZM6vW0yDAfpgeTMF6W4B8qg91i",
  render_errors: [view: FriLiveWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: FriLive.PubSub,
  live_view: [signing_salt: "bF4Qye8H"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
