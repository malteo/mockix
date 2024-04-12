defmodule Mockix.MocksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Mockix.Mocks` context.
  """

  @doc """
  Generate a mock.
  """
  def mock_fixture(attrs \\ %{}) do
    {:ok, mock} =
      attrs
      |> Enum.into(%{
        payload: "{\"value\": 3}"
      })
      |> Mockix.Mocks.create_mock()

    mock
  end
end
