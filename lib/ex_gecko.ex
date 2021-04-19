defmodule ExGecko do
  @moduledoc """
  Documentation for `ExGecko`.

  It's an adapter for CoinGecko: cryptocurrency prices and market capitalization.

  More information: [Explore API](https://www.coingecko.com/en/api#explore-api)
  """
  alias ExGecko.HttpClient

  @type error :: {:error, {:http_error | :request_error, String.t()}}

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

  @type contract_params :: %{
          required(:id) => String.t(),
          required(:contract_address) => String.t()
        }

  @spec contract(contract_params) :: {:ok, map()} | error
  def contract(%{id: id, contract_address: contract_address}) do
    HttpClient.get("coins/#{id}/contract/#{contract_address}")
  end

  @type contract_market_chart_params :: %{
          required(:id) => String.t(),
          required(:contract_address) => String.t(),
          required(:vs_currency) => String.t(),
          required(:days) => String.t()
        }

  @spec contract_market_chart(contract_market_chart_params) :: {:ok, map()} | error
  def contract_market_chart(params = %{id: id, contract_address: contract_address}) do
    params =
      params
      |> Map.delete(:id)
      |> Map.delete(:contract_address)

    HttpClient.get("coins/#{id}/contract/#{contract_address}/market_chart", params)
  end

  @type contract_market_chart_range_params :: %{
          required(:id) => String.t(),
          required(:contract_address) => String.t(),
          required(:vs_currency) => String.t(),
          required(:from) => String.t(),
          required(:to) => String.t()
        }

  @spec contract_market_chart_range(contract_market_chart_range_params) :: {:ok, map()} | error
  def contract_market_chart_range(params = %{id: id, contract_address: contract_address}) do
    params =
      params
      |> Map.delete(:id)
      |> Map.delete(:contract_address)

    HttpClient.get("coins/#{id}/contract/#{contract_address}/market_chart/range", params)
  end
end
