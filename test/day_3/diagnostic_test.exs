defmodule AOC.Day3.DiagnosticTest do
  use ExUnit.Case, async: true

  alias AOC.Day3.Part1.Diagnostic, as: Diagnostic1
  alias AOC.Day3.Part2.Diagnostic, as: Diagnostic2

  @input """
  00100
  11110
  10110
  10111
  10101
  01111
  00111
  11100
  10000
  11001
  00010
  01010
  """

  test "get_power_consumption correctly calculates" do
    assert 198 = Diagnostic1.get_power_consumption(@input)
  end

  test "get_life_support_rating correctly calculates" do
    assert 230 = Diagnostic2.get_life_support_rating(@input)
  end
end
