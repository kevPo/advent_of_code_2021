defmodule AOC.Day3.Part1.Diagnostic do
  def get_power_consumption(report) do
    {numbers, length} = parse(report)

    bits_by_index =
      for index <- 0..(length - 1) do
        Enum.map(numbers, fn bit -> String.to_integer(Enum.at(bit, index)) end)
      end

    bits_by_index
    |> Enum.map(fn bits -> Enum.frequencies(bits) end)
    |> Enum.map(fn bits -> Enum.min_max_by(bits, fn {_, value} -> value end) end)
    |> Enum.reduce({_gamma = "", _epsilon = ""}, fn {{min, _}, {max, _}}, {gamma, epsilon} ->
      {gamma <> to_string(max), epsilon <> to_string(min)}
    end)
    |> then(fn {gamma, epsilon} -> [String.to_charlist(gamma), String.to_charlist(epsilon)] end)
    |> Enum.map(fn binary -> List.to_integer(binary, 2) end)
    |> Enum.product()
  end

  defp parse(report) do
    report
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, "", trim: true))
    |> then(fn numbers -> {numbers, length(Enum.at(numbers, 0))} end)
  end
end
