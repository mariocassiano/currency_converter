# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :currency_converter,
  ecto_repos: [CurrencyConverter.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configure your database
config :currency_converter, CurrencyConverter.Repo,
  # database: Path.expand("../database/currency_converter_dev.db", __DIR__),
  database: Path.expand(File.cwd!() <> "/database/currency_converter_dev.db"),
  pool_size: 5,
  stacktrace: true,
  show_sensitive_data_on_connection_error: true

# Configures the endpoint
config :currency_converter, CurrencyConverterWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: CurrencyConverterWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: CurrencyConverter.PubSub,
  live_view: [signing_salt: "DNIN7pEy"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
