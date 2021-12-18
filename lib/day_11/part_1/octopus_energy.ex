defmodule AOC.Day11.Part1.OctopusEnergy do
  def get_number_of_flashes(input, steps) do
    lines =
      input
      |> String.split("\n", trim: true)

    grid =
      for {line, row} <- Enum.with_index(lines),
          {value, col} <- Enum.with_index(String.to_charlist(line)),
          into: %{},
          do: {{row, col}, value - ?0}

    1..steps
    |> Enum.map_reduce(grid, fn _, grid ->
      {grid, flashes} = step(grid)
      {flashes, grid}
    end)
    |> elem(0)
    |> Enum.sum()
  end

  defp step(grid) do
    step(Map.keys(grid), grid, MapSet.new())
  end

  defp step([{row, col} = key | keys], grid, flashes) do
    value = grid[key]

    cond do
      is_nil(value) or key in flashes ->
        step(keys, grid, flashes)

      grid[key] >= 9 ->
        keys = [
          {row - 1, col - 1},
          {row - 1, col},
          {row - 1, col + 1},
          {row, col - 1},
          {row, col + 1},
          {row + 1, col - 1},
          {row + 1, col},
          {row + 1, col + 1}
          | keys
        ]

        step(keys, Map.put(grid, key, 0), MapSet.put(flashes, key))

      true ->
        step(keys, Map.put(grid, key, value + 1), flashes)
    end
  end

  defp step([], grid, flashes) do
    {grid, MapSet.size(flashes)}
  end
end
