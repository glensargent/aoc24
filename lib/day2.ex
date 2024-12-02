defmodule Aoc25.Day2 do
  def run do
    File.read!("inputs/day2.txt") |> parse()
  end

  defp increasing?([_]), do: true
  defp increasing?([a, b | rest]), do: a < b and increasing?([b | rest])
  defp decreasing?([_]), do: true
  defp decreasing?([a, b | rest]), do: a > b and decreasing?([b | rest])
  defp valid_differences?([_]), do: true

  defp valid_differences?([a, b | rest]) do
    diff = abs(a - b)
    diff >= 1 and diff <= 3 and valid_differences?([b | rest])
  end

  def valid_level?(level) do
    all_increasing = increasing?(level)
    all_decreasing = decreasing?(level)
    valid_differences = valid_differences?(level)
    (all_increasing or all_decreasing) and valid_differences
  end

  def parse(input) do
    input
    |> String.split("\n")
    |> Enum.filter(&(&1 != ""))
    |> Enum.map(&String.split(&1, " "))
    |> Enum.map(fn lvl ->
      Enum.map(lvl, &String.to_integer(&1))
    end)
    |> Enum.map(fn lvl ->
      valid_level?(lvl)
    end)
    |> Enum.filter(&(&1 == true))
    |> Enum.count()
    |> IO.inspect()
  end
end