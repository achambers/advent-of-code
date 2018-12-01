defmodule ChronalCalibrationTest do
  use ExUnit.Case
  doctest ChronalCalibration

  test "examples" do
    assert ChronalCalibration.run(["+1", "-1"]) == 0
    assert ChronalCalibration.run(["+3", "+3", "+4", "-2", "-4"]) == 10
    assert ChronalCalibration.run(["-6", "+3", "+8", "+5", "-6"]) == 5
    assert ChronalCalibration.run(["+7", "+7", "-2", "-7", "-4"]) == 14
  end

  test "part 2" do
    {:ok, body} = File.read("input.txt")
    values = String.split(body, "\n")

    assert ChronalCalibration.run(values) == 790
  end
end
