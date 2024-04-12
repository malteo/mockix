defmodule MockixWeb.MockControllerTest do
  use MockixWeb.ConnCase

  import Mockix.MocksFixtures

  @create_attrs %{value: 3}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all mocks", %{conn: conn} do
      conn = get(conn, ~p"/api/mocks")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create mock" do
    test "renders mock when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/mocks", _json: @create_attrs)
      assert %{"value" => 3} = json_response(conn, 201)
      assert [location] = get_resp_header(conn, "location")

      conn = get(conn, location)
      assert %{"value" => 3} = json_response(conn, 200)
    end
  end

  describe "delete mock" do
    setup [:create_mock]

    test "deletes chosen mock", %{conn: conn, mock: mock} do
      conn = delete(conn, ~p"/api/mocks/#{mock}")
      assert response(conn, 204)

      conn = get(conn, ~p"/api/mocks/#{mock}")
      assert response(conn, 404)
    end
  end

  defp create_mock(_) do
    mock = mock_fixture()
    %{mock: mock}
  end
end
