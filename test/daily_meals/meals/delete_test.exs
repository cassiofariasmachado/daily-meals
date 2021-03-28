defmodule DailyMeals.Meals.DeleteTest do
  use DailyMeals.DataCase, async: true

  alias DailyMeals.{Error, Meal}
  alias DailyMeals.Meals.Delete

  import DailyMeals.Factory

  describe "call/1" do
    test "when meal exists, deletes the meal" do
      insert(:meal)

      response =
        "47d5430a-9569-40d7-9a33-222aaedb8e29"
        |> Delete.call()

      assert {
               :ok,
               %Meal{
                 id: _id,
                 descricao: "Avocado",
                 data: ~U[2021-03-28 13:59:13Z],
                 calorias: 300
               }
             } = response
    end

    test "when meal not exists, ruturns an error" do
      response =
        "47d5430a-9569-40d7-9a33-222aaedb8e29"
        |> Delete.call()

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
