defmodule MemoryReallocationTest do
  use ExUnit.Case
  doctest MemoryReallocation

  test "redistribute" do
    assert MemoryReallocation.redistribute([0, 2, 7, 0], 2) == [2, 4, 1, 2]
    assert MemoryReallocation.redistribute([2, 4, 1, 2], 1) == [3, 1, 2, 3]
    assert MemoryReallocation.redistribute([3, 1, 2, 3], 0) == [0, 2, 3, 4]
    assert MemoryReallocation.redistribute([0, 2, 3, 4], 3) == [1, 3, 4, 1]
    assert MemoryReallocation.redistribute([1, 3, 4, 1], 2) == [2, 4, 1, 2]
  end

  test "example" do
    assert MemoryReallocation.perform([0, 2, 7, 0]) == 5
  end

  test "answer" do
    input = [2, 8, 8, 5, 4, 2, 3, 1, 5, 5, 1, 2, 15, 13, 5, 14]
    result = MemoryReallocation.perform(input)

    IO.puts "ANSWER: #{result}"

    assert result == 3156
  end
end
