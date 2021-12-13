defmodule AOC.Day8.SevenSegmentDisplayTest do
  use ExUnit.Case, async: true

  alias AOC.Day8.Part1.SevenSegmentDisplay, as: SevenSegmentDisplay1
  alias AOC.Day8.Part2.SevenSegmentDisplay, as: SevenSegmentDisplay2

  @input """
  be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb |
  fdgacbe cefdb cefbgd gcbe
  edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec |
  fcgedb cgb dgebacf gc
  fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef |
  cg cg fdcagb cbg
  fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega |
  efabcd cedba gadfec cb
  aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga |
  gecf egdcabf bgf bfgea
  fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf |
  gebdcfa ecba ca fadegcb
  dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf |
  cefg dcbef fcge gbcadfe
  bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd |
  ed bcgafe cdgba cbgef
  egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg |
  gbdfcae bgc cg cgb
  gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc |
  fgae cfgab fg bagce
  """

  test "find_simple_numbers returns correct number of simple numbers" do
    assert 26 == SevenSegmentDisplay1.find_simple_numbers(@input)
  end

  test "find_min_fuel_cost returns correct fuel cost when fuel is more expensive" do
    assert 61229 == SevenSegmentDisplay2.sum_inputs(@input)
  end
end
