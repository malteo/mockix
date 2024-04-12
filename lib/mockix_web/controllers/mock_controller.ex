defmodule MockixWeb.MockController do
  use MockixWeb, :controller

  alias Mockix.Mocks
  alias Mockix.Mocks.Mock

  action_fallback MockixWeb.FallbackController

  def index(conn, _params) do
    mocks = Mocks.list_mocks()
    render(conn, :index, mocks: mocks)
  end

  def create(conn, %{"_json" => json_payload}) do
    with {:ok, payload} <- Jason.encode(json_payload),
         {:ok, %Mock{} = mock} <- Mocks.create_mock(%{payload: payload}) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/mocks/#{mock}")
      |> render(:show, mock: mock)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, mock} <- Mocks.get_mock(id) do
      render(conn, :show, mock: mock)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, mock} <- Mocks.get_mock(id),
         {:ok, %Mock{}} <- Mocks.delete_mock(mock)
    do
      send_resp(conn, :no_content, "")
    end
  end
end
