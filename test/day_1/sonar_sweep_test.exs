defmodule AOC.SonarSweepTest do
  use ExUnit.Case, async: true

  alias AOC.SonarSweep

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
    assert 7 = SonarSweep.measure_depth_increases(@input)
  end

  test "sliding window increases are correctly measured" do
    assert 5 = SonarSweep.measure_sliding_window_increases(@input)
  end
end
