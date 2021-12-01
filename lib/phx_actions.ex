defmodule PhxActions do
  def test_action2 do
    String.codepoints("2") |> IO.inspect()
  end

  def test_action3 do
    String.codepoints("3") |> IO.inspect()
  end

  def test_action5 do
    "a" |> IO.inspect()
  end

  def test_action5 do
    IO.inspect "a"
  end
end
