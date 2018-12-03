defmodule InventoryManagementSystem do
  def run(input) do
    _run(input, input)
  end

  defp _run([first, second | tail], initial_input) do
    first_parts = String.graphemes(first)
    second_parts = String.graphemes(second)

    result = List.myers_difference(first_parts, second_parts)
    keys = Keyword.keys(result)

    num_ins = Enum.count(keys, fn(key) -> key == :ins end)
    num_del = Enum.count(keys, fn(key) -> key == :del end)

    case (num_ins == 1) &&
         (num_del == 1) &&
         Enum.count(result[:ins]) == 1 &&
         Enum.count(result[:del]) == 1 do
           true -> List.delete(first_parts, List.first(result[:del])) |> Enum.join
      false -> _run([first | tail], initial_input)
    end
  end
  defp _run([_last], [head | tail]) do
    _run(tail, tail)
  end
end
