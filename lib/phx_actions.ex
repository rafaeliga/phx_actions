defmodule PhxActions do
  @moduledoc false

  def test_action do
    "3" |> String.codepoints()
  end

  def test_action_other do
    IO.inspect("OTHER")
  end
end
