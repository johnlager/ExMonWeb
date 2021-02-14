defmodule ExMon.Trainer do
  use Ecto.Schema
  import Ecto.Changeset

  alias ExMon.Trainer.Pokemon

  @primary_key {:id, Ecto.UUID, autogenerate: true }

  # virutal: true = campo que existe apenas no schema, e nao no banco
  # porque o banco vai salvar apenas o hash da senha
  schema "trainers" do
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    has_many(:pokemon, Pokemon)
    timestamps()
  end

  @required_params [:name, :password]

  # serve para validar antes da validacao do banco
  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params), do: create_changeset(%__MODULE__{}, params)
  def changeset(trainer, params), do: create_changeset(trainer, params)

  def create_changeset(module_or_trainer, params) do
    module_or_trainer
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password, min: 6)
    |> put_pass_hash()
  end

  # se o changeset for valido, ele pega o changes
  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    # adiona uma change, no changes do changeset hehe
    change(changeset, Argon2.add_hash(password))
  end

  defp put_pass_hash(changeset), do: changeset
end
