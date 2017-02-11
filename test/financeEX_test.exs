defmodule FinanceEXTest do
  use ExUnit.Case
  doctest FinanceEX

  import FinanceEX

  test "AM returns the correct value" do
    assert am(20000, 7.5, 5, 0, 1) == 400.76
  end

  # test "the truth" do
  #   assert 1 + 1 == 2
  # end
end
