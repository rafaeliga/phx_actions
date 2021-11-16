defmodule PhxActionsWeb.PageController do
  use PhxActionsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
