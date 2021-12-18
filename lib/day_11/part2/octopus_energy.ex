defmodule AOC.Day11.Part2.OctopusEnergy do
  def get_step_all_flash(input) do
    lines =
      input
      |> String.split("\n", trim: true)

    grid =
      for {line, row} <- Enum.with_index(lines),
          {value, col} <- Enum.with_index(String.to_charlist(line)),
          into: %{},
          do: {{row, col}, value - ?0}

    Stream.iterate(1, &(&1 + 1))
    |> Enum.reduce_while(grid, fn i, grid ->
      case step(grid) do
        {grid, flashes} when map_size(grid) == flashes -> {:halt, i}
        {grid, _flashes} -> {:cont, grid}
      end
    end)
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
