defmodule DailyMeals.Meals.CreateTest do
  use DailyMeals.DataCase, async: true

  import DailyMeals.Factory

  alias DailyMeals.{Error, Meal}
  alias DailyMeals.Meals.Create

  describe "call/1" do
    test "when all params are valid, returns the meal" do
      user_id = "d3269a1f-c362-4396-866b-7373abadea38"

      insert(:user, id: user_id)

      params = build(:meal_params, user_id: user_id)

      response = Create.call(params)

      assert {:ok,
              %Meal{
                id: _id,
                descricao: "Avocado",
                calorias: 300,
                data: ~U[2021-03-28 13:59:13Z],
                user_id: _user_id
              }} = response
    end

    test "when all invalid params, returns an error" do
      params = build(:meal_params, %{descricao: "", calorias: nil})

      response = Create.call(params)

      expected_response = %{calorias: ["can't be blank"], descricao: ["can't be blank"]}

      assert {:error, %Error{message: changeset, status: :bad_request}} = response
      assert expected_response == errors_on(changeset)
    end
  end
end
