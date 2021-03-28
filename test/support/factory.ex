defmodule DailyMeals.Factory do
  use ExMachina.Ecto, repo: DailyMeals.Repo

  alias DailyMeals.Meal

  def meal_params_factory do
    %{
      descricao: "Avocado",
      calorias: 300,
      data: "2021-03-28T13:59:13Z"
    }
  end

  def meal_web_params_factory do
    %{
      "descricao" => "Avocado",
      "calorias" => 300,
      "data" => "2021-03-28T13:59:13Z"
    }
  end

  def meal_factory do
    %Meal{
      id: "47d5430a-9569-40d7-9a33-222aaedb8e29",
      descricao: "Avocado",
      calorias: 300,
      data: ~U[2021-03-28 13:59:13Z]
    }
  end
end
