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

  @type simple_token_price_params :: %{
          required(:id) => String.t(),
          required(:contract_addresses) => String.t(),
          required(:vs_currencies) => String.t(),
          optional(:include_market_cap) => boolean(),
          optional(:include_24hr_vol) => boolean(),
          optional(:include_24hr_change) => boolean(),
          optional(:include_last_updated_at) => boolean()
        }

  @spec simple_token_price(simple_token_price_params) :: {:ok, any()} | error
  def simple_token_price(params = %{id: id}) do
    params = Map.delete(params, :id)

    HttpClient.get("simple/token_price/#{id}", params)
  end

  @spec simple_supported_vs_currencies() :: {:ok, list(String.t())} | error
  def simple_supported_vs_currencies do
    HttpClient.get("simple/supported_vs_currencies")
  end

  @type coins_list_params :: %{
          optional(:include_platform) => boolean()
        }

  @spec coins_list() :: {:ok, list(map())} | error
  @spec coins_list(coins_list_params) :: {:ok, list(map())} | error
  def coins_list do
    coins_list(%{})
  end

  def coins_list(params) do
    HttpClient.get("coins/list", params)
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
          required(:id) => String.t(),
          required(:vs_currency) => String.t(),
          required(:days) => pos_integer(),
          optional(:interval) => String.t()
        }

  @spec coins_market_chart(coins_market_chart_params) :: {:ok, map()} | error
  def coins_market_chart(params = %{id: id}) do
    params = Map.delete(params, :id)

    HttpClient.get("coins/#{id}/market_chart", params)
  end

  @type coins_params :: %{
    required(:id) => String.t(),
    optional(:localization) => String.t(),
    optional(:tickers) => boolean(),
    optional(:market_data) => boolean(),
    optional(:community_data) => boolean(),
    optional(:developer_data) => boolean(),
    optional(:sparkline) => boolean(),
  }

  @spec coins(coins_params) :: {:ok, map()} | error
  def coins(params = %{id: id}) do
    params = Map.delete(params, :id)

    HttpClient.get("coins/#{id}", params)
  end
end
