defmodule CorruptionChecksum do
  def checksum(input) do
    input |> String.split("\n", trim: true)
          |> Enum.map(&String.trim/1)
          |> Enum.map(&extract/1)
          |> Enum.sum()
          |> Integer.to_string()
  end

  defp extract(item) do
    item |> String.split(" ", trim: true)
         |> Enum.map(&String.to_integer/1)
         |> Enum.min_max()
         |> (fn({min, max}) -> max - min end).()
  end
end
