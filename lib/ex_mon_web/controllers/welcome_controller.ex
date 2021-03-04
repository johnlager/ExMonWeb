defmodule ExMonWeb.WelcomeController do
  # fornece todo o ferralmental necessário para uma controller
  use ExMonWeb, :controller

  # o phx sempre recebe uma conexao e a devolve
  def index(conn, _params) do
    IO.inspect(conn)
    text(conn, "Welcome to my first Phoenix API!!! :) https://github.com/johnlager/ExMonWeb")
  end
end
