defmodule NoMatterHowYouSliceItTest do
  use ExUnit.Case

  test "examples" do
    input = [
      "#1 @ 1,3: 4x4",
      "#2 @ 3,1: 4x4",
      "#3 @ 5,5: 2x2"
    ]

    assert NoMatterHowYouSliceIt.run(input) == 3

    input = [
      "#2 @ 3,1: 4x4",
      "#1 @ 1,3: 4x4",
      "#3 @ 5,5: 2x2"
    ]

    assert NoMatterHowYouSliceIt.run(input) == 3

    input = [
      "#2 @ 3,1: 4x4",
      "#3 @ 5,5: 2x2",
      "#1 @ 1,3: 4x4"
    ]

    assert NoMatterHowYouSliceIt.run(input) == 3

    input = [
      "#3 @ 5,5: 2x2",
      "#2 @ 3,1: 4x4",
      "#1 @ 1,3: 4x4"
    ]

    assert NoMatterHowYouSliceIt.run(input) == 3
  end

  test "overlap?" do
    claim_1 = NoMatterHowYouSliceIt.parse_claim("#1 @ 1,3: 4x4")
    claim_2 = NoMatterHowYouSliceIt.parse_claim("#2 @ 3,1: 4x4")
    claim_3 = NoMatterHowYouSliceIt.parse_claim("#3 @ 5,5: 2x2")

    assert NoMatterHowYouSliceIt.overlap?(claim_1, claim_2) == true
    assert NoMatterHowYouSliceIt.overlap?(claim_1, claim_3) == false
    assert NoMatterHowYouSliceIt.overlap?(claim_2, claim_3) == false
  end

  test "parse claim" do
    claim = NoMatterHowYouSliceIt.parse_claim("#1 @ 1,3: 4x4")
    assert claim[:points] == [
      [x: 1, y: 3],
      [x: 1, y: 4],
      [x: 1, y: 5],
      [x: 1, y: 6],
      [x: 2, y: 3],
      [x: 2, y: 4],
      [x: 2, y: 5],
      [x: 2, y: 6],
      [x: 3, y: 3],
      [x: 3, y: 4],
      [x: 3, y: 5],
      [x: 3, y: 6],
      [x: 4, y: 3],
      [x: 4, y: 4],
      [x: 4, y: 5],
      [x: 4, y: 6]
    ]

    claim = NoMatterHowYouSliceIt.parse_claim("#2 @ 3,1: 4x4")
    assert claim[:points] == [
      [x: 3, y: 1],
      [x: 3, y: 2],
      [x: 3, y: 3],
      [x: 3, y: 4],
      [x: 4, y: 1],
      [x: 4, y: 2],
      [x: 4, y: 3],
      [x: 4, y: 4],
      [x: 5, y: 1],
      [x: 5, y: 2],
      [x: 5, y: 3],
      [x: 5, y: 4],
      [x: 6, y: 1],
      [x: 6, y: 2],
      [x: 6, y: 3],
      [x: 6, y: 4]
    ]

    claim = NoMatterHowYouSliceIt.parse_claim("#3 @ 5,5: 2x2")
    assert claim[:points] == [
      [x: 5, y: 5],
      [x: 5, y: 6],
      [x: 6, y: 5],
      [x: 6, y: 6]
    ]
  end

  @tag timeout: 600000
  test "part 2" do
    {:ok, body} = File.read("input.txt")
    input = String.split(body, "\n")

    assert NoMatterHowYouSliceIt.run(input) == 1046
  end
end
