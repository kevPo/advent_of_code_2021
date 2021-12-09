defmodule AOC.Day6.Part2.FishCount do
  def total_for_given_days(input, days) do
    day_counts =
      input
      |> parse_input()
      |> Enum.frequencies()
      |> get_counts_for_each_day()

    1..days
    |> Enum.reduce(day_counts, fn _, days -> add_day(days) end)
    |> Tuple.sum()
  end

  defp parse_input(input) do
    input
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
  end

  defp get_counts_for_each_day(day_frequencies) do
    0..8
    |> Enum.map(fn i -> day_frequencies[i] || 0 end)
    |> List.to_tuple()
  end

  defp add_day({day0, day1, day2, day3, day4, day5, day6, day7, day8}) do
    {day1, day2, day3, day4, day5, day6, day7 + day0, day8, day0}
  end
end
