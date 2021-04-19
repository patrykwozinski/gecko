defmodule ExGecko.Contract do
  @moduledoc false

  alias ExGecko.HttpClient

  @type error :: {:error, {:http_error | :request_error, String.t()}}

  @type contract_params :: %{
          required(:id) => String.t(),
          required(:contract_address) => String.t()
        }

  @spec contract(contract_params) :: {:ok, map()} | error
  def contract(%{id: id, contract_address: contract_address}) do
    HttpClient.get("coins/#{id}/contract/#{contract_address}")
  end

  @type market_chart_params :: %{
          required(:id) => String.t(),
          required(:contract_address) => String.t(),
          required(:vs_currency) => String.t(),
          required(:days) => String.t()
        }

  @spec market_chart(market_chart_params) :: {:ok, map()} | error
  def market_chart(params = %{id: id, contract_address: contract_address}) do
    params =
      params
      |> Map.delete(:id)
      |> Map.delete(:contract_address)

    HttpClient.get("coins/#{id}/contract/#{contract_address}/market_chart", params)
  end

  @type market_chart_range_params :: %{
          required(:id) => String.t(),
          required(:contract_address) => String.t(),
          required(:vs_currency) => String.t(),
          required(:from) => String.t(),
          required(:to) => String.t()
        }

  @spec market_chart_range(market_chart_range_params) :: {:ok, map()} | error
  def market_chart_range(params = %{id: id, contract_address: contract_address}) do
    params =
      params
      |> Map.delete(:id)
      |> Map.delete(:contract_address)

    HttpClient.get("coins/#{id}/contract/#{contract_address}/market_chart/range", params)
  end
end
