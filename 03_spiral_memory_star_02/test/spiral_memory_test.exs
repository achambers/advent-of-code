defmodule SpiralMemoryTest do
  use ExUnit.Case
  doctest SpiralMemory

  test "traverse" do
    assert SpiralMemory.traverse(325489) == 330785
  end
end
