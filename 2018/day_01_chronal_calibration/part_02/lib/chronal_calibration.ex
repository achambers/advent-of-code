defmodule ChronalCalibration do
  def run(values) do
    values = Enum.map(values, &String.to_integer/1)

    calculate(values, values, 0, [0])
  end

  defp calculate(initial_list, [], total, seen) do
    calculate(initial_list, initial_list, total, seen)
  end
  defp calculate(initial_list, [head | tail], total, seen) do
    total = total + head

    case Enum.member?(seen, total) do
      true -> total
      false ->
        seen = [total | seen]
        calculate(initial_list, tail, total, seen)
    end
  end
end
