defmodule AOC.Day3.Part2.Diagnostic do
  def get_life_support_rating(report) do
    report
    |> parse()
    |> calculate_life_support()
  end

  defp parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, "", trim: true))
    |> Enum.map(fn strings -> Enum.map(strings, &String.to_integer/1) end)
    |> then(fn numbers -> {numbers, length(Enum.at(numbers, 0))} end)
  end

  defp calculate_life_support(diagnostics) do
    oxygen_generator_rating = find_rating(diagnostics, :oxy)
    c02_scrubber_rating = find_rating(diagnostics, :c02)

    oxygen_generator_rating * c02_scrubber_rating
  end

  defp find_rating({numbers, length}, rating_type) do
    {numbers, length, rating_type}
    |> get_binary_number_for_rating()
    |> binary_list_to_decimal()
  end

  defp get_binary_number_for_rating({numbers, length, rating_type}) do
    0..(length - 1)
    |> Enum.reduce_while(_filtered = numbers, fn index, filtered ->
      filtered =
        filtered
        |> get_all_bits_at_index(index)
        |> Enum.frequencies()
        |> Enum.min_max_by(fn {_k, v} -> v end)
        |> filter_at_index(rating_type, filtered, index)

      if Enum.count(filtered) == 1, do: {:halt, Enum.at(filtered, 0)}, else: {:cont, filtered}
    end)
  end

  defp binary_list_to_decimal(binary_list) do
    binary_list
    |> Enum.join("")
    |> String.to_charlist()
    |> List.to_integer(2)
  end

  defp get_all_bits_at_index(ratings, index) do
    Enum.map(ratings, fn rating -> Enum.at(rating, index) end)
  end

  defp filter_at_index({{min, _}, {max, _}}, :oxy, ratings, index) when min == max do
    Enum.filter(ratings, fn rating -> Enum.at(rating, index) == 1 end)
  end

  defp filter_at_index({{_min, _}, {max, _}}, :oxy, ratings, index) do
    Enum.filter(ratings, fn rating -> Enum.at(rating, index) == max end)
  end

  defp filter_at_index({{min, _}, {max, _}}, :c02, ratings, index) when min == max do
    Enum.filter(ratings, fn rating -> Enum.at(rating, index) == 0 end)
  end

  defp filter_at_index({{min, _}, {_max, _}}, :c02, ratings, index) do
    Enum.filter(ratings, fn rating -> Enum.at(rating, index) == min end)
  end
end
