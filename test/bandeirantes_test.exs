defmodule BandeirantesTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "outputs" do
    assert capture_io(fn -> Bandeirantes.main("teste") end) == "teste\n"
  end
end
