defmodule AOC.Day7.CrabMoverTest do
  use ExUnit.Case, async: true

  alias AOC.Day7.Part1.CrabMover, as: CrabMover1
  alias AOC.Day7.Part2.CrabMover, as: CrabMover2

  @input "16,1,2,0,4,2,7,1,2,14"

  test "find_min_fuel_cost returns correct fuel cost" do
    assert 37 == CrabMover1.find_min_fuel_cost(@input)
  end

  test "find_min_fuel_cost returns correct fuel cost when fuel is more expensive" do
    assert 168 == CrabMover2.find_min_fuel_cost(@input)
  end
end
