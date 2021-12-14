defmodule AOC.Day10.Part1.SyntaxScore do
  @scores %{
    ")" => 3,
    "]" => 57,
    "}" => 1197,
    ">" => 25137
  }

  @openings ["{", "(", "<", "["]
  @closings ["}", ")", ">", "]"]

  @pairs %{
    "{" => "}",
    "}" => "{",
    "(" => ")",
    ")" => "(",
    "<" => ">",
    ">" => "<",
    "[" => "]",
    "]" => "["
  }

  def calculate(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      line
      |> String.split("", trim: true)
      |> Enum.reduce_while({[], []}, fn x, {opens, closes} ->
        cond do
          x in @openings ->
            {:cont, {[x | opens], [@pairs[x] | closes]}}

          x in @closings and @pairs[x] in opens and x == hd(closes) ->
            {:cont, {List.delete(opens, @pairs[x]), tl(closes)}}

          x in @closings and x != hd(closes) ->
            {:halt, x}
        end
      end)
    end)
    |> Enum.reject(&is_tuple/1)
    |> Enum.map(fn x -> @scores[x] end)
    |> Enum.sum()
  end
end
