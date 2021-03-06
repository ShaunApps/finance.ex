defmodule FinanceEX do

  # Amoritization
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

  # Compound Annual Growth Rate (cagr)
  def cagr(beginning_value, ending_value, num_of_periods) do
    value = :math.pow((ending_value / beginning_value), 1 / num_of_periods) - 1
    Float.round(((value * 10000) / 100), 2)
  end

  # Compund Interest (ci)
  def ci(rate, num_of_compoundings, principal, num_of_periods) do
    value = principal * :math.pow((1 + ((rate / 100) / num_of_compoundings)), num_of_compoundings * num_of_periods)
    Float.round(((value * 100) / 100), 2)
  end

  # Discount Factor (DF)
  # this definitely looks bad, needs refactoring
  def df(rate, num_of_periods) do
    Enum.map(1..(num_of_periods - 1), fn x ->
      Float.ceil( (((1 / :math.pow((1 + rate/100), (x - 1))) * 1000)/ 1000), 3)
    end)
  end

  # Future Value (FV)
  def fv(rate, cf0, num_of_period) do
    fv = cf0 * :math.pow((1 + (rate / 100)), num_of_period)
    Float.round(fv * 100) / 100
  end

  # Internal Rate of Return (IRR)
  # def irr(cfs) do
  #
  # end
  #
  # # defp seek_zero(function) do
  # #   x = 1
  # #
  # # end
  #
  # def xirr(cfs, dts, guess) do
  #
  # end

  # Leverage Ratio (LR)
  def lr(total_liabilities, total_debts, total_income) do
    (total_liabilities + total_debts) / total_income
  end

  # Net Present Value (NPV)
  def npv(rate, initial_investment, values \\ []) do
    rate = rate/100
    value = Enum.reduce(values, initial_investment, fn(x, acc) ->
      acc + ( x / :math.pow((1 + rate), (Enum.find_index(values, fn(y) -> y == x end )) + 2 ))
    end)
    Float.round(((value * 100) / 100), 2)
  end

  # Payback Period (PP)

  # Present Value (PV)

  # Profitability Index (PI)

  # Return on Investment (ROI)
  def roi(cf0, earnings) do
    value = (earnings - Kernel.abs(cf0)) / Kernel.abs(cf0) * 100
    Float.round(value, 2)
  end

  # Rule of 72 (r72)
  def r72(rate) do
    72 / rate
  end

  # Weighted Average Cost of Capital (WACC)
  def wacc(market_value_of_equity, market_value_of_debt, cost_of_equity, cost_of_debt, tax_rate) do
    v = market_value_of_equity + market_value_of_debt
    # pattern match values for readability
    [e, d, re, rd, t] = [market_value_of_equity, market_value_of_debt, cost_of_equity, cost_of_debt, tax_rate]
    value = ((e / v) * re/100) + (((d / v) * rd/100) * (1 - t/100))
    Float.round(((value * 1000) / 10), 2)
  end

  # Loan Payment Per Period (PMT)
  def pmt(fractional_rate, num_of_payments, principal) do
    Float.round(-principal * fractional_rate/(1 - :math.pow(1 + fractional_rate, -num_of_payments)), 4)
  end

  # Inflation-adjusted Return (IAR)
  def iar(investment_return, inflation_rate) do
    Float.round(100 * (((1 + investment_return) / (1 + inflation_rate)) - 1), 2)
  end



end
