defmodule AOC.Day6.FishCountTest do
  use ExUnit.Case, async: true

  alias AOC.Day6.Part1.FishCount, as: FishCount1
  alias AOC.Day6.Part2.FishCount, as: FishCount2

  @input "3,4,3,1,2"

  test "total_for_given_days returns correct sum for 80 days" do
    assert 5934 == FishCount1.total_for_given_days(@input, 80)
  end

  test "total_for_given_days returns correct sum for 256 days" do
    assert 26_984_457_539 == FishCount2.total_for_given_days(@input, 256)
  end
end
