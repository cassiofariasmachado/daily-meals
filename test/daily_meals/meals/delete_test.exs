defmodule DailyMeals.Meals.DeleteTest do
  use DailyMeals.DataCase, async: true

  import DailyMeals.Factory

  alias DailyMeals.{Error, Meal}
  alias DailyMeals.Meals.Delete

  describe "call/1" do
    test "when meal exists, deletes the meal" do
      meal_id = "47d5430a-9569-40d7-9a33-222aaedb8e29"
      user_id = "e89614f0-dd7c-4a9e-b474-c83ec212a5bc"

      insert(:user, id: user_id)
      insert(:meal, id: meal_id, user_id: user_id)

      response =
        meal_id
        |> Delete.call()

      assert {
               :ok,
               %Meal{
                 id: _id,
                 descricao: "Avocado",
                 data: ~U[2021-03-28 13:59:13Z],
                 calorias: 300,
                 user_id: _user_id
               }
             } = response
    end

    test "when meal not exists, ruturns an error" do
      meal_id = "47d5430a-9569-40d7-9a33-222aaedb8e29"

      response = Delete.call(meal_id)

      assert {
               :error,
               %Error{
                 message: "Meal not found",
                 status: :not_found
               }
             } == response
    end
  end
end
