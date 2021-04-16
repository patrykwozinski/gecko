defmodule ExGecko do
  @moduledoc """
  Documentation for `ExGecko`.

  It's an adapter for CoinGecko: cryptocurrency prices and market capitalization.

  More information: [Explore API](https://www.coingecko.com/en/api#explore-api)
  """
  alias ExGecko.HttpClient

  @type error :: {:error, {:http_error | :request_error, String.t()}}

  @spec ping() :: :ok | error
  def ping do
    HttpClient.get("ping")
    |> case do
      {:ok, _response} -> :ok
      error -> error
    end
  end

  @type simple_price_params :: %{
          required(:ids) => String.t(),
          required(:vs_currencies) => String.t(),
          optional(:include_market_cap) => boolean(),
          optional(:include_24hr_vol) => boolean(),
          optional(:include_24hr_change) => boolean(),
          optional(:include_last_updated_at) => boolean()
        }

  @spec simple_price(simple_price_params) :: {:ok, any()} | error
  def simple_price(params) do
    HttpClient.get("simple/price", params)
  end

  @type coins_markets_params :: %{
          required(:vs_currency) => String.t(),
          optional(:ids) => String.t(),
          optional(:category) => String.t(),
          optional(:order) => String.t(),
          optional(:per_page) => pos_integer(),
          optional(:page) => pos_integer(),
          optional(:sparkline) => boolean(),
          optional(:price_change_percentage) => String.t()
        }

  @spec coins_markets(coins_markets_params) :: {:ok, any()} | error
  def coins_markets(params) do
    HttpClient.get("coins/markets", params)
  end

  @type coins_market_chart_params :: %{
          required(:coin_id) => String.t(),
          required(:vs_currency) => String.t(),
          required(:days) => pos_integer(),
          optional(:interval) => String.t()
        }

  @spec coins_market_chart(coins_market_chart_params) :: {:ok, map()} | error
  def coins_market_chart(params = %{coin_id: coin_id}) do
    params = Map.delete(params, :coin_id)

    HttpClient.get("coins/#{coin_id}/market_chart", params)
  end
end
