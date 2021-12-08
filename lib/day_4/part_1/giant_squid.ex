defmodule AOC.Day4.Part1.GiantSquid do
  alias AOC.Day4.Parser
  alias AOC.Day4.Board

  def get_winning_score(input) do
    {numbers, boards} = Parser.parse(input)

    {number, board = %Board{}} =
      Enum.reduce_while(numbers, boards, fn number, boards ->
        boards = Enum.map(boards, &Board.mark(&1, number))

        if board = Enum.find(boards, &Board.won?/1) do
          {:halt, {number, board}}
        else
          {:cont, boards}
        end
      end)

    number * Board.unmarked_sum(board)
  end
end
