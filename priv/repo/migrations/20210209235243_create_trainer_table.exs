defmodule ExMon.Repo.Migrations.CreateTrainerTable do
  use Ecto.Migration

  def change do
    create table(:trainers, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :password_hash, :string
      # faz todo o tramite de "inserted_at" e etc..
      timestamps()
    end

  end
end
