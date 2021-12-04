defmodule AOC.Day2.Part2.Submarine do
  alias AOC.Day2.Parser

  def navigate(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&Parser.parse_move/1)
    |> Enum.reduce({_horizontal = 0, _depth = 0, _aim = 0}, &move/2)
    |> then(fn {horizontal, depth, _aim} -> horizontal * depth end)
  end

  defp move({:forward, units}, {horizontal, depth, aim}) do
    {horizontal + units, depth + aim * units, aim}
  end

  defp move({:down, units}, {horizontal, depth, aim}) do
    {horizontal, depth, aim + units}
  end

  defp move({:up, units}, {horizontal, depth, aim}) do
    {horizontal, depth, aim - units}
  end
end
