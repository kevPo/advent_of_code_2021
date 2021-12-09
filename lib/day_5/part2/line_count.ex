defmodule AOC.Day5.Part2.LineCount do
  def count(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn x ->
      x
      |> String.split([",", " -> "], trim: true)
      |> Enum.map(&String.to_integer/1)
    end)
    |> Enum.reduce(%{}, fn
      [x, y1, x, y2], grid -> calculate(Stream.cycle([x]), y1..y2, grid)
      [x1, y, x2, y], grid -> calculate(x1..x2, Stream.cycle([y]), grid)
      [x1, y1, x2, y2], grid -> calculate(x1..x2, y1..y2, grid)
    end)
    |> Enum.count(fn {_, v} -> v > 1 end)
  end

  defp calculate(xs, ys, grid) do
    Enum.reduce(Enum.zip(xs, ys), grid, fn {x, y}, grid ->
      Map.update(grid, {x, y}, 1, &(&1 + 1))
    end)
  end
end
