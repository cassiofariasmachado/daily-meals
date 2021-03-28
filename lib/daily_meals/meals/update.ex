defmodule DailyMeals.Meals.Update do
  alias DailyMeals.{Error, Meal, Repo}

  def call(%{"id" => id} = params) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build_meal_not_found()}
      meal -> handle_update(meal, params)
    end
  end

  defp handle_update(meal, params) do
    meal
    |> Meal.changeset(params)
    |> Repo.update()
  end
end
