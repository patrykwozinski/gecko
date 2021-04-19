defmodule ExGecko.Coins do
  @moduledoc false

  alias ExGecko.HttpClient

  @type error :: {:error, {:http_error | :request_error, String.t()}}

  @type list_params :: %{
          optional(:include_platform) => boolean()
        }

  @spec list() :: {:ok, list(map())} | error
  @spec list(list_params) :: {:ok, list(map())} | error
  def list do
    list(%{})
  end

  def list(params) do
    HttpClient.get("coins/list", params)
  end

  @type markets_params :: %{
          required(:vs_currency) => String.t(),
          optional(:ids) => String.t(),
          optional(:category) => String.t(),
          optional(:order) => String.t(),
          optional(:per_page) => pos_integer(),
          optional(:page) => pos_integer(),
          optional(:sparkline) => boolean(),
          optional(:price_change_percentage) => String.t()
        }

  @spec markets(markets_params) :: {:ok, any()} | error
  def markets(params) do
    HttpClient.get("coins/markets", params)
  end

  @type coins_params :: %{
          required(:id) => String.t(),
          optional(:localization) => String.t(),
          optional(:tickers) => boolean(),
          optional(:market_data) => boolean(),
          optional(:community_data) => boolean(),
          optional(:developer_data) => boolean(),
          optional(:sparkline) => boolean()
        }

  @spec coins(coins_params) :: {:ok, map()} | error
  def coins(params = %{id: id}) do
    params = Map.delete(params, :id)

    HttpClient.get("coins/#{id}", params)
  end

  @type tickers_params :: %{
          required(:id) => String.t(),
          optional(:exchange_ids) => String.t(),
          optional(:include_exchange_logo) => String.t(),
          optional(:page) => non_neg_integer(),
          optional(:order) => String.t(),
          optional(:depth) => String.t()
        }

  @spec tickers(tickers_params) :: {:ok, map()} | error
  def tickers(params = %{id: id}) do
    params = Map.delete(params, :id)

    HttpClient.get("coins/#{id}/tickers", params)
  end

  @type history_params :: %{
          required(:id) => String.t(),
          required(:date) => String.t(),
          optional(:localization) => String.t()
        }

  @spec history(history_params) :: {:ok, map()} | error
  def history(params = %{id: id}) do
    params = Map.delete(params, :id)

    HttpClient.get("coins/#{id}/history", params)
  end

  @type market_chart_params :: %{
          required(:id) => String.t(),
          required(:vs_currency) => String.t(),
          required(:days) => pos_integer(),
          optional(:interval) => String.t()
        }

  @spec market_chart(market_chart_params) :: {:ok, map()} | error
  def market_chart(params = %{id: id}) do
    params = Map.delete(params, :id)

    HttpClient.get("coins/#{id}/market_chart", params)
  end

  @type market_chart_range_params :: %{
          required(:id) => String.t(),
          required(:vs_currency) => String.t(),
          required(:from) => String.t(),
          required(:to) => String.t()
        }

  @spec market_chart_range(market_chart_range_params) :: {:ok, map()} | error
  def market_chart_range(params = %{id: id}) do
    params = Map.delete(params, :id)

    HttpClient.get("coins/#{id}/market_chart/range", params)
  end

  @type status_updates_params :: %{
          required(:id) => String.t(),
          optional(:per_page) => pos_integer(),
          optional(:page) => non_neg_integer()
        }

  @spec status_updates(status_updates_params) :: {:ok, map()} | error
  def status_updates(params = %{id: id}) do
    params = Map.delete(params, :id)

    HttpClient.get("coins/#{id}/status_updates", params)
  end

  @type ohlc_params :: %{
          required(:id) => String.t(),
          required(:vs_currency) => String.t(),
          optional(:days) => pos_integer()
        }

  @spec ohlc(ohlc_params) :: {:ok, map()} | error
  def ohlc(params = %{id: id}) do
    params = Map.delete(params, :id)

    HttpClient.get("coins/#{id}/ohlc", params)
  end
end
