defmodule FinanceEX do

  def am(principal, rate, period, yearOrMonth, payAtBeginning) do
    ratePerPeriod = rate / 12 / 100
    numInterestAccruals = period * 12

    cond do
      yearOrMonth == 0 ->
        numerator = buildNumerator(numInterestAccruals, payAtBeginning, ratePerPeriod)
        denominator = :math.pow((1 + ratePerPeriod), numInterestAccruals) - 1
      yearOrMonth == 1 ->
        numerator = buildNumerator(period, payAtBeginning, ratePerPeriod)
        denominator = :math.pow((1 + ratePerPeriod), period) - 1
      true ->
        IO.puts "not defined"
    end

    am = principal * (numerator / denominator)
    am
  end

  defp buildNumerator(numInterestAccruals, payAtBeginning, ratePerPeriod) do
    if payAtBeginning do
      numInterestAccruals = numInterestAccruals - 1 #can't remember if -= is valid, too lazy right now to check
    end

    # :math.pow is an Erlang library
    ratePerPeriod * :math.pow((1 + ratePerPeriod), numInterestAccruals)
  end

end
