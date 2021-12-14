defmodule AOC.Day9.Part1.SmokeBasin do
  def sum_risk_levels(input) do
    lines = String.split(input, "\n", trim: true)

    grid =
      for {line, row} <- Enum.with_index(lines),
          {number, col} <- Enum.with_index(String.to_charlist(line)),
          into: %{} do
        {{row, col}, number - ?0}
      end

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
    |> Enum.map(fn {_, number} -> number + 1 end)
    |> Enum.sum()
  end
end
