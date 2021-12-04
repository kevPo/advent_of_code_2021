defmodule AOC.Day1.Part2.SonarSweep do
  def measure_sliding_window_increases(input) do
    input
    |> String.split(["\n"], trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.chunk_every(3, 1, :discard)
    |> Enum.map(&Enum.sum/1)
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.count(fn [x, y] -> x < y end)
  end
end
