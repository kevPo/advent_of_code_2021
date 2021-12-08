defmodule AOC.Day4.Board do
  alias AOC.Day4.Board

  empty_board = Tuple.duplicate(Tuple.duplicate(false, 5), 5)
  @enforce_keys [:numbers]
  defstruct numbers: %{}, grid: empty_board

  def new(numbers) when is_map(numbers) do
    %Board{numbers: numbers}
  end

  def mark(%Board{numbers: numbers} = board, number) do
    case numbers do
      %{^number => {row, col}} ->
        put_in(board, [Access.key(:grid), Access.elem(row), Access.elem(col)], true)

      %{} ->
        board
    end
  end

  def unmarked_sum(%Board{numbers: numbers, grid: grid}) do
    Enum.sum(
      for {number, {row, col}} <- numbers,
          grid |> elem(row) |> elem(col) == false,
          do: number
    )
  end

  def won?(%Board{grid: grid}) do
    row_won?(grid) or column_won?(grid)
  end

  defp column_won?(grid) do
    Enum.any?(0..4, fn col ->
      Enum.all?(0..4, fn row -> grid |> elem(row) |> elem(col) end)
    end)
  end

  defp row_won?(grid) do
    Enum.any?(0..4, fn row ->
      elem(grid, row) == {true, true, true, true, true}
    end)
  end
end
