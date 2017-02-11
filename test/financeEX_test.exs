defmodule FinanceEXTest do
  use ExUnit.Case
  doctest FinanceEX

  import FinanceEX

  test "AM returns the correct value when payment type is years and paysatbeginning" do
    assert am(20000, 7.5, 5, 0, 1) == 400.76
  end

  test "AM returns the correct value when payment type is months and paysatbeginning" do
    assert am(20000, 7.5, 5, 1, 1) == 400.76
  end

  # test "the truth" do
  #   assert 1 + 1 == 2
  # end
end
