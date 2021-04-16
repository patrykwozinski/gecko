# ExGecko [![Build Status](https://github.com/patrykwozinski/ex-gecko/workflows/CI/badge.svg)](https://github.com/patrykwozinski/ex-gecko/actions) [![Hex pm](https://img.shields.io/hexpm/v/ex-gecko.svg?style=flat)](https://hex.pm/packages/ex-gecko)

This package is an adapter for using [CoinGecko](https://coingecko.com). Still under development.

## Installation

The package can be installed by adding `ex_gecko` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_gecko, "~> 0.1.0"}
  ]
end
```


## Supported endpoints
In a current version we're not supporting all CoinGecko's endpoints yet. There is a list of currently supported:
- `api/v3/ping`
- `api/v3/coins/markets`
- `api/v3/coins/{coinId}/market_chart`
