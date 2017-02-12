defmodule FinanceEX do

  # Amoritization function
  def am(principal, rate, period, yearOrMonth, payAtBeginning) do
    ratePerPeriod = rate / 12 / 100
    numInterestAccruals = period * 12

    numerator =
      case yearOrMonth do
        0 -> buildNumerator(numInterestAccruals, payAtBeginning, ratePerPeriod)
        1 -> buildNumerator(period, payAtBeginning, ratePerPeriod)
        _ -> IO.puts "not defined"
      end

    denominator =
      case yearOrMonth do
        0 -> :math.pow((1 + ratePerPeriod), numInterestAccruals) - 1
        1 -> :math.pow((1 + ratePerPeriod), period) - 1
        _ -> IO.puts "not defined"
      end

    Float.round((principal * (numerator / denominator)), 2)
  end

  # function used to calculate numerator for Amorization function
  defp buildNumerator(numInterestAccruals, payAtBeginning, ratePerPeriod) do

    numInterestAccruals =
      case payAtBeginning do
        1 -> numInterestAccruals - 1
        _ -> numInterestAccruals
      end

    # :math.pow is an Erlang library
    ratePerPeriod * :math.pow((1 + ratePerPeriod), numInterestAccruals)
  end

  # Compound Annual Growth Rate
  def cagr(beginning_value, ending_value, num_of_periods) do
    value = :math.pow((ending_value / beginning_value), 1 / num_of_periods) - 1
    Float.round(((value * 10000) / 100), 2)
  end


end
