defmodule DailyMealsWeb.FallbackController do
  use DailyMealsWeb, :controller

  alias DailyMeals.Error
  alias DailyMealsWeb.ErrorView
  alias Ecto.Changeset

  def call(conn, {:error, %Error{status: status, message: message}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", message: message)
  end

  def call(conn, {:error, %Changeset{} = changeset}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ErrorView)
    |> render("error.json", message: changeset)
  end
end
