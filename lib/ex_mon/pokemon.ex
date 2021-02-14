defmodule ExMon.Pokemon do
  @keys [:id, :name, :weight, :types]

  # torna as chaves obrigatorias
  @enforce_keys @keys

  # necessário para ser feito o json.encode
  @derive Jason.Encoder
  defstruct @keys

  def build(%{"id" => id, "name" => name, "weight" => weight, "types" => types}) do
    %__MODULE__{
      id: id,
      name: name,
      weight: weight,
      types: parse_types(types)
    }
  end

  defp parse_types(types), do: Enum.map(types, fn element -> element["type"]["name"] end)
end
