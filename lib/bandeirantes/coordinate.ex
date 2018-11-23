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
end