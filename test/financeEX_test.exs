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

  test "CI returns the correct value" do
    assert ci(4.3, 4, 1500, 6) == 1938.84
  end

  test "DF returns the correct value" do
    assert df(10, 6) == [1, 0.91, 0.827, 0.752, 0.684]
  end

  # test "the truth" do
  #   assert 1 + 1 == 2
  # end
end
