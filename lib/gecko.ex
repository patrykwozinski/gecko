defmodule Gecko do
  @moduledoc """
  Documentation for `Gecko`.

  It's an adapter for CoinGecko: cryptocurrency prices and market capitalization.

  More information: [Explore API](https://www.coingecko.com/en/api#explore-api)
  """

  defdelegate ping, to: Gecko.General

  defdelegate simple_price(params), to: Gecko.Simple, as: :price
  defdelegate simple_token_price(params), to: Gecko.Simple, as: :token_price
  defdelegate simple_supported_vs_currencies, to: Gecko.Simple, as: :supported_vs_currencies

  defdelegate coins_list, to: Gecko.Coins, as: :list
  defdelegate coins_list(params), to: Gecko.Coins, as: :list
  defdelegate coins_markets(params), to: Gecko.Coins, as: :markets
  defdelegate coins(params), to: Gecko.Coins, as: :coins
  defdelegate coins_tickers(params), to: Gecko.Coins, as: :tickers
  defdelegate coins_history(params), to: Gecko.Coins, as: :history
  defdelegate coins_market_chart(params), to: Gecko.Coins, as: :market_chart
  defdelegate coins_market_chart_range(params), to: Gecko.Coins, as: :market_chart_range
  defdelegate coins_status_updates(params), to: Gecko.Coins, as: :status_updates
  defdelegate coins_ohlc(params), to: Gecko.Coins, as: :ohlc

  defdelegate contract(params), to: Gecko.Contract, as: :contract
  defdelegate contract_market_chart(params), to: Gecko.Contract, as: :market_chart
  defdelegate contract_market_chart_range(params), to: Gecko.Contract, as: :market_chart_range
end
