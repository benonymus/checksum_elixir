defmodule TestChecksumWeb.Router do
  use TestChecksumWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TestChecksumWeb do
    pipe_through :api
    get("/checksum/:timeout", TestChecksumController, :checksum)
    get("/checksum", TestChecksumController, :checksum)
    post("/add", TestChecksumController, :add)
    post("/clear", TestChecksumController, :clear)
  end
end
