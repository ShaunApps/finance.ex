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
    # If the beginning value is $10,000, the ending value is $19,500, and the number of periods is 3, the CAGR is 24.93%
    assert cagr(10000, 19500, 3) == 24.93
  end

  test "CI returns the correct value" do
    # If rate is 4.3%, the compoundings per period is 4, the principal is $1,500, and the number of periods is 6, the compound interest is $1,938.84
    assert ci(4.3, 4, 1500, 6) == 1938.84
  end

  test "DF returns the correct value" do
    # If rate is 10% and the number of periods is 6, the result is an array of discount factors: [1, 0.91, 0.827, 0.752, 0.684]
    assert df(10, 6) == [1, 0.91, 0.827, 0.752, 0.684]
  end

  test "FV returns the correct value" do
    # If rate is 0.5%, cash flow is $1,000, and the number of periods is 12, the FV is $1,061.68.
    assert fv(0.5, 1000, 12) == 1061.68
  end

  test "IRR returns the correct value" do
    # If initial investment is -$500,000 and the cash flows are $200,000, $300,000, and $200,000, IRR is 18.82%
    assert irr(-500000, 200000, 300000, 200000) == 18.82
  end

  
end
