use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :contacts, Contacts.Endpoint,
  secret_key_base: "kYFN3wfl4rDe5ulf7r/RecTfbPscu9EuLYuzvC3OpBc/pIeGK4o5UErf5XUI9Zaz"

# Configure your database
config :contacts, Contacts.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "contacts_prod",
  size: 20 # The amount of database connections in the pool