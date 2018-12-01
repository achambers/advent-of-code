defmodule ChronalCalibration do
  def run(values) do
    Enum.map(values, &String.to_integer/1)
    |> Enum.reduce(&(&1 + &2))
  end
end
