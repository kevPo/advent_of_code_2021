defmodule AOC.Day2.Part1.Submarine do
  alias AOC.Day2.Parser

  def navigate(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&Parser.parse_move/1)
    |> Enum.reduce({_horizontal = 0, _depth = 0}, &move/2)
    |> then(fn {horizontal, depth} -> horizontal * depth end)
  end

  defp move({:forward, units}, {horizontal, depth}) do
    {horizontal + units, depth}
  end

  defp move({:down, units}, {horizontal, depth}) do
    {horizontal, depth + units}
  end

  defp move({:up, units}, {horizontal, depth}) do
    {horizontal, depth - units}
  end
end
