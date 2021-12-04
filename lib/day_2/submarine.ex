defmodule AOC.Submarine do
  def navigate(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_move/1)
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

  defp parse_move("forward " <> units), do: {:forward, String.to_integer(units)}
  defp parse_move("down " <> units), do: {:down, String.to_integer(units)}
  defp parse_move("up " <> units), do: {:up, String.to_integer(units)}

  def navigate_old(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_move/1)
    |> Enum.reduce({_horizontal = 0, _depth = 0}, &move_old/2)
    |> then(fn {horizontal, depth} -> horizontal * depth end)
  end

  defp move_old({:forward, units}, {horizontal, depth}) do
    {horizontal + units, depth}
  end

  defp move_old({:down, units}, {horizontal, depth}) do
    {horizontal, depth + units}
  end

  defp move_old({:up, units}, {horizontal, depth}) do
    {horizontal, depth - units}
  end
end
