defmodule MemoryReallocation do
  def redistribute(list, index) do
    count = Enum.at(list, index)
    list = List.replace_at(list, index, 0)

    distribute_next(list, index, count)
  end

  def perform(input) do
    steps(input)
  end

  defp steps(list, bag \\ %{}, step_count \\ 0) do
    max = Enum.max(list)
    index = Enum.find_index(list, fn(item) -> item == max end)

    result = redistribute(list, index)
    fingerprint = _fingerprint(result)

    step_count = step_count + 1

    case Map.has_key?(bag, fingerprint) do
      true -> step_count
      false ->
        bag = Map.put(bag, fingerprint, true)
        steps(result, bag, step_count)
    end
  end

  defp _fingerprint(list) do
    list |>  Enum.join("")
  end

  def distribute_next(list, _, count) when count == 0, do: list
  def distribute_next(list, index, count) do
    limit = Enum.count(list) - 1

    index = case index do
      x when x >= limit -> 0
      x -> x + 1
    end

    val = Enum.at(list, index)
    list = List.replace_at(list, index, val + 1)
    distribute_next(list, index, count - 1)
  end

  #def perform(input) do
    #_perform(input)
  #end

  #defp _perform(banks, bag \\ %{}, count \\ 0) do
    #case bag[banks] do
      #true -> count
      #_ ->
        #bag = Map.put(bag, banks, true)

        #block_count = banks |> Enum.max()
        #index = Enum.find_index(banks, fn(num) -> num == block_count end)
        #banks = List.replace_at(banks, index, 0)

        ##_distribute(banks, bag, block_count, 0, count)
    #end
  #end

  #def distribute(banks, blocks) do
    #result = Enum.reduce(banks, %{banks: [], blocks: blocks}, fn(bank, acc = %{:banks => banks, :blocks => blocks}) ->
      #case blocks > 0 do
        #true -> %{banks: banks ++ [bank + 1], blocks: blocks - 1}
        #false -> %{banks: banks ++ [bank], blocks: blocks}
      #end
    #end)

    #case result[:blocks] > 0 do
      #true -> distribute(result[:banks], result[:blocks])
      #false -> result[:banks]
    #end
    ##Enum.map(banks, fn(bank) ->
      ##bank + 1
      ##case blocks > 0 do
        ##true -> blocks = blocks - 1; bank + 1
        ##false -> bank

      ##end
    ##end)

    ##case blocks > 0 do
      ##true -> distribute(banks, blocks)
      ##false -> banks
    ##end
  #end

  #defp _distribute(banks, bag, block_count, count) when block_count == 0, do: _perform(banks, bag, count)
  #defp _distribute(banks, bag, block_count, index, count) do
    #case index + 1 > Enum.count(banks) do
      #true -> _distribute(banks, bag, block_count, 0, count)
      #false ->
        #IO.puts "#{inspect(banks)} #{block_count} #{index} #{count}"
        #banks = List.replace_at(banks, index, Enum.fetch!(banks, index) + 1)
          #|> _distribute(bag, block_count - 1, index + 1, count + 1)
        ##IO.puts "#{inspect(banks)} #{block_count}"
    #end
  #end
end
