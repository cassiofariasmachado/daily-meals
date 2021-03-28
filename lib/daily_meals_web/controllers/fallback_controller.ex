defmodule DailyMealsWeb.FallbackController do
  use DailyMealsWeb, :controller

  alias DailyMeals.Error
  alias DailyMealsWeb.ErrorView

  def call(conn, {:error, %Error{status: status, message: message}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", message: message)
  end
end
