defmodule SpiralMemory do
  require Integer

  def traverse(max_steps) do
    coords = %{x: 0, y: 0}
    _right(coords, 1, max_steps - 1, 0)
  end

  defp _right(coords, _, max_steps, step_count) when max_steps == step_count, do: coords
  defp _right(coords = %{:x => x}, max, max_steps, step_count) when x == max, do: _up(coords, max, max_steps, step_count)
  defp _right(coords, max, max_steps, step_count) do
    coords = %{x: coords[:x] + 1, y: coords[:y]}
    _right(coords, max, max_steps, step_count + 1)
  end

  defp _up(coords, _, max_steps, step_count) when max_steps == step_count, do: coords
  defp _up(coords = %{:y => y}, max, max_steps, step_count) when y == max, do: _left(coords, max * -1, max_steps, step_count)
  defp _up(coords, max, max_steps, step_count) do
    coords = %{x: coords[:x], y: coords[:y] + 1}
    _up(coords, max, max_steps, step_count + 1)
  end

  defp _left(coords, _, max_steps, step_count) when max_steps == step_count, do: coords
  defp _left(coords = %{:x => x}, max, max_steps, step_count) when x == max, do: _down(coords, max, max_steps, step_count)
  defp _left(coords, max, max_steps, step_count) do
    coords = %{x: coords[:x] - 1, y: coords[:y]}
    _left(coords, max, max_steps, step_count + 1)
  end

  defp _down(coords, _, max_steps, step_count) when max_steps == step_count, do: coords
  defp _down(coords = %{:y => y}, max, max_steps, step_count) when y == max, do: _right(coords, (max * -1) + 1, max_steps, step_count)
  defp _down(coords, max, max_steps, step_count) do
    coords = %{x: coords[:x], y: coords[:y] - 1}
    _down(coords, max, max_steps, step_count + 1)
  end

  def calculate_steps(input) do
    start_position = traverse(input)
    end_position = %{x: 0, y: 0}

    distance_between_coordinates(start_position, end_position)
  end

  def distance_between_coordinates(start_position, end_position) do
    x = end_position[:x] - start_position[:x]
    x = :math.sqrt(x * x) |>  round

    y = end_position[:y] - start_position[:y]
    y = :math.sqrt(y * y) |> round

    x + y
  end
end
