defmodule Bandeirantes.Util do
  @doc """
    ## Examples

      iex> Bandeirantes.Util.string_to_integer_tuple("5 5\\n")
      {5, 5}

  """
  def string_to_integer_tuple(str) do
    str
    |> String.split()
    |> Enum.reduce({}, fn str, result ->
      {n, _} = Integer.parse(str)
      Tuple.append(result, n)
    end)
  end
end
