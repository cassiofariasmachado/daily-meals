defmodule DailyMeals.Repo.Migrations.CreateMealsTable do
  use Ecto.Migration

  def change do
    create table :meals do
      add :descricao, :string
      add :data, :utc_datetime
      add :calorias, :integer

      timestamps()
    end
  end
end
