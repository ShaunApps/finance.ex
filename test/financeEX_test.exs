defmodule FinanceEXTest do
  use ExUnit.Case
  doctest FinanceEX

  import FinanceEX

  test "AM returns the correct value when payment type is years (5 years here) and paysatbeginning == false" do
    assert am(20000, 7.5, 5, 0, 0) == 400.76
  end

  test "AM returns the correct value when payment type is months (so 60 months == 5 years) and paysatbeginning == false" do
    assert am(20000, 7.5, 60, 1, 0) == 400.76
  end

  test "CAGR returns the correct value" do
    assert cagr(10000, 19500, 3) == 24.93
  end

  # test "the truth" do
  #   assert 1 + 1 == 2
  # end
end
