defmodule ExMonWeb.PokemonsController do
  use ExMonWeb, :controller

  action_fallback ExMonWeb.FallbackController

  def show(conn, %{"name" => name}) do
    name
    |> ExMon.fetch_pokemon()
    |> handle_response(conn)
  end

  defp handle_response({:ok, pokemon}, conn) do
    conn
    |> put_status(:ok)
    |> json(pokemon) # para o json encode precisa ser uma estrutura específica, caso seja struct precisamos declarar na struct com Jason.Encoder
  end

  defp handle_response({:error, _reason} = error, _con), do: error
end
