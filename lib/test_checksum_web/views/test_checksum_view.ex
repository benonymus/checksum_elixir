defmodule TestChecksumWeb.TestChecksumView do
  use TestChecksumWeb, :view
  alias TestChecksumWeb.TestChecksumView

  def render("200.json", %{conn: %{assigns: %{message: message}}}) do
    %{
      meta: %{status: 200, message: message},
      errors: nil,
      data: nil
    }
  end

  def render("408.json", %{conn: %{assigns: %{}}}) do
    %{
      meta: %{status: 408, message: "Timeout"},
      errors: nil,
      data: nil
    }
  end

  def render("checksum.json", %{conn: %{assigns: %{message: message, checksum: checksum}}}) do
    %{
      meta: %{status: 200, message: message},
      errors: nil,
      data: %{
        checksum: checksum
      }
    }
  end
end
