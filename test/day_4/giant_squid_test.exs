defmodule AOC.Day4.GiantSquidTest do
  use ExUnit.Case, async: true

  alias AOC.Day4.Part1.GiantSquid, as: GiantSquid1
  alias AOC.Day4.Part2.GiantSquid, as: GiantSquid2

  @input """
  7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1

  22 13 17 11  0
  8  2 23  4 24
  21  9 14 16  7
  6 10  3 18  5
  1 12 20 15 19

  3 15  0  2 22
  9 18 13 17  5
  19  8  7 25 23
  20 11 10 24  4
  14 21 16 12  6

  14 21 17 24  4
  10 16 15  9 19
  18  8 23 26 20
  22 11 13  6  5
  2  0 12  3  7
  """

  test "get_winning_score returns score from winning card" do
    assert 4512 = GiantSquid1.get_winning_score(@input)
  end

  test "get_worst_score returns score from last winning card" do
    assert 1924 = GiantSquid2.get_worst_score(@input)
  end
end
