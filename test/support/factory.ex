defmodule DailyMeals.Factory do
  use ExMachina.Ecto, repo: DailyMeals.Repo

  alias DailyMeals.{Meal, User}

  def meal_params_factory do
    %{
      descricao: "Avocado",
      calorias: 300,
      data: "2021-03-28T13:59:13Z",
      user_id: "c08e7938-553b-4c07-ab32-69dbcf932bde"
    }
  end

  def meal_web_params_factory do
    %{
      "descricao" => "Avocado",
      "calorias" => 300,
      "data" => "2021-03-28T13:59:13Z",
      "user_id" => "c08e7938-553b-4c07-ab32-69dbcf932bde"
    }
  end

  def meal_factory do
    %Meal{
      id: "47d5430a-9569-40d7-9a33-222aaedb8e29",
      descricao: "Avocado",
      calorias: 300,
      data: ~U[2021-03-28 13:59:13Z],
      user_id: "c08e7938-553b-4c07-ab32-69dbcf932bde"
    }
  end

  def user_params_factory do
    %{
      nome: "Cassio",
      cpf: "12345678910",
      email: "cassio@email.com"
    }
  end

  def user_factory do
    %User{
      id: "c08e7938-553b-4c07-ab32-69dbcf932bde",
      nome: "Cassio",
      cpf: "12345678910",
      email: "cassio@email.com"
    }
  end
end
