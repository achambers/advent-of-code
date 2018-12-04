defmodule NoMatterHowYouSliceIt do
  def run([], points) do
    Map.values(points)
    |> Enum.count(&(&1 > 1))
  end
  def run([head | tail], points) do
    claim = _parse_claim(head)
    points = _determine_points(claim, claim[:width] - 1, claim[:height] - 1, points)
    run(tail, points)
  end

  defp _parse_claim(str) do
    regex = ~r/#(?<id>\d+)\s@\s(?<x>\d+),(?<y>\d+):\s(?<width>\d+)x(?<height>\d+)/
    matches = Regex.named_captures(regex, str)

    for {k, v} <- matches, into: [], do: {String.to_atom(k), String.to_integer(v)}
  end

  defp _determine_points(claim, width, -1, points) do
    _determine_points(claim, width - 1, claim[:height] - 1, points)
  end
  defp _determine_points(_claim, -1, _height, points) do
    points
  end
  defp _determine_points(claim, width, height, points) do
    point = [x: claim[:x] + width, y: claim[:y] + height]

    points = Map.update(points, point, 1, &(&1 + 1))

    _determine_points(claim, width, height - 1, points)
  end
end
