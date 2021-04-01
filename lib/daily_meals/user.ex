defmodule DailyMeals.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias DailyMeals.Meal

  @primary_key {:id, :binary_id, autogenerate: true}

  @create_params [:nome, :cpf, :email]
  @update_params @create_params

  @derive {Jason.Encoder, only: [:id, :nome, :cpf, :email]}

  schema "users" do
    field :nome, :string
    field :cpf, :string
    field :email, :string

    has_many :daily_meals, Meal

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
