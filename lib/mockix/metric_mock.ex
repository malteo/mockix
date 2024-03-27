defmodule MetricMock do
  import Plug.Conn

  def init(options) do
    # initialize options
    options
  end

  def call(conn, _opts) do
    metric = Mockix.metric()
    {_, result} = JSON.encode(metric)

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, result)
  end
end
