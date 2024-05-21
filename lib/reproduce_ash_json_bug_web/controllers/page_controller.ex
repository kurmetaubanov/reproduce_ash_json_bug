defmodule ReproduceAshJsonBugWeb.PageController do
  use ReproduceAshJsonBugWeb, :controller

  alias ReproduceAshJsonBug.Domain

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    {:ok, res} = Domain.create_res(%{json: get_json()})
    IO.inspect "created"
    IO.inspect Domain.update_res(res, %{json: get_json()})
    IO.inspect "updated"

    render(conn, :home, layout: false)
  end

  def get_json do
    %{
      "some_object" => %{
        "some_object" => [
          %{
            "some_object" => "some_object",
            "some_object2" => "some_object"
          }
        ]
      }
    }
  end
end
