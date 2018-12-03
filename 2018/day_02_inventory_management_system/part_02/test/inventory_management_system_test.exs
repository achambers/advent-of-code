defmodule InventoryManagementSystemTest do
  use ExUnit.Case
  doctest InventoryManagementSystem

  test "examples" do
    input = [
      "abcde",
      "fghij",
      "klmno",
      "pqrst",
      "fguij",
      "axcye",
      "wvxyz"
    ]

    assert InventoryManagementSystem.run(input) == "fgij"
  end

  test "part 2" do
    {:ok, body} = File.read("input.txt")
    input = String.split(body, "\n")

    assert InventoryManagementSystem.run(input) == "lnfqdscwjyteorambzuchrgpx"
  end
end
