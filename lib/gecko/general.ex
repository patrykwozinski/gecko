defmodule Gecko.General do
  @moduledoc false

  alias Gecko.HttpClient

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
