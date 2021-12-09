defmodule AOC.Day6.Part1.FishCount do
  def total_for_given_days(input, days) do
    starter_fish =
      input
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)

    1..days
    |> Enum.reduce(starter_fish, fn
      _day, fish -> add_day(fish)
    end)
    |> Enum.count()
  end

  def add_day(fishes) do
    Enum.reduce(fishes, [], fn
      0, new_day -> [6, 8 | new_day]
      day, new_day -> [day - 1 | new_day]
    end)
  end
end
