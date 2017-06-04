use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :badger, Badger.Endpoint,
  secret_key_base: "h/sMf1AcYdxEOvPEvx4I4DzZE1f/b1Q9D9N6xoiv/N5UqgDtm9ER69fOXvjvvK87"

# Configure your database
config :badger, Badger.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "badger_prod",
  pool_size: 20
