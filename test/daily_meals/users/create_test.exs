defmodule DailyMeals.Users.CreateTest do
  use DailyMeals.DataCase, async: true

  import DailyMeals.Factory

  alias DailyMeals.{Error, User}
  alias DailyMeals.Users.Create

  describe "call/1" do
    test "when all params are valid, returns the meal" do
      params = build(:user_params)

      response = Create.call(params)

      assert {
               :ok,
               %User{
                 id: _id,
                 nome: "Cassio",
                 email: "cassio@email.com",
                 cpf: "12345678910"
               }
             } = response
    end

    test "when all invalid params, returns an error" do
      params = build(:user_params, %{nome: "", cpf: ""})

      response = Create.call(params)

      expected_response = %{cpf: ["can't be blank"], nome: ["can't be blank"]}

      assert {:error, %Error{message: changeset, status: :bad_request}} = response
      assert expected_response == errors_on(changeset)
    end
  end
end
