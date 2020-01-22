defmodule StoneApi.Movement do
@moduledoc """
Movement table Model
"""
    use Ecto.Schema

    import Ecto.Changeset

    schema "movements" do
        field :type, :integer
        field :value, :float
        field :date, :string
        belongs_to :account, StoneApi.Account

        timestamps()
    end

    def changeset(struct, params) do
        struct
        |> cast(params, [:type, :value, :date])
        |> validate_required([:account, :type, :value])

        |> validate_types()
    end

    @types [0, 1]
    def validate_types(changeset) do
        type = get_field(changeset, :type)

        if type in @types do
            changeset
        else
            add_error(changeset, :type, "type must be 0 or 1")
        end
    end
end
