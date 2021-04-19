defmodule Gecko.HttpClient do
  @moduledoc """
  This module represents Http connection to the CoinGecko API V3.
  """

  @default_endpoint "https://api.coingecko.com/api/v3"

  @type error :: {:error, {:http_error | :request_error, String.t()}}

  @spec get(String.t(), map()) :: {:ok, any()} | error()
  def get(endpoint, params \\ %{}) do
    request_url(endpoint, params)
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

    {:error, {:request_error, message}}
  end
end
