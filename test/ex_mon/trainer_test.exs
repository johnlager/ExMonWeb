defmodule ExMon.TrainerTest do
  use ExMon.DataCase

  alias ExMon.Trainer

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "John", password: "123456"}

      response = Trainer.changeset(params)

      expected_response = %Ecto.Changeset{
        action: nil,
        changes: %{name: "John", password: "123456"},
        errors: [],
        data: %ExMon.Trainer{},
        valid?: true
      }

      assert expected_response = response
    end

    test "when there are invalid params, returns an invalid changeset" do
      params = %{name: "John", password: "123"}

      response = Trainer.changeset(params)

      expected_response = %Ecto.Changeset{
        action: nil,
        changes: %{name: "John", password: "123"},
        errors: [
          password:
            {"should be at least %{count} character(s)",
             [count: 6, validation: :length, kind: :min, type: :string]}
        ],
        data: %ExMon.Trainer{},
        valid?: false
      }

      assert expected_response = response
    end
  end

  describe "build/1" do
    test "when all the params are valid, returns a trainer struct" do
      params = %{name: "John", password: "123456"}

      response = Trainer.build(params)

      expected_response = {:ok, %Trainer{name: "John", password: "12345"}}

      assert response = expected_response
    end

    test "when there are invalid params, returns an error" do
      params = %{name: "John", password: "12"}

      { :error, response } = Trainer.build(params)

      expected_changeset = %Ecto.Changeset{ valid?: false }

      assert response = expected_changeset

      assert errors_on(response) == %{name: ["can't be blank"]}

    end
  end
end
