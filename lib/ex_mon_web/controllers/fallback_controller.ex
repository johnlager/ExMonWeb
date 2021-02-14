defmodule ExMonWeb.FallbackController do
  use ExMonWeb, :controller

  # quando criamos uma view, somos obrigados a criar uma view com o mesmo nome do controller
  # porém utilizaremos o fallback controller para lidar com todos erros do programa
  # vamos usar o "render()"
  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ExMonWeb.ErrorView)
    |> render("400.json", result: result)
  end

end
