defmodule ExGecko.General do
  @moduledoc false

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
end
