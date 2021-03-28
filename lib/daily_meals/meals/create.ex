defmodule DailyMeals.Meals.Create do
  alias DailyMeals.{Error, Meal, Repo}

  def call(params) do
    params
    |> Meal.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Meal{}} = result), do: result

  defp handle_insert({:error, message}) do
    {:error, Error.build(:bad_request, message)}
  end
end
