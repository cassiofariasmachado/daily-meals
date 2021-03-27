# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :daily_meals,
  ecto_repos: [DailyMeals.Repo]

# Configures the endpoint
config :daily_meals, DailyMealsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "AIQsyE1hFD1anaPoBXgyWO5ABta3CpqkoSSwWgqn2sojt69GXzfce/NOn5bdIUjK",
  render_errors: [view: DailyMealsWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: DailyMeals.PubSub,
  live_view: [signing_salt: "IocI4ViR"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"