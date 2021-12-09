defmodule AOC.Day5.LineCountTest do
  use ExUnit.Case, async: true

  alias AOC.Day5.Part1.LineCount, as: LineCount1
  alias AOC.Day5.Part2.LineCount, as: LineCount2

  @input """
  0,9 -> 5,9
  8,0 -> 0,8
  9,4 -> 3,4
  2,2 -> 2,1
  7,0 -> 7,4
  6,4 -> 2,0
  0,9 -> 2,9
  3,4 -> 1,4
  0,0 -> 8,8
  5,5 -> 8,2
  """

  test "count number of intersections greater than 2" do
    assert 5 == LineCount1.count(@input)
  end

  test "count number of intersections with diagonals greater than 2" do
    assert 12 == LineCount2.count(@input)
  end
end
