defmodule AMazeOfTwistyTrampolines do
  def count_steps(input) do
    input |> String.trim("\n")
      |> String.split("\n")
      |> Enum.map(&String.to_integer/1)
      |> _traverse(0)
  end

  defp _traverse(list, index, steps \\ 0) do
    case index == Enum.count(list) do
      true -> steps
      false ->
        jump = Enum.at(list, index)
        list = List.replace_at(list, index, jump + 1)
        _traverse(list, index + jump, steps + 1)
    end
  end
end
