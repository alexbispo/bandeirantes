defmodule Bandeirantes do
  @moduledoc """
  Documentation for Bandeirantes.
  """

  alias Bandeirantes.Util

  def main(_args \\ []) do
    get_args(:start)
    |> IO.inspect()

    # |> process
    # |> puts_response
  end

  defp get_args({:halt, limit, bandeirantes}) do
    {limit, Enum.reverse(bandeirantes)}
  end

  defp get_args(:start) do
    limit = IO.gets("") |> Util.string_to_integer_tuple()
    if tuple_size(limit) > 0 do
      get_args({:cont, limit, []})
    else
      get_args({:halt, {}, []})
    end
  end

  defp get_args({:cont, limit, bandeirantes}) do
    position = IO.gets("") |> String.split |> List.to_tuple()
    if tuple_size(position) > 0 do
      instructions = IO.gets("") |> String.trim |> String.graphemes
      bandeirante = {position, instructions}
      bandeirantes = [bandeirante | bandeirantes]
      get_args({:cont, limit, bandeirantes})
    else
      get_args({:halt, limit, bandeirantes})
    end
  end

  # defp process({{x, y}, [{{x,y,z}, [_|_]}, {{x,y,z}, [_|_]}]}) do
    
  # end

  # defp puts_response(_something) do
    
  # end
end
