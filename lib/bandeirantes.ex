defmodule Bandeirantes do
  @moduledoc """
  Documentation for Bandeirantes.
  """
  alias Bandeirantes.{Util, Bandeirante, Coordinate}

  def main(_args \\ []) do
    get_args(:start)
    |> process()
    |> puts_response()
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
    position =
      IO.gets("")
      |> String.split()
      |> Enum.map(fn e ->
        result = Integer.parse(e)
        if result === :error, do: e, else: elem(result, 0)
      end)
      |> List.to_tuple()

    if tuple_size(position) > 0 do
      instructions = IO.gets("") |> String.trim() |> String.graphemes()
      bandeirante = {position, instructions}
      bandeirantes = [bandeirante | bandeirantes]
      get_args({:cont, limit, bandeirantes})
    else
      get_args({:halt, limit, bandeirantes})
    end
  end

  defp process({{max_x, max_y}, [_ | _] = bandeirantes}) do
    {:ok, max_coordinate} = Coordinate.new({max_x, max_y})

    bandeirantes
    |> Enum.map(fn {{start_x, start_y, start_direction}, instructions} ->
      {:ok, start_coordinate} = {start_x, start_y} |> Coordinate.new()
      {:ok, bandeirante} = Bandeirante.new(max_coordinate, start_coordinate, start_direction)

      bandeirante =
        instructions
        |> Enum.reduce(bandeirante, fn instruction, go ->
          go
          |> Bandeirante.nav(instruction)
        end)

      "#{bandeirante.position.x} #{bandeirante.position.y} #{bandeirante.nav_direction}"
    end)
  end

  defp puts_response(response) do
    response
    |> Enum.each(&IO.puts/1)
  end
end
