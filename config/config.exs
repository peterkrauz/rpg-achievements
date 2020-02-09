# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :rpg_achievements,
  ecto_repos: [RpgAchievements.Repo]

# Configures the endpoint
config :rpg_achievements, RpgAchievementsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WKRv8J6eeUrtIhdRBG+j6H2IusJwDjuba5oE9uGTLfgGt60aIPm6030f+uXHoHHL",
  render_errors: [view: RpgAchievementsWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: RpgAchievements.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix and Ecto
config :phoenix, :json_library, Jason
config :ecto, :json_library, Jason


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
