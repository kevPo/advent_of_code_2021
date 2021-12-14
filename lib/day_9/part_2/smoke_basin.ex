defmodule AOC.Day9.Part2.SmokeBasin do
  def find_large_basins(input) do
    lines = String.split(input, "\n", trim: true)

    grid =
      for {line, row} <- Enum.with_index(lines),
          {number, col} <- Enum.with_index(String.to_charlist(line)),
          into: %{} do
        {{row, col}, number - ?0}
      end

    low_points =
      grid
      |> Enum.filter(fn {{row, col}, number} ->
        above = grid[{row - 1, col}]
        below = grid[{row + 1, col}]
        to_the_right = grid[{row, col + 1}]
        to_the_left = grid[{row, col - 1}]

        number < above and
          number < below and
          number < to_the_right and
          number < to_the_left
      end)

    low_points
    |> Enum.map(fn {point, _number} -> find(point, grid) |> MapSet.size() end)
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.product()
  end

  defp find(point, grid) do
    find(MapSet.new(), point, grid)
  end

  defp find(set, {row, col} = point, grid) do
    if point in set or grid[point] in [9, nil] do
      set
    else
      set
      |> MapSet.put(point)
      |> find({row - 1, col}, grid)
      |> find({row + 1, col}, grid)
      |> find({row, col + 1}, grid)
      |> find({row, col - 1}, grid)
    end
  end
end
