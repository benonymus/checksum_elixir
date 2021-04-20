defmodule TestChecksumWeb.TestChecksumController do
  @moduledoc """
  TestChecksumController controller
  """
  use TestChecksumWeb, :controller

  alias TestChecksumWeb.TestChecksumView

  alias TestChecksum.Checksum

  @doc """
  Checksum
  """
  def checksum(conn, params) do
    with {:ok, checksum} <- Checksum.calculate_checksum(params["timeout"]) do
      conn
      |> put_status(200)
      |> put_view(TestChecksumView)
      |> render("checksum.json", checksum: checksum, message: "Checksum calculated successfully!")
    else
      _ ->
        conn
        |> put_status(408)
        |> put_view(TestChecksumView)
        |> render("408.json")
    end
  end

  @doc """
  Add
  """
  def add(conn, %{"numbers" => numbers}) when is_list(numbers) do
    Checksum.add_elements(numbers)

    conn
    |> put_status(200)
    |> put_view(TestChecksumView)
    |> render("200.json", message: "Numbers added successfully!")
  end

  @doc """
  Clear
  """
  def clear(conn, _params) do
    Checksum.clear_elements()

    conn
    |> put_status(200)
    |> put_view(TestChecksumView)
    |> render("200.json", message: "Numbers cleared successfully!")
  end
end
