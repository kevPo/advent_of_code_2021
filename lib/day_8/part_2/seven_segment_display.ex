defmodule AOC.Day8.Part2.SevenSegmentDisplay do
  def sum_inputs(input) do
    input
    |> String.split(["\n", "|"], trim: true)
    |> Enum.chunk_every(2)
    |> Enum.map(fn [inputs, output] ->
      {inputs |> String.split() |> Enum.group_by(&String.length/1, &String.to_charlist/1),
       output |> String.split() |> Enum.map(&String.to_charlist/1)}
    end)
    |> Enum.map(fn {inputs, output} ->
      %{
        2 => [one],
        3 => [seven],
        4 => [four],
        5 => two_three_five,
        6 => zero_six_nine,
        7 => [eight]
      } = inputs

      [nine] = Enum.filter(zero_six_nine, &match?([], four -- &1))
      [zero] = Enum.filter(zero_six_nine -- [nine], &match?([], seven -- &1))
      [six] = zero_six_nine -- [nine, zero]

      [three] = Enum.filter(two_three_five, &match?([], seven -- &1))
      [five] = Enum.filter(two_three_five -- [three], &match?([], &1 -- six))
      [two] = two_three_five -- [three, five]

      key = %{
        Enum.sort(zero) => 0,
        Enum.sort(one) => 1,
        Enum.sort(two) => 2,
        Enum.sort(three) => 3,
        Enum.sort(four) => 4,
        Enum.sort(five) => 5,
        Enum.sort(six) => 6,
        Enum.sort(seven) => 7,
        Enum.sort(eight) => 8,
        Enum.sort(nine) => 9
      }

      output
      |> Enum.map(fn o ->
        input_key = Enum.sort(o)
        Map.fetch!(key, input_key)
      end)
      |> Enum.join()
    end)
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum()
  end
end
