defmodule ElixirApi do

  def main do
    request("https://api.coingecko.com/api/v3/exchange_rates")
    |> body
    |> boparse_bodydy
    |> get_list_tuple
    |> get_map_list
    |> create_msg
    |> show_msg

  end

  defp request(url,key) do
    HTTPotion.get url
  end

  defp body(response) do
    response.body
  end

  defp parse_body() do
    Poison.Paser.parse body
  end

  defp get_list_tuple(tuple) do
    elem(tuple,1)

  end

  defp get_map_list() do
    list |> Enum.at 0
  end

  defp create_msg() do
    " > # {map["name"] #map["symbol"]} the actual price is #map["price_usd"]} "
  end

  defp show_msg(message) do
    IO.puts message
  end
end
