defmodule DailyMeals.MealTest do
  use DailyMeals.DataCase, async: true

  import DailyMeals.Factory

  alias DailyMeals.Meal
  alias Ecto.Changeset

  describe "changeset/1" do
    test "when the create params are valid, returns a valid changeset" do
      params = build(:meal_params)

      response = Meal.changeset(params)

      assert %Changeset{
               changes: %{
                 descricao: "Avocado",
                 calorias: 300,
                 data: ~U[2021-03-28 13:59:13Z]
               },
               valid?: true
             } = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = %{}

      response = Meal.changeset(params)

      expected_response = %{
        calorias: ["can't be blank"],
        data: ["can't be blank"],
        descricao: ["can't be blank"]
      }

      assert expected_response == errors_on(response)
    end
  end

  describe "changeset/2" do
    setup %{} do
      params = build(:meal_params)

      changeset = Meal.changeset(params)

      {:ok, changeset: changeset}
    end

    test "when the update params are valid, returns a valid changeset", %{changeset: changeset} do
      params = %{descricao: "Abacate"}

      response =
        changeset
        |> Meal.changeset(params)

      assert %Changeset{
               changes: %{
                 descricao: "Abacate",
                 calorias: 300,
                 data: ~U[2021-03-28 13:59:13Z]
               },
               valid?: true
             } = response
    end

    test "when there are some error, returns an invalid changeset", %{changeset: changeset} do
      params = %{descricao: ""}

      response =
        changeset
        |> Meal.changeset(params)

      expected_response = %{descricao: ["can't be blank"]}

      assert expected_response == errors_on(response)
    end
  end
end
