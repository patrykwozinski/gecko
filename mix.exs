defmodule ExGecko.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_gecko,
      name: "ExGecko",
      description: "A tool to retrieve an information about cryptocurrency world from a CoinGecko.com",
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:typed_struct, "~> 0.2"},
      {:dialyxir, "~> 1.1", only: [:dev], runtime: false},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:httpoison, "~> 1.8"},
      {:poison, "~> 4.0"}
    ]
  end
end
