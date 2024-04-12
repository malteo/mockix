defmodule MockixWeb.MockJSON do
  alias Mockix.Mocks.Mock

  @doc """
  Renders a list of mocks.
  """
  def index(%{mocks: mocks}) do
    %{data: for(mock <- mocks, do: data(mock))}
  end

  @doc """
  Renders a single mock.
  """
  def show(%{mock: mock}) do
    #%{data: data(mock)}
    Jason.decode!(mock.payload)
  end

  defp data(%Mock{} = mock) do
    %{
      id: mock.id,
      payload: mock.payload
    }
  end
end
