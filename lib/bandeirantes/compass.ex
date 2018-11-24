defmodule Bandeirantes.Compass do
  @doc """
    ## Examples

      iex> Bandeirantes.Compass.turn("N", "L")
      {:ok, "W"}

      iex> Bandeirantes.Compass.turn("N", "R")
      {:ok, "E"}

      iex> Bandeirantes.Compass.turn("E", "L")
      {:ok, "N"}

      iex> Bandeirantes.Compass.turn("E", "R")
      {:ok, "S"}

      iex> Bandeirantes.Compass.turn("S", "L")
      {:ok, "E"}

      iex> Bandeirantes.Compass.turn("S", "R")
      {:ok, "W"}

      iex> Bandeirantes.Compass.turn("W", "L")
      {:ok, "S"}

      iex> Bandeirantes.Compass.turn("W", "R")
      {:ok, "N"}

  """
  def turn("N", "L"), do: {:ok, "W"}
  def turn("N", "R"), do: {:ok, "E"}
  def turn("E", "L"), do: {:ok, "N"}
  def turn("E", "R"), do: {:ok, "S"}
  def turn("S", "L"), do: {:ok, "E"}
  def turn("S", "R"), do: {:ok, "W"}
  def turn("W", "L"), do: {:ok, "S"}
  def turn("W", "R"), do: {:ok, "N"}
end
