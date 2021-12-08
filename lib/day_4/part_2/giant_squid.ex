defmodule AOC.Day4.Part2.GiantSquid do
  alias AOC.Day4.Parser
  alias AOC.Day4.Board

  def get_worst_score(input) do
    {numbers, boards} = Parser.parse(input)

    {number, board = %Board{}} =
      Enum.reduce_while(numbers, boards, fn number, boards ->
        boards = Enum.map(boards, &Board.mark(&1, number))

        case Enum.reject(boards, &Board.won?/1) do
          [] ->
            [board] = boards
            {:halt, {number, board}}

          boards ->
            {:cont, boards}
        end
      end)

    number * Board.unmarked_sum(board)
  end
end
