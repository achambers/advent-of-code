defmodule InverseCaptcha do
  def resolve(input) do
    input = _split(input)
    _resolve(input, 1)
  end

  defp _split(input) do
    input |> Integer.to_string()
          |> String.graphemes()
          |> Enum.map(&String.to_integer/1)
  end

  defp _resolve(arr, _, left_index, result) when length(arr) == left_index, do: result
  defp _resolve(arr, offset, left_index, result)  do
    length = length(arr)
    right_index = left_index + offset

    right_index = case (right_index < length) do
      true -> right_index
      false -> right_index - length
    end

    left = Enum.at(arr, left_index)
    right = Enum.at(arr, right_index)

    case left do
      ^right -> _resolve(arr, offset, left_index + 1, result + left)
      _ -> _resolve(arr, offset, left_index + 1, result)
    end
  end
  defp _resolve(arr, offset), do: _resolve(arr, offset, 0, 0)
end
