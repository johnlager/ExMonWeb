defmodule ExMonWeb.TrainersView do
  use ExMonWeb, :view

  alias ExMon.Trainer

  # as views servem para formatar os dados do response

  def render("create.json", %{trainer: %Trainer{id: id, name: name, inserted_at: inserted_at}}) do
    %{
      message: "Trainer created",
      trainer: %{
        id: id,
        name: name,
        inserted_at: inserted_at
      }
    }
  end

  def render("show.json", %{trainer: %Trainer{id: id, name: name, inserted_at: inserted_at}}) do
    %{
      message: "trainer requested",
      trainer: %{
        id: id,
        name: name,
        inserted_at: inserted_at
      }
    }
  end

  def render("update.json", %{
        trainer: %Trainer{id: id, name: name, inserted_at: inserted_at, updated_at: updated_at }
      }) do
    %{
      message: "trainer updated",
      trainer: %{
        id: id,
        name: name,
        inserted_at: inserted_at,
        updated_at: updated_at
      }
    }
  end
end
