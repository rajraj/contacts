use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :contacts, Contacts.Endpoint,
  secret_key_base: System.get_env("SESSION_SECRET")

config :contacts, :database,
  url: System.get_env("DATABASE_URL")

# Configure your database
# config :contacts, Contacts.Repo,
#   adapter: Ecto.Adapters.Postgres,
#   username: "postgres",
#   password: "postgres",
#   database: "contacts_prod",
#   size: 20 # The amount of database connections in the pool
