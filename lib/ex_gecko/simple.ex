defmodule ExGecko.Simple do
  @moduledoc false

  alias ExGecko.HttpClient

  @type error :: {:error, {:http_error | :request_error, String.t()}}

  @type price_params :: %{
          required(:ids) => String.t(),
          required(:vs_currencies) => String.t(),
          optional(:include_market_cap) => boolean(),
          optional(:include_24hr_vol) => boolean(),
          optional(:include_24hr_change) => boolean(),
          optional(:include_last_updated_at) => boolean()
        }

  @spec price(price_params) :: {:ok, any()} | error
  def price(params) do
    HttpClient.get("simple/price", params)
  end

  @type token_price_params :: %{
          required(:id) => String.t(),
          required(:contract_addresses) => String.t(),
          required(:vs_currencies) => String.t(),
          optional(:include_market_cap) => boolean(),
          optional(:include_24hr_vol) => boolean(),
          optional(:include_24hr_change) => boolean(),
          optional(:include_last_updated_at) => boolean()
        }

  @spec token_price(token_price_params) :: {:ok, any()} | error
  def token_price(params = %{id: id}) do
    params = Map.delete(params, :id)

    HttpClient.get("simple/token_price/#{id}", params)
  end

  @spec supported_vs_currencies() :: {:ok, list(String.t())} | error
  def supported_vs_currencies do
    HttpClient.get("simple/supported_vs_currencies")
  end
end
