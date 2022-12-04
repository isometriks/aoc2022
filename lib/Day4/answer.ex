defmodule Day4 do
  def data do
    File.read!("./lib/Day4/data.txt")
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&Regex.run(~r/(\d+)-(\d+),(\d+)-(\d+)/, &1, capture: :all_but_first))
    |> Enum.map(fn list -> Enum.map(list, &String.to_integer/1) end)
    |> Enum.map(&Enum.chunk_every(&1, 2))
  end

  def solve1 do
    data()
    |> Enum.filter(&inside/1)
    |> Enum.count()
  end

  def solve2 do
    data()
    |> Enum.filter(&overlap/1)
    |> Enum.count()
  end

  defp inside([[a, b], [x, y]]) do
    (a >= x && b <= y) || (x >= a && y <= b)
  end

  defp overlap([first, second]) do
    in_range(first, second) || in_range(second, first)
  end

  defp in_range(list, [a, b]) do
    list
    |> Enum.any?(fn n -> n in a..b end)
  end
end
