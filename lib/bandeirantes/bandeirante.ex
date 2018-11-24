defmodule Bandeirantes.Bandeirante do
  
  alias Bandeirantes.{Bandeirante, Coordinate, Compass}

  defstruct [:nav_limit, :position, :nav_direction] 

  @doc """
    ## Examples

      iex> {:ok, limit_coordinate} = Bandeirantes.Coordinate.new({5,5})
      iex> {:ok, initial_coordinate} = Bandeirantes.Coordinate.new({1,2})
      iex> Bandeirantes.Bandeirante.new(limit_coordinate, initial_coordinate, "N")
      {:ok, 
        %Bandeirantes.Bandeirante{
          nav_limit: %Bandeirantes.Coordinate{x: 5, y: 5},
          position: %Bandeirantes.Coordinate{x: 1, y: 2},
          nav_direction: "N"
        }
      }

  """
  def new(%Coordinate{} = nav_limit, %Coordinate{} = position, nav_direction) do
    {:ok, %Bandeirante{nav_limit: nav_limit, position: position, nav_direction: nav_direction}}
  end

  @doc """
    ## Examples

      iex> {:ok, limit_coordinate} = Bandeirantes.Coordinate.new({5,5})
      iex> {:ok, initial_coordinate} = Bandeirantes.Coordinate.new({1,2})
      iex> {:ok, bandeirante} = Bandeirantes.Bandeirante.new(limit_coordinate, initial_coordinate, "N")
      iex> bandeirante |> 
      ...> Bandeirantes.Bandeirante.nav("L") |> 
      ...> Bandeirantes.Bandeirante.nav("M") |>
      ...> Bandeirantes.Bandeirante.nav("L") |> 
      ...> Bandeirantes.Bandeirante.nav("M") |>
      ...> Bandeirantes.Bandeirante.nav("L") |> 
      ...> Bandeirantes.Bandeirante.nav("M") |>
      ...> Bandeirantes.Bandeirante.nav("L") |> 
      ...> Bandeirantes.Bandeirante.nav("M") |>
      ...> Bandeirantes.Bandeirante.nav("M") 
      %Bandeirantes.Bandeirante{
        nav_limit: %Bandeirantes.Coordinate{x: 5, y: 5},
        position: %Bandeirantes.Coordinate{x: 1, y: 3},
        nav_direction: "N"
      }
  """
  def nav(%Bandeirante{} = bandeirante, instruction) when instruction in ["L", "R"] do
    {:ok, direction} = bandeirante.nav_direction |> Compass.turn(instruction)
    %{bandeirante | nav_direction: direction}
  end

  def nav(%Bandeirante{} = bandeirante, instruction) when instruction === "M" do
    new_position = bandeirante.position |> Coordinate.move(bandeirante.nav_direction)
    %{bandeirante | position: new_position}
  end
end