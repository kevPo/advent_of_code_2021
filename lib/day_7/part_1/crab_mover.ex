defmodule AOC.Day7.Part1.CrabMover do
  def find_min_fuel_cost(input) do
    crabs =
      input
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)

    {min, max} = Enum.min_max(crabs)

    min..max
    |> Enum.map(fn i ->
      crabs |> Enum.map(fn j -> abs(i - j) end) |> Enum.sum()
    end)
    |> Enum.min()
  end
end
