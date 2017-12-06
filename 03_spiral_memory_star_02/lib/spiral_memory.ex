defmodule SpiralMemory do
  require Integer

  def traverse(input) do
    coords = %{x: 0, y: 0}
    bag = %{coords => 1}
    _right(coords, 1, input, bag)
  end

  def get_neighbours(%{:x => x, :y => y}) do
    [
      %{x: x, y: y + 1},
      %{x: x, y: y - 1},

      %{x: x + 1, y: y + 1},
      %{x: x + 1, y: y},
      %{x: x + 1, y: y - 1},

      %{x: x - 1, y: y + 1},
      %{x: x - 1, y: y},
      %{x: x - 1, y: y - 1}
    ]
  end

  def get_next_value(coords, bag) do
    get_neighbours(coords)
      |> Enum.filter(fn(key) -> Map.has_key?(bag, key) end)
      |> Enum.map(fn(key) -> bag[key] end)
      |> Enum.sum()
  end

  defp _right(coords = %{:x => x}, max, input, bag) when x == max, do: _up(coords, max, input, bag)
  defp _right(coords, max, input, bag) do
    coords = %{x: coords[:x] + 1, y: coords[:y]}
    value = get_next_value(coords, bag)

    case value > input do
      true -> value
      false -> 
        bag = Map.put(bag, coords, value)
        _right(coords, max, input, bag)
    end
  end

  defp _up(coords = %{:y => y}, max, input, bag) when y == max, do: _left(coords, max * -1, input, bag)
  defp _up(coords, max, input, bag) do
    coords = %{x: coords[:x], y: coords[:y] + 1}
    value = get_next_value(coords, bag)

    case value > input do
      true -> value
      false -> 
        bag = Map.put(bag, coords, value)
        _up(coords, max, input, bag)
    end
  end

  defp _left(coords = %{:x => x}, max, input, bag) when x == max, do: _down(coords, max, input, bag)
  defp _left(coords, max, input, bag) do
    coords = %{x: coords[:x] - 1, y: coords[:y]}
    value = get_next_value(coords, bag)

    case value > input do
      true -> value
      false -> 
        bag = Map.put(bag, coords, value)
        _left(coords, max, input, bag)
    end
  end

  defp _down(coords = %{:y => y}, max, input, bag) when y == max, do: _right(coords, (max * -1) + 1, input, bag)
  defp _down(coords, max, input, bag) do
    coords = %{x: coords[:x], y: coords[:y] - 1}
    value = get_next_value(coords, bag)

    case value > input do
      true -> value
      false -> 
        bag = Map.put(bag, coords, value)
        _down(coords, max, input, bag)
    end
  end
end
