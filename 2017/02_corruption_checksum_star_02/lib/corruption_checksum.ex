defmodule CorruptionChecksum do
  def checksum(input) do
    input |> String.split("\n", trim: true)
          |> Enum.map(&String.trim/1)
          |> Enum.map(&handle/1)
          |> Enum.sum()
          |> Integer.to_string()
  end

  defp handle(item) do
    item = item |> String.split(" ", trim: true)
         |> Enum.map(&String.to_integer/1)
         |> Enum.sort(&(&1>&2))
         |> divide()

    item
  end

  defp divide([head | tail]) do
    result = _result(head, tail)
    case result do
      nil -> divide(tail)
      _ -> result
    end
  end

  defp _result(_, []), do: nil
  defp _result(numerator, [denominator | tail]) do
    case rem(numerator, denominator) do
      0 -> div(numerator, denominator)
      _ -> _result(numerator, tail)
    end
  end
end
