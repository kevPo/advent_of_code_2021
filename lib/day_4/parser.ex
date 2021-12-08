defmodule AOC.Day4.Parser do
  alias AOC.Day4.Board

  def parse(input) do
    [numbers | grids] = String.split(input, "\n", trim: true)

    boards =
      grids
      |> Enum.chunk_every(5)
      |> Enum.map(fn rows ->
        Board.new(
          for {line, row} <- Enum.with_index(rows, 0),
              {number, col} <- Enum.with_index(String.split(line), 0),
              into: %{} do
            {String.to_integer(number), {row, col}}
          end
        )
      end)

    numbers =
      numbers
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)

    {numbers, boards}
  end
end
