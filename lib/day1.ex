# make 2 lists out of the number columns (can check for is equal)
# sort the lists to be smallest to largest
# pair the numbers and work out the difference 
# sum the differences

defmodule Aoc25 do
  def day1 do
    contents = File.read!("inputs/day1.txt")
    parse(contents)
  end

  def parse(input) do
    # iterate through the file to get the numbers
    # a number is finished when its followed by a space or a new line
    nums =
      input
      # split by new lines
      |> String.split("\n")
      # split by spaces
      |> Enum.flat_map(&String.split(&1, " "))
      # remove empty strings
      |> Enum.reject(&(&1 == ""))

    # make 2 lists based on index being odd or even
    {collA, collB} =
      Enum.with_index(nums)
      |> Enum.split_with(&(rem(elem(&1, 1), 2) == 0))

    # get the values from the list of tuples
    collA =
      collA
      |> Enum.map(&elem(&1, 0))
      |> Enum.map(&String.to_integer/1)
      |> Enum.sort()

    collB =
      collB
      |> Enum.map(&elem(&1, 0))
      |> Enum.map(&String.to_integer/1)
      |> Enum.sort()


    # join the columns and then calc their distances
    distances =
      Enum.zip(collA, collB)
      |> Enum.map(fn {a, b} ->
        if a > b do
          a - b
        end

        b - a
      end)

    sum = Enum.sum(distances)
    IO.inspect(sum)
  end
end
