defmodule Day1 do
  def data do
    File.read!("./lib/Day1/data.txt")
    |> String.split("\n")
  end

  def solve1 do
    data()
    |> Enum.chunk_by(fn item -> item == "" end)
    |> Enum.reject(fn list -> list == [""] end)
    |> Enum.map(&sum/1)
    |> Enum.sort
    |> Enum.reverse
  end

  def solve2 do
    solve1()
    |> Enum.take(3)
    |> Enum.sum
  end

  defp sum(calories) do
    calories
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum
  end
end
