defmodule AMazeOfTwistyTrampolines do
  def count_steps(input) do
    input |> String.trim("\n")
      |> String.split("\n")
      |> Enum.map(&String.to_integer/1)
      |> _traverse(0)
  end

  defp _traverse(list, index, steps \\ 0) do
    #IO.puts "#{inspect(list)} #{index}"
    IO.puts "#{index}, #{steps}"
    case index >= Enum.count(list) do
      true -> steps
      false ->
        offset = Enum.at(list, index)
        new_offset = case offset >= 3 do
          true -> offset - 1
          false -> offset + 1
        end
        list = List.replace_at(list, index, new_offset)
        _traverse(list, index + offset, steps + 1)
    end
  end
end
