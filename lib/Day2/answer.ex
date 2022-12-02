defmodule Day2 do
  def data do
    File.read!("./lib/Day2/data.txt")
    |> String.split("\n")
    |> Enum.map(&String.split(&1, " "))
    |> Enum.reject(fn x -> x == [""] end)
  end

  def solve1 do
    data()
    |> Enum.map(&points/1)
    |> Enum.sum()
  end

  def solve2 do
    data()
    |> Enum.map(&alter/1)
    |> Enum.map(&points/1)
    |> Enum.sum()
  end

  defp alter([elf, you]) do
    case you do
      "X" ->
        case elf do
          "A" -> ["A", "Z"]
          "B" -> ["B", "X"]
          "C" -> ["C", "Y"]
        end

      "Y" ->
        case elf do
          "A" -> ["A", "X"]
          "B" -> ["B", "Y"]
          "C" -> ["C", "Z"]
        end

      "Z" ->
        case elf do
          "A" -> ["A", "Y"]
          "B" -> ["B", "Z"]
          "C" -> ["C", "X"]
        end
    end
  end

  defp points(round) do
    case round do
      ["A", "X"] -> 4
      ["A", "Y"] -> 8
      ["A", "Z"] -> 3
      ["B", "X"] -> 1
      ["B", "Y"] -> 5
      ["B", "Z"] -> 9
      ["C", "X"] -> 7
      ["C", "Y"] -> 2
      ["C", "Z"] -> 6
    end
  end
end
