defmodule AOC.Day1.SonarSweepTest do
  use ExUnit.Case, async: true

  alias AOC.Day1.Part1.SonarSweep, as: SonarSweep1
  alias AOC.Day1.Part2.SonarSweep, as: SonarSweep2

  @input """
  199
  200
  208
  210
  200
  207
  240
  269
  260
  263
  """

  test "depth increases are correctly measured" do
    assert 7 = SonarSweep1.measure_depth_increases(@input)
  end

  test "sliding window increases are correctly measured" do
    assert 5 = SonarSweep2.measure_sliding_window_increases(@input)
  end
end
