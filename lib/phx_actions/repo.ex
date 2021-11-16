defmodule PhxActions.Repo do
  use Ecto.Repo,
    otp_app: :phx_actions,
    adapter: Ecto.Adapters.Postgres
end
