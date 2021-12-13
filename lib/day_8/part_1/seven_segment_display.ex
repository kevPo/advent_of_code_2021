defmodule AOC.Day8.Part1.SevenSegmentDisplay do
  @simple_numbers [2, 4, 3, 7]

  def find_simple_numbers(input) do
    input
    |> String.split(["\n", "|"], trim: true)
    |> Enum.chunk_every(2)
    |> Enum.map(fn [inputs, output] ->
      {inputs |> String.split() |> Enum.group_by(&String.length/1, &String.to_charlist/1),
       output |> String.split() |> Enum.map(&String.to_charlist/1)}
    end)
    |> Enum.map(fn {_, outputs} ->
      Enum.count(outputs, fn o -> length(o) in @simple_numbers end)
    end)
    |> Enum.sum()
  end
end
