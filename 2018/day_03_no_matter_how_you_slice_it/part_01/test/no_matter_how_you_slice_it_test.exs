defmodule NoMatterHowYouSliceItTest do
  use ExUnit.Case
  doctest NoMatterHowYouSliceIt

  test "examples" do
    input = [
      "#1 @ 1,3: 4x4",
      "#2 @ 3,1: 4x4",
      "#3 @ 5,5: 2x2"
    ]

    assert NoMatterHowYouSliceIt.run(input, %{}) == 4
  end

  test "part 1" do
    {:ok, body} = File.read("input.txt")
    input = String.split(body, "\n")

    assert NoMatterHowYouSliceIt.run(input, %{}) == 115242
  end
end
