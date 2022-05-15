import Config

config :linkly, Linkly.Repo,
  username: "postgres",
  password: "postgres",
  database: "linkly_dev",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :linkly, Linkly.Repo, log: false

config :logger, :console, format: "[$level] $message\n"
