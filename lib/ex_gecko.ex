defmodule ExGecko do
  @moduledoc """
  Documentation for `ExGecko`.

  It's an adapter for CoinGecko: cryptocurrency prices and market capitalization.
  """
  @default_endpoint "https://api.coingecko.com/api/v3"

  @type http_error :: {:error, {:http_error, any}}

  @spec ping :: :ok | http_error
  def ping do
    request_url("ping")
    |> HTTPoison.get()
    |> parse_response()
    |> case do
      {:ok, _response} -> :ok
      {:error, error} -> error
    end
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

  @spec coins_markets(coins_markets_params) :: {:ok, any()} | http_error()
  def coins_markets(params) do
    request_url("coins/markets", params)
    |> HTTPoison.get()
    |> parse_response()
  end

  @type coins_market_chart_params :: %{
          required(:coin_id) => String.t(),
          required(:vs_currency) => String.t(),
          required(:days) => pos_integer(),
          optional(:interval) => String.t()
        }

  @doc """
  Example input:
    %{
      coin_id: "bitcoin",
      vs_currency: "usd",
      days: 7,
      interval: "daily"
    }
  """
  @spec coins_market_chart(coins_market_chart_params) :: {:ok, map()} | http_error()
  def coins_market_chart(params = %{coin_id: coin_id}) do
    request_url("coins/#{coin_id}/market_chart", Map.delete(params, :coin_id))
    |> HTTPoison.get()
    |> parse_response()
  end

  defp request_url(endpoint) do
    Path.join(api_endpoint(), endpoint)
  end

  defp request_url(endpoint, data) when data == %{} do
    Path.join(api_endpoint(), endpoint)
  end

  defp request_url(endpoint, data) do
    base_url = request_url(endpoint)
    query_params = URI.encode_query(data)
    "#{base_url}?#{query_params}"
  end

  defp api_endpoint do
    System.get_env("COINGECKO_API_ENDPOINT") ||
      Application.get_env(:coingecko, :api_endpoint) ||
      @default_endpoint
  end

  defp parse_response({:error, err}) do
    {:error, {:http_error, err}}
  end

  defp parse_response({:ok, response = %{status_code: 200}}) do
    response.body
    |> Poison.decode()
  end

  defp parse_response({:ok, %{body: response_body}}) do
    message =
      response_body
      |> Poison.decode()
      |> elem(1)

    {:error, {:http_error, message}}
  end
end
