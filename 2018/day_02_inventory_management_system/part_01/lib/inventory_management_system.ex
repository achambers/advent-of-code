defmodule InventoryManagementSystem do
  def run(input) do
    [two_count, three_count] = Enum.map(input, &count_occurances/1)
    |> Enum.map(fn(a) ->
      has_two = Map.values(a) |> Enum.member?(2)
      has_three = Map.values(a) |> Enum.member?(3)

      [has_two, has_three]
    end)
    |> Enum.reduce([0, 0], fn([has_two, has_three], acc) ->
      acc = case has_two do
        true -> List.update_at(acc, 0, &(&1 + 1))
        false -> acc
      end

      case has_three do
        true -> List.update_at(acc, 1, &(&1 + 1))
        false -> acc
      end
    end)

    two_count * three_count
  end

  def count_occurances(string) do
    parts = String.graphemes(string)

    Enum.reduce(parts, %{}, fn(letter, acc) ->
      Map.update(acc, letter, 1, &(&1 + 1))
    end)
  end
end
