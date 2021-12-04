defmodule AOC.Day2.Parser do
  def parse_move("forward " <> units), do: {:forward, String.to_integer(units)}
  def parse_move("down " <> units), do: {:down, String.to_integer(units)}
  def parse_move("up " <> units), do: {:up, String.to_integer(units)}
end
