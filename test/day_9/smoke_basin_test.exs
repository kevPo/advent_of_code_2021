defmodule AOC.Day9.SmokeBasinTest do
  use ExUnit.Case, async: true

  alias AOC.Day9.Part1.SmokeBasin, as: SmokeBasin1
  alias AOC.Day9.Part2.SmokeBasin, as: SmokeBasin2

  @input """
  2199943210
  3987894921
  9856789892
  8767896789
  9899965678
  """

  test "sum_risk_levels returns correct sum" do
    assert 15 == SmokeBasin1.sum_risk_levels(@input)
  end

  test "find_large_basins returns correct product of 3 largest basins" do
    assert 1134 == SmokeBasin2.find_large_basins(@input)
  end
end
