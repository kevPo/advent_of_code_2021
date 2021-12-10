defmodule AOC.Day7.Part2.CrabMover do
  def find_min_fuel_cost(input) do
    crabs =
      input
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)

    {min, max} = Enum.min_max(crabs)

    min..max
    |> Enum.map(fn i ->
      crabs
      |> Enum.map(fn j ->
        x = abs(i - j)
        x * (x + 1) / 2
      end)
      |> Enum.sum()
    end)
    |> Enum.min()
    |> round()
  end
end
