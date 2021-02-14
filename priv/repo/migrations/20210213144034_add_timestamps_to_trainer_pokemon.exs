defmodule ExMon.Repo.Migrations.AddTimestampsToTrainerPokemon do
  use Ecto.Migration

  def change do
    alter table("pokemons") do
      timestamps()
    end
  end
end
