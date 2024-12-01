# part 1
# make 2 lists out of the number columns (can check for is equal)
# sort the lists to be smallest to largest
# pair the numbers and work out the difference 
# sum the differences

# part 2
# count how often numbers from collA appear in collB
# multiply the left number by how many times it appears in collB (similarity score)
# add up the numbers

defmodule Aoc25 do
  def day1 do
    File.read!("inputs/day1.txt") |> parse()
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

    # calculate similarity scores
    score =
      Enum.map(collA, fn x ->
        x * Enum.count(collB, &(&1 == x))
      end)
      |> Enum.sum()

    # join the columns and then calc their distances
    distances =
      Enum.zip(collA, collB)
      |> Enum.map(fn {a, b} -> abs(a - b) end)

    sum = Enum.sum(distances)
    IO.inspect(sum, label: "Sum of distances")
    IO.inspect(score, label: "Total simularity score")
  end
end
