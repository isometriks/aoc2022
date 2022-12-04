defmodule Day3 do
  def data do
    File.read!("./lib/Day3/data.txt")
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&String.graphemes/1)
  end

  def solve1 do
    data()
    |> Enum.map(&Enum.chunk_every(&1, div(Enum.count(&1), 2)))
    |> Enum.map(fn [first, second] ->
      intersect([MapSet.new(first), MapSet.new(second)])
      |> MapSet.to_list()
      |> letter_sum
      |> Enum.sum()
    end)
    |> Enum.sum()
  end

  def solve2 do
    data()
    |> Enum.chunk_every(3)
    |> Enum.map(fn group -> Enum.map(group, &MapSet.new/1) end)
    |> Enum.map(&intersect/1)
    |> Enum.map(fn list ->
      list
      |> MapSet.to_list()
      |> letter_sum
      |> Enum.sum()
    end)
    |> Enum.sum()
  end

  defp intersect([first | rest]) do
    case rest do
      [] -> first
      _ -> MapSet.intersection(first, intersect(rest))
    end
  end

  defp letter_sum(letters) do
    letters
    |> Enum.map(fn x ->
      case :binary.first(x) do
        val when val >= ?a -> val - (?a - 1)
        val when val >= ?A -> val - (?A - 27)
      end
    end)
  end
end
