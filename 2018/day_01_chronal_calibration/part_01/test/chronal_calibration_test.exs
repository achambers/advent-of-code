defmodule ChronalCalibrationTest do
  use ExUnit.Case
  doctest ChronalCalibration

  test "examples" do
    assert ChronalCalibration.run(["+1", "-2", "+3", "+1"]) == 3
    assert ChronalCalibration.run(["+1", "+1", "+1"]) == 3
    assert ChronalCalibration.run(["+1", "+1", "-2"]) == 0
    assert ChronalCalibration.run(["-1", "-2", "-3"]) == -6
  end

  test "part 1" do
    {:ok, body} = File.read("input.txt")
    values = String.split(body, "\n")

    assert ChronalCalibration.run(values) == 470
  end
end
