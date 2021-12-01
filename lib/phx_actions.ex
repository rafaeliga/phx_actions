defmodule PhxActions do
  @moduledoc """
  PhxActions keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def test_action44 do
    String.codepoints("cccc") |> IO.inspect()
  end

  def test_action_other do
    String.codepoints("other") |> IO.inspect()
  end
end
