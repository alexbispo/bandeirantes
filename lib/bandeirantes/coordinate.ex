defmodule Bandeirantes.Coordinate do
  alias __MODULE__

  @enforce_keys [:x, :y] 
  defstruct [:x, :y]

  @min_position 0
  
  @doc """
    ## Examples

      iex> Bandeirantes.Coordinate.new({1,2})
      {:ok, %Bandeirantes.Coordinate{x: 1, y: 2}}

      iex> Bandeirantes.Coordinate.new({-1,2})
      {:ok, :invalid_position}

      iex> Bandeirantes.Coordinate.new({1,-2})
      {:ok, :invalid_position}

  """
  def new({x, y}) when x < @min_position or y < @min_position do
    {:ok, :invalid_position}
  end

  def new({x, y}) do
    {:ok, %Coordinate{x: x, y: y}}
  end

  @doc """
    ## Examples

      iex> {:ok, coordinate} = Bandeirantes.Coordinate.new({0,0})
      iex> coordinate |> Bandeirantes.Coordinate.move("N")
      %Bandeirantes.Coordinate{x: 0, y: 1}

      iex> {:ok, coordinate} = Bandeirantes.Coordinate.new({0,0})
      iex> coordinate |> Bandeirantes.Coordinate.move("E")
      %Bandeirantes.Coordinate{x: 1, y: 0}

      iex> {:ok, coordinate} = Bandeirantes.Coordinate.new({1,2})
      iex> coordinate |> Bandeirantes.Coordinate.move("S")
      %Bandeirantes.Coordinate{x: 1, y: 1}

      iex> {:ok, coordinate} = Bandeirantes.Coordinate.new({3,2})
      iex> coordinate |> Bandeirantes.Coordinate.move("W")
      %Bandeirantes.Coordinate{x: 2, y: 2}

  """
  def move(%Coordinate{x: x, y: y}, "N") do
    {:ok, new_coordinate} = Coordinate.new({x, y+1})
    new_coordinate
  end

  def move(%Coordinate{x: x, y: y}, "E") do
    {:ok, new_coordinate} = Coordinate.new({x+1, y})
    new_coordinate
  end
  
  def move(%Coordinate{x: x, y: y}, "S") do
    {:ok, new_coordinate} = Coordinate.new({x, y-1})
    new_coordinate
  end

  def move(%Coordinate{x: x, y: y}, "W") do
    {:ok, new_coordinate} = Coordinate.new({x-1, y})
    new_coordinate
  end
end