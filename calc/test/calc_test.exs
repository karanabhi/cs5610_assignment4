defmodule CalcTest do
  use ExUnit.Case
  #doctest Calc

  test "test1" do
    assert Calc.eval("100 - 10") == :ok
  end

  test "test2" do
    assert Calc.eval("100 - 10 + 250") == :ok
  end
end
