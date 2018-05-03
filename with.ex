defmodule With do
  def do_something(x, y) do
    something(x, y)
  end

  def something(x, y) do
    case something_even_further(x, y) do
      {:ok, z} -> {:ok, z * y}
      {:err, msg} -> {:err, msg}
    end
  end

  def something_further(x, y) do
    case something_even_further(x, y) do
      {:ok, x} -> {:ok, x + y}
      {:err, msg} -> {:err, msg}
    end
  end

  def something_even_further(x, y) do
    if x > y do
      {:ok, x}
    else
      {:err, "#{y} is bigger than #{x}"}
    end
  end
end