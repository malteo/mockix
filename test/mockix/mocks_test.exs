defmodule Mockix.MocksTest do
  use Mockix.DataCase

  alias Mockix.Mocks

  describe "mocks" do
    alias Mockix.Mocks.Mock

    import Mockix.MocksFixtures

    @invalid_attrs %{payload: nil}

    test "list_mocks/0 returns all mocks" do
      mock = mock_fixture()
      assert Mocks.list_mocks() == [mock]
    end

    test "get_mock!/1 returns the mock with given id" do
      mock = mock_fixture()
      assert {:ok, %Mock{}} = Mocks.get_mock(mock.id)
    end

    test "create_mock/1 with valid data creates a mock" do
      valid_attrs = %{payload: "some payload"}

      assert {:ok, %Mock{} = mock} = Mocks.create_mock(valid_attrs)
      assert mock.payload == "some payload"
    end

    test "create_mock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Mocks.create_mock(@invalid_attrs)
    end

    test "delete_mock/1 deletes the mock" do
      mock = mock_fixture()
      assert {:ok, %Mock{}} = Mocks.delete_mock(mock)
      assert {:error, :not_found} = Mocks.get_mock(mock.id)
    end

    test "change_mock/1 returns a mock changeset" do
      mock = mock_fixture()
      assert %Ecto.Changeset{} = Mocks.change_mock(mock)
    end
  end
end
