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

  def new({x, y}, {max_x, max_y}) when x > max_x or y > max_y do
    {:error, :gets_navigation_limit}
  end

  def new({x, y}, _max), do: new({x, y})

  @doc """
    ## Examples

      iex> {:ok, coordinate} = Bandeirantes.Coordinate.new({0,0})
      iex> {:ok, limit} = Bandeirantes.Coordinate.new({5,5})
      iex> coordinate |> Bandeirantes.Coordinate.move("N", limit)
      %Bandeirantes.Coordinate{x: 0, y: 1}

      iex> {:ok, coordinate} = Bandeirantes.Coordinate.new({0,0})
      iex> {:ok, limit} = Bandeirantes.Coordinate.new({5,5})
      iex> coordinate |> Bandeirantes.Coordinate.move("E", limit)
      %Bandeirantes.Coordinate{x: 1, y: 0}

      iex> {:ok, coordinate} = Bandeirantes.Coordinate.new({1,2})
      iex> {:ok, limit} = Bandeirantes.Coordinate.new({5,5})
      iex> coordinate |> Bandeirantes.Coordinate.move("S", limit)
      %Bandeirantes.Coordinate{x: 1, y: 1}

      iex> {:ok, coordinate} = Bandeirantes.Coordinate.new({3,2})
      iex> {:ok, limit} = Bandeirantes.Coordinate.new({5,5})
      iex> coordinate |> Bandeirantes.Coordinate.move("W", limit)
      %Bandeirantes.Coordinate{x: 2, y: 2}

      iex> {:ok, coordinate} = Bandeirantes.Coordinate.new({5,4})
      iex> {:ok, limit} = Bandeirantes.Coordinate.new({5,5})
      iex> coordinate |> Bandeirantes.Coordinate.move("E", limit)
      {:error, :gets_navigation_limit}

  """
  def move(%Coordinate{x: x, y: y}, "N", %Coordinate{} = max) do
    with {:ok, new_coordinate} <- Coordinate.new({x, y+1}, {max.x, max.y}),
      do: new_coordinate
  end

  def move(%Coordinate{x: x, y: y}, "E", %Coordinate{} = max) do
    with {:ok, new_coordinate} <- Coordinate.new({x+1, y}, {max.x, max.y}),
      do: new_coordinate
  end
  
  def move(%Coordinate{x: x, y: y}, "S", %Coordinate{} = max) do
    with {:ok, new_coordinate} <- Coordinate.new({x, y-1}, {max.x, max.y}),
      do: new_coordinate
  end

  def move(%Coordinate{x: x, y: y}, "W", %Coordinate{} = max) do
    with {:ok, new_coordinate} <- Coordinate.new({x-1, y}, {max.x, max.y}),
      do: new_coordinate
  end
end