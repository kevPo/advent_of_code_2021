defmodule AOC.Day10.SyntaxScoreTest do
  use ExUnit.Case, async: true

  alias AOC.Day10.Part1.SyntaxScore, as: SyntaxScore1
  alias AOC.Day10.Part2.SyntaxScore, as: SyntaxScore2

  @input """
  [({(<(())[]>[[{[]{<()<>>
  [(()[<>])]({[<{<<[]>>(
  {([(<{}[<>[]}>{[]{[(<()>
  (((({<>}<{<{<>}{[]{[]{}
  [[<[([]))<([[{}[[()]]]
  [{[{({}]{}}([{[{{{}}([]
  {<[[]]>}<{[{[{[]{()[[[]
  [<(<(<(<{}))><([]([]()
  <{([([[(<>()){}]>(<<{{
  <{([{{}}[<[[[<>{}]]]>[]]
  """

  test "calculate returns correct syntax score for corrupted lines" do
    assert 26397 == SyntaxScore1.calculate(@input)
  end

  test "calculate returns correct autocompletion syntax score" do
    assert 288_957 == SyntaxScore2.calculate(@input)
  end
end
