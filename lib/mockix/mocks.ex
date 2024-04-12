defmodule Mockix.Mocks do
  @moduledoc """
  The Mocks context.
  """

  import Ecto.Query, warn: false
  alias Mockix.Repo

  alias Mockix.Mocks.Mock

  @doc """
  Returns the list of mocks.

  ## Examples

      iex> list_mocks()
      [%Mock{}, ...]

  """
  def list_mocks do
    Repo.all(Mock)
  end

  @doc """
  Gets a single mock.

  Raises `Ecto.NoResultsError` if the Mock does not exist.

  ## Examples

      iex> get_mock!(123)
      %Mock{}

      iex> get_mock!(456)
      ** (Ecto.NoResultsError)

  """
  def get_mock!(id), do: Repo.get!(Mock, id)

  @doc """
  Creates a mock.

  ## Examples

      iex> create_mock(%{field: value})
      {:ok, %Mock{}}

      iex> create_mock(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_mock(attrs \\ %{}) do
    %Mock{}
    |> Mock.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Deletes a mock.

  ## Examples

      iex> delete_mock(mock)
      {:ok, %Mock{}}

      iex> delete_mock(mock)
      {:error, %Ecto.Changeset{}}

  """
  def delete_mock(%Mock{} = mock) do
    Repo.delete(mock)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking mock changes.

  ## Examples

      iex> change_mock(mock)
      %Ecto.Changeset{data: %Mock{}}

  """
  def change_mock(%Mock{} = mock, attrs \\ %{}) do
    Mock.changeset(mock, attrs)
  end
end
