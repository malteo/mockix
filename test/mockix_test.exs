defmodule MockixTest do
  use ExUnit.Case, async: true
  use Plug.Test
  doctest Mockix

  @opts MetricMock.init([])

  test "returns a metric value" do
    # Create a test connection
    conn = conn(:get, "/")

    # Invoke the plug
    conn = MetricMock.call(conn, @opts)

    # Assert the response and status
    assert conn.state == :sent

    content_type = List.keyfind!(conn.resp_headers, "content-type", 0)
    assert elem(content_type, 1) == "application/json; charset=utf-8"

    assert conn.resp_body == "{\"value\":3.0}"
  end
end
