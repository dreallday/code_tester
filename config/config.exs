# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :code_tester,
  ecto_repos: [CodeTester.Repo]

# Configures the endpoint
config :code_tester, CodeTesterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "iDcPKDHzZbjZaxwq8OY24B8EuNPGOveM/T0lf28vnYNuRQHtUNxFSpf2ONYn160E",
  render_errors: [view: CodeTesterWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CodeTester.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
