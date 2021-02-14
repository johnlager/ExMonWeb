defmodule ExMon.Trainer.Pokemon.Get do

  alias ExMon.{ Trainer.Pokemon, Repo }
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format"}
      {:ok, uuid} -> show(uuid)
    end
  end

  # o Repo.preload() retorna os dados do banco com suas respectivas relações
  defp show(uuid) do
    case Repo.get(Pokemon, uuid) do
      nil -> {:error, "Pokemon not found"}
      pokemon -> {:ok, Repo.preload(pokemon, :trainer)}
    end
  end

end
