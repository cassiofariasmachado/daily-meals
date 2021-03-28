defmodule DailyMeals do
  @moduledoc """
  DailyMeals keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias DailyMeals.Meals.Create, as: CreateMeal
  alias DailyMeals.Meals.Delete, as: DeleteMeal
  alias DailyMeals.Meals.Get, as: GetMeal
  alias DailyMeals.Meals.Update, as: UpdateMeal

  defdelegate create_meal(params), to: CreateMeal, as: :call
  defdelegate delete_meal(id), to: DeleteMeal, as: :call
  defdelegate update_meal(params), to: UpdateMeal, as: :call
  defdelegate get_meal_by_id(id), to: GetMeal, as: :by_id
end
