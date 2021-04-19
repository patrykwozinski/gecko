defmodule ExGecko do
  @moduledoc """
  Documentation for `ExGecko`.

  It's an adapter for CoinGecko: cryptocurrency prices and market capitalization.

  More information: [Explore API](https://www.coingecko.com/en/api#explore-api)
  """

  defdelegate ping, to: ExGecko.General

  defdelegate simple_price(params), to: ExGecko.Simple, as: :price
  defdelegate simple_token_price(params), to: ExGecko.Simple, as: :token_price
  defdelegate simple_supported_vs_currencies, to: ExGecko.Simple, as: :supported_vs_currencies

  defdelegate coins_list, to: ExGecko.Coins, as: :list
  defdelegate coins_list(params), to: ExGecko.Coins, as: :list
  defdelegate coins_markets(params), to: ExGecko.Coins, as: :markets
  defdelegate coins(params), to: ExGecko.Coins, as: :coins
  defdelegate coins_tickers(params), to: ExGecko.Coins, as: :tickers
  defdelegate coins_history(params), to: ExGecko.Coins, as: :history
  defdelegate coins_market_chart(params), to: ExGecko.Coins, as: :market_chart
  defdelegate coins_market_chart_range(params), to: ExGecko.Coins, as: :market_chart_range
  defdelegate coins_status_updates(params), to: ExGecko.Coins, as: :status_updates
  defdelegate coins_ohlc(params), to: ExGecko.Coins, as: :ohlc

  defdelegate contract(params), to: ExGecko.Contract, as: :contract
  defdelegate contract_market_chart(params), to: ExGecko.Contract, as: :market_chart
  defdelegate contract_market_chart_range(params), to: ExGecko.Contract, as: :market_chart_range
end
