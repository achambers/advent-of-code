defmodule HighEntropyPassphrases do
  def valid?(input) do
    parts = input |> String.split(" ")
      |> Enum.map(&fingerprint/1)

    uniq_parts = Enum.uniq(parts)

    Enum.count(parts) == Enum.count(uniq_parts)
  end

  def fingerprint(input) do
    input
      |> String.downcase
      |> String.to_charlist
      |> Enum.sort
      |> Enum.join("")
  end

  def count_valid(input) do
    input |> String.trim("\n")
          |> String.split("\n")
          |> Enum.filter(fn(item) -> valid?(item) end)
          |> Enum.count()
  end
end
