defmodule DailyMeals.Meals.GetTest do
  use DailyMeals.DataCase, async: true

  alias DailyMeals.{Error, Meal}
  alias DailyMeals.Meals.Get

  import DailyMeals.Factory

  describe "by_id/1" do
    test "when meal exists, returns the meal" do
      insert(:meal)

      response =
        "47d5430a-9569-40d7-9a33-222aaedb8e29"
        |> Get.by_id()

      assert {
               :ok,
               %Meal{
                 id: _id,
                 descricao: "Avocado",
                 calorias: 300,
                 data: ~U[2021-03-28 13:59:13Z]
               }
             } = response
    end

    test "when the meal not exits, returns an error" do
      response =
        "47d5430a-9569-40d7-9a33-222aaedb8e29"
        |> Get.by_id()

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
