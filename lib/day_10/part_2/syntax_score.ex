defmodule AOC.Day10.Part2.SyntaxScore do
  @autocomplete_scores %{
    ")" => 1,
    "]" => 2,
    "}" => 3,
    ">" => 4
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
    scores =
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
      |> Enum.reject(fn x -> is_binary(x) end)
      |> Enum.map(fn {_, closers} -> closers end)
      |> Enum.map(fn x ->
        Enum.reduce(x, 0, fn y, score -> 5 * score + @autocomplete_scores[y] end)
      end)
      |> Enum.sort()

    Enum.at(scores, Integer.floor_div(length(scores), 2))
  end
end
