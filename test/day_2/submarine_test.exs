defmodule AOC.SubmarineTest do
  use ExUnit.Case, async: true

  alias AOC.Submarine

  @input """
  forward 5
  down 5
  forward 8
  up 3
  down 8
  forward 2
  """

  test "navigate_old correctly moves Submarine" do
    assert 150 = Submarine.navigate_old(@input)
  end

  test "navigate correctly moves Submarine" do
    assert 900 = Submarine.navigate(@input)
  end
end
