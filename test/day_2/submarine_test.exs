defmodule AOC.Day2.SubmarineTest do
  use ExUnit.Case, async: true

  alias AOC.Day2.Part1.Submarine, as: Submarine1
  alias AOC.Day2.Part2.Submarine, as: Submarine2

  @input """
  forward 5
  down 5
  forward 8
  up 3
  down 8
  forward 2
  """

  test "navigate_old correctly moves Submarine" do
    assert 150 = Submarine1.navigate(@input)
  end

  test "navigate correctly moves Submarine" do
    assert 900 = Submarine2.navigate(@input)
  end
end
