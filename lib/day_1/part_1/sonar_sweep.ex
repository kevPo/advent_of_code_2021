defmodule AOC.Day1.Part1.SonarSweep do
  def measure_depth_increases(input) do
    input
    |> String.split(["\n"], trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.count(fn [x, y] -> x < y end)
  end
end
