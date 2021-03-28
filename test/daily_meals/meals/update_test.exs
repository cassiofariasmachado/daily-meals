defmodule DailyMeals.Meals.UpdateTest do
  use DailyMeals.DataCase, async: true

  alias DailyMeals.{Error, Meal}
  alias DailyMeals.Meals.Update

  import DailyMeals.Factory

  describe "call/1" do
    test "when meal exists, updates the meal" do
      insert(:meal)

      params = %{
        "id" => "47d5430a-9569-40d7-9a33-222aaedb8e29",
        "descricao" => "Abacate"
      }

      response =
        params
        |> Update.call()

      assert {
               :ok,
               %Meal{
                 id: _id,
                 descricao: "Abacate",
                 calorias: 300,
                 data: ~U[2021-03-28 13:59:13Z]
               }
             } = response
    end

    test "when meal not exists, returns an error" do
      params = %{
        "id" => "47d5430a-9569-40d7-9a33-222aaedb8e29",
        "descricao" => "Abacate"
      }

      response =
        params
        |> Update.call()

      assert {
               :error,
               %Error{
                 message: "Meal not found",
                 status: :not_found
               }
             } = response
    end
  end
end
