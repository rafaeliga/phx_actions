# PhxActions

# new fewfewfw

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

# local docker

USE_SSL=false RDS_HOSTNAME=localhost RDS_PASSWORD=postgres RDS_USERNAME=postgres RDS_DB_NAME=phx_actions_dev ENDPOINT_HOST=localhost SECRET_KEY_BASE=itLJ8lMKQjAcnIOkWBsfPa3q5CtjeEV2tjC4C1tjrt4OKtGffehKMqpy8J0NcBfx  _build/hom/rel/phx_actions/bin/phx_actions start
