defmodule InventoryManagementSystemTest do
  use ExUnit.Case
  doctest InventoryManagementSystem

  test "count_occurances" do
    assert InventoryManagementSystem.count_occurances("abcdef") == %{"a" => 1, "b" => 1, "c" => 1, "d" => 1, "e" => 1, "f" => 1}
    assert InventoryManagementSystem.count_occurances("bababc") == %{"a" => 2, "b" => 3, "c" => 1}
    assert InventoryManagementSystem.count_occurances("abbcde") == %{"a" => 1, "b" => 2, "c" => 1, "d" => 1, "e" => 1}
  end

  test "examples" do
    input = [
      "abcdef",
      "bababc",
      "abbcde",
      "abcccd",
      "aabcdd",
      "abcdee",
      "ababab"
    ]

    assert InventoryManagementSystem.run(input) == 12
  end

  test "part 1" do
    {:ok, body} = File.read("input.txt")
    input = String.split(body, "\n")

    assert InventoryManagementSystem.run(input) == 7936
  end
end
