# Gecko [![Build Status](https://github.com/patrykwozinski/gecko/workflows/CI/badge.svg)](https://github.com/patrykwozinski/gecko/actions) [![Hex pm](https://img.shields.io/hexpm/v/gecko.svg?style=flat)](https://hex.pm/packages/gecko)

This package is an adapter for using [CoinGecko](https://coingecko.com). Still under development.

## Installation

The package can be installed by adding `gecko` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:gecko, "~> 0.1"}
  ]
end
```


## Supported endpoints
In a current version we're not supporting all CoinGecko's endpoints yet. There is a list of currently supported:
#### Global
- `api/v3/ping`

#### Simple
- `api/v3/simple/price`
- `api/v3/simple/token_price/{id}`
- `api/v3/simple/supported_vs_currencies`

#### Coins
- `api/v3/coins/list`
- `api/v3/coins/markets`
- `api/v3/coins/{id}`
- `api/v3/coins/{id}/tickers`
- `api/v3/coins/{id}/history`
- `api/v3/coins/{id}/market_chart`
- `api/v3/coins/{id}/market_chart/range`
- `api/v3/coins/{id}/status_updates`
- `api/v3/coins/{id}/ohlc`

#### Contract
- `api/v3/coins/{id}/contract/{contract_address}`
- `api/v3/coins/{id}/contract/{contract_address}/market_chart`
- `api/v3/coins/{id}/contract/{contract_address}/market_chart_range`
