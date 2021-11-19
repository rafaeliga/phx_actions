# In this file, we load production configuration and secrets
# from environment variables. You can also hardcode secrets,
# although such is generally not recommended and you have to
# remember to add this file to your .gitignore.
import Config

# Utility to improve deploy transparency
get_env! = &(System.get_env(&1) || raise "environment variable #{&1} is missing.")

# ## Endpoint variables
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start each relevant endpoint:
#
endpoint_host = get_env!.("ENDPOINT_HOST")
secret_key_base = get_env!.("SECRET_KEY_BASE")

# ## Database variables
#
# We have to guarantee that each of these variables are present
# in the running instance. For Docker, we need to load all variables
# into Elasticbeanstalk's configuration.
#
rds_db_name = get_env!.("RDS_DB_NAME")
rds_db_username = get_env!.("RDS_USERNAME")
rds_db_password = get_env!.("RDS_PASSWORD")
rds_db_hostname = get_env!.("RDS_HOSTNAME")

#
# Endpoint configuration
#
config :phx_actions, PhxActionsWeb.Endpoint,
  http: [port: 5555],
  url: [host: endpoint_host],
  server: true,
  secret_key_base: secret_key_base

#
# Database configuration
#
config :phx_actions, PhxActions.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: rds_db_name,
  username: rds_db_username,
  password: rds_db_password,
  hostname: rds_db_hostname,
  port: System.get_env("RDS_PORT", "5432"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE", "20")),
  ssl: String.to_existing_atom(get_env!.("USE_SSL")),
  start_apps_before_migration: [:ssl],
  show_sensitive_data_on_connection_error: true
