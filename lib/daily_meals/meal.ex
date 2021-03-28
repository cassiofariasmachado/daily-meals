defmodule DailyMeals.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @create_params [:descricao, :data, :calorias]
  @update_params @create_params

  @derive {Jason.Encoder, only: [:id, :descricao, :data, :calorias]}

  schema "meals" do
    field :descricao, :string
    field :data, :utc_datetime
    field :calorias, :integer

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> handle_changes(params, @create_params)
  end

  def changeset(struct, params) do
    struct
    |> handle_changes(params, @update_params)
  end

  defp handle_changes(struct, params, fields) do
    struct
    |> cast(params, fields)
    |> validate_required(fields)
  end
end
