defmodule AOC.Day5.Part1.LineCount do
  def count(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn x ->
      x
      |> String.split([",", " -> "], trim: true)
      |> Enum.map(&String.to_integer/1)
    end)
    |> Enum.reduce(%{}, fn
      [x, y1, x, y2], grid ->
        Enum.reduce(y1..y2, grid, fn y, grid ->
          Map.update(grid, {x, y}, 1, &(&1 + 1))
        end)

      [x1, y, x2, y], grid ->
        Enum.reduce(x1..x2, grid, fn x, grid ->
          Map.update(grid, {x, y}, 1, &(&1 + 1))
        end)

      _, grid ->
        grid
    end)
    |> Enum.count(fn {_, v} -> v > 1 end)
  end
end
