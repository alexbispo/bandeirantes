defmodule Bandeirantes.Bandeirante do
  
  alias Bandeirantes.{Bandeirante, Coordinate}

  defstruct [:nav_limit, :nav_start, :nav_direction] 

  @doc """
    ## Examples

      iex> {:ok, limit_coordinate} = Bandeirantes.Coordinate.new({5,5})
      iex> {:ok, initial_coordinate} = Bandeirantes.Coordinate.new({1,2})
      iex> Bandeirantes.Bandeirante.new(limit_coordinate, initial_coordinate, "N")
      {:ok, 
        %Bandeirantes.Bandeirante{
          nav_limit: %Bandeirantes.Coordinate{x: 5, y: 5},
          nav_start: %Bandeirantes.Coordinate{x: 1, y: 2},
          nav_direction: "N"
        }
      }

  """
  def new(%Coordinate{} = nav_limit, %Coordinate{} = nav_start, nav_direction) do
    {:ok, %Bandeirante{nav_limit: nav_limit, nav_start: nav_start, nav_direction: nav_direction}}
  end
end