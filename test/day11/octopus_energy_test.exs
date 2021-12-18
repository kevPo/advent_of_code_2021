defmodule AOC.Day11.OctopusEnergyTest do
  use ExUnit.Case, async: true

  alias AOC.Day11.Part1.OctopusEnergy, as: OctopusEnergy1
  alias AOC.Day11.Part2.OctopusEnergy, as: OctopusEnergy2

  @input """
  5483143223
  2745854711
  5264556173
  6141336146
  6357385478
  4167524645
  2176841721
  6882881134
  4846848554
  5283751526
  """

  test "get_number_of_flashes/2 is 1656 for 100 steps with given input" do
    assert 1656 == OctopusEnergy1.get_number_of_flashes(@input, 100)
  end

  test "get_step_all_flash returns 100 with given input" do
    assert 195 == OctopusEnergy2.get_step_all_flash(@input)
  end
end
