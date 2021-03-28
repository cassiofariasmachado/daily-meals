defmodule DailyMeals.Meals.Get do
  alias DailyMeals.{Error, Meal, Repo}

  def by_id(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build_meal_not_found()}
      meal -> {:ok, meal}
    end
  end
end
