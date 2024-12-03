defmodule Aoc24.Day3 do
  import NimbleParsec

  def run do
    File.read!("inputs/day3.txt") |> process()
  end

  mul_parser =
    ignore(string("mul("))
    |> concat(integer(min: 1, max: 3))
    |> ignore(string(","))
    |> concat(integer(min: 1, max: 3))
    |> ignore(string(")"))
    |> reduce({List, :to_tuple, []})

  mem_parser =
    repeat(
      choice([
        mul_parser,
        utf8_string([not: ?m], min: 1) |> ignore()
      ])
    )

  defparsec(:parse_memory, mem_parser)

  def process(input) do
    {:ok, parsed, _, _, _, _} = parse_memory(input)

    Enum.map(parsed, fn {x, y} -> x * y end)
    |> Enum.sum()
    |> IO.inspect()
  end
end
