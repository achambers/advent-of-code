defmodule SpiralMemoryTest do
  use ExUnit.Case
  doctest SpiralMemory

  test "traverse" do
    assert SpiralMemory.traverse(25) == %{x: 2, y: -2}
  end

  test "calculate_steps" do
    assert SpiralMemory.calculate_steps(1) == 0
    assert SpiralMemory.calculate_steps(12) == 3
    assert SpiralMemory.calculate_steps(23) == 2
    assert SpiralMemory.calculate_steps(1024) == 31
    assert SpiralMemory.calculate_steps(325489) == 552
  end

  test "distance_between_coordinates" do
    assert SpiralMemory.distance_between_coordinates(%{x: 0, y: 0}, %{x: 3, y: 0}) == 3
    assert SpiralMemory.distance_between_coordinates(%{x: 0, y: 0}, %{x: 3, y: 2}) == 5
    assert SpiralMemory.distance_between_coordinates(%{x: 0, y: 0}, %{x: -2, y: -2}) == 4
  end
end
