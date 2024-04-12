defmodule Mockix.Mocks.Mock do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "mocks" do
    field :payload, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(mock, attrs) do
    mock
    |> cast(attrs, [:payload])
    |> validate_required([:payload])
  end
end
