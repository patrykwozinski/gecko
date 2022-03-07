defmodule Gecko.MixProject do
  use Mix.Project

  @version "0.1.1"

  def project do
    [
      app: :gecko,
      name: "Gecko",
      description:
        "A tool to retrieve an information about cryptocurrency world from a CoinGecko.com",
      version: @version,
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package(),
      dialyzer: [
        plt_add_deps: :apps_direct,
        plt_add_apps: [],
        plt_ignore_apps: [:logger]
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger, :typed_struct]
    ]
  end

  defp deps do
    [
      {:typed_struct, "~> 0.2"},
      {:dialyxir, "~> 1.1", only: [:dev], runtime: false},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:httpoison, "~> 1.8"},
      {:poison, "~> 5.0"},
      {:ex_doc, ">= 0.25.2", only: :dev, runtime: false}
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: ["README.md"]
    ]
  end

  defp package do
    [
      name: "gecko",
      files: ~w(lib .formatter.exs mix.exs README*),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/patrykwozinski/gecko"}
    ]
  end
end
