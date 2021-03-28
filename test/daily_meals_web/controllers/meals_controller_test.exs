defmodule DailyMealsWeb.MealsControllerTest do
  use DailyMealsWeb.ConnCase, async: true

  import DailyMeals.Factory

  describe "create/2" do
    test "when all params are valid, creates the meal", %{conn: conn} do
      params = build(:meal_web_params)

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "meal" => %{
                 "id" => _id,
                 "descricao" => "Avocado",
                 "calorias" => 300,
                 "data" => "2021-03-28T13:59:13Z"
               },
               "message" => "Meal created"
             } = response
    end

    test "when there are invalid params, returns the errors", %{conn: conn} do
      params = %{}

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "calorias" => ["can't be blank"],
          "data" => ["can't be blank"],
          "descricao" => ["can't be blank"]
        }
      }

      assert expected_response == response
    end
  end

  describe "delete/2" do
    test "when there is a meal with the given id, deletes the meal", %{conn: conn} do
      id = "446968d2-1878-48cc-a7bd-d45638e19508"

      insert(:meal, id: id)

      response =
        conn
        |> delete(Routes.meals_path(conn, :delete, id))
        |> response(:no_content)

      assert "" == response
    end

    test "when there isn\'t a meal with the given id, returns an error", %{conn: conn} do
      id = "31319c5f-2411-4e29-a9be-1475261d2949"

      response =
        conn
        |> delete(Routes.meals_path(conn, :delete, id))
        |> json_response(:not_found)

      expected_response = %{"message" => "Meal not found"}

      assert expected_response == response
    end

    test "when the given id is not valid, returns an error", %{conn: conn} do
      id = "12345"

      response =
        conn
        |> delete(Routes.meals_path(conn, :delete, id))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid id format"}

      assert expected_response == response
    end
  end

  describe "show/2" do
    test "when there is a meal with the given id, returns the meal", %{conn: conn} do
      id = "d96f3230-5a00-4d35-907f-cc0fce7739c0"

      insert(:meal, id: id)

      response =
        conn
        |> get(Routes.meals_path(conn, :show, id))
        |> json_response(:ok)

      expected_response = %{
        "meal" => %{
          "id" => id,
          "descricao" => "Avocado",
          "calorias" => 300,
          "data" => "2021-03-28T13:59:13Z"
        }
      }

      assert expected_response == response
    end

    test "when there isn\'t a meal with the given id, returns an error", %{conn: conn} do
      id = "f82f1230-cac8-4797-9f63-b8ceda4bf6b9"

      response =
        conn
        |> get(Routes.meals_path(conn, :show, id))
        |> json_response(:not_found)

      expected_response = %{"message" => "Meal not found"}

      assert expected_response == response
    end

    test "when the given id is not valid, returns an error", %{conn: conn} do
      id = "12345"

      response =
        conn
        |> get(Routes.meals_path(conn, :show, id))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid id format"}

      assert expected_response == response
    end
  end

  describe "update/2" do
    test "when there is a meal with the given id, updates the meal", %{conn: conn} do
      id = "18ad3c36-3af6-47ed-9c02-0821af330673"

      insert(:meal, id: id)

      params = %{
        "descricao" => "Abacate"
      }

      response =
        conn
        |> put(Routes.meals_path(conn, :update, id, params))
        |> json_response(:ok)

      expected_response = %{
        "meal" => %{
          "calorias" => 300,
          "data" => "2021-03-28T13:59:13Z",
          "descricao" => "Abacate",
          "id" => "18ad3c36-3af6-47ed-9c02-0821af330673"
        }
      }

      assert expected_response == response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      id = "5d80d5e6-84ae-45b5-8d48-937e4406ff73"

      insert(:meal, id: id)

      params = %{
        "descricao" => ""
      }

      response =
        conn
        |> put(Routes.meals_path(conn, :update, id, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => %{"descricao" => ["can't be blank"]}}

      assert expected_response == response
    end

    test "when there isn\'t a meal with the given id, returns an error", %{conn: conn} do
      id = "7dba804f-d669-488a-95a0-a9c067548ed2"

      response =
        conn
        |> put(Routes.meals_path(conn, :update, id))
        |> json_response(:not_found)

      expected_response = %{"message" => "Meal not found"}

      assert expected_response == response
    end
  end
end
