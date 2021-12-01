defmodule PhxActions do
  @moduledoc """
  PhxActions keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def test_action_new do
    String.codepoints("xxxx") |> IO.inspect()
  end

  def test_action_reviewdob do
    String.codepoints("OK") |> IO.inspect()
  end
end
