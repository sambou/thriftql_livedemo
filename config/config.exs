# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :livedemo,
  ecto_repos: [Livedemo.Repo]

# Configures the endpoint
config :livedemo, LivedemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ex2ZurovOv7ZgFBPA/oDdO1VEagqa3Jv4AXL/b8Wv8kFEU4XZpOu+mPU9U3pSs1Q",
  render_errors: [view: LivedemoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Livedemo.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :livedemo, LivedemoWeb.Endpoint,
   live_view: [
     signing_salt: "SECRET_SALT"
   ]

config :phoenix,
  template_engines: [leex: Phoenix.LiveView.Engine]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
