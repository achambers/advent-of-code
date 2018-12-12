defmodule NoMatterHowYouSliceIt do
  def run(input) do
    claims = to_claims(input, [])

    claim = _run(claims, claims)

    claim[:id]
  end

  def _run([], claims) do
    Enum.find(claims, fn(claim) -> !claim[:overlapped] end)
  end
  def _run([head | tail], all) do
    IO.puts head[:id]
    all = Enum.map(all, fn(claim) ->
      cond do
        head == claim -> claim
        overlap?(head, claim) -> Keyword.put_new(claim, :overlapped, true)
        true -> claim
      end
    end)

    _run(tail,all)
  end

  def to_claims([], claims), do: claims
  def to_claims([head | tail], claims) do
    claim = parse_claim(head)

    claims = [claim | claims]

    to_claims(tail, claims)
  end

  def overlap?(claim_1, claim_2) do
    points_1 = MapSet.new(claim_1[:points])
    points_2 = MapSet.new(claim_2[:points])

    result = MapSet.intersection(points_1, points_2)
    MapSet.size(result) > 0
  end

  def parse_claim(str) do
    regex = ~r/#(?<id>\d+)\s@\s(?<x>\d+),(?<y>\d+):\s(?<width>\d+)x(?<height>\d+)/
    matches = Regex.named_captures(regex, str)

    claim = for {k, v} <- matches, into: [], do: {String.to_atom(k), String.to_integer(v)}
    points = _determine_points(claim, claim[:width] - 1, claim[:height] - 1)
    claim = Keyword.put(claim, :points, points)
    claim
  end

  defp _determine_points(claim, width, height, points \\ [])
  defp _determine_points(claim, width, -1, points) do
    _determine_points(claim, width - 1, claim[:height] - 1, points)
  end
  defp _determine_points(_claim, -1, _height, points), do: points
  defp _determine_points(claim, width, height, points) do
    point = [x: claim[:x] + width, y: claim[:y] + height]

    points = [point | points]

    _determine_points(claim, width, height - 1, points)
  end
end
