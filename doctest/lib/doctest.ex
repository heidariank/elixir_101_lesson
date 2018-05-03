defmodule Doctest do
  @doc """
    Some docs that of course follow good commenting practices.


  """
  def head(file) do
    file
    |> File.read!()
    |> String.split("\n")
    |> Enum.at(0)
  end

  @doc """
    Some moar docs that of course follow good commenting practices.


  """
  def tail(file) do
    file
    |> File.read!()
    |> String.split("\n")
    |> Enum.at(-1)
  end
end
