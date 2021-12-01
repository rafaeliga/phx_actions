defmodule PhxActions do
  def test_action do
    String.codepoints("1") |> IO.inspect()
  end
end

defmodule PhxActionsNew do
  def test_action_new do
    IO.inspect("123")
  end
end
