defmodule StoneApi.People do
@moduledoc """
People table model
"""
    use Ecto.Schema

    import Ecto.Changeset

    schema "people" do
        field :name, :string
        field :cpf, :string
        field :email, :string
        field :password, :string
        field :in_password, :string, virtual: true
        has_one :accounts, StoneApi.Account

        timestamps()
    end

    def changeset(struct, params) do
        struct
        |> cast(params, [:name, :cpf, :email, :in_password])
        |> validate_required([:name, :cpf, :email, :in_password])
        |> validate_length(:name, min: 2)
        |> validate_length(:cpf, min: 11)
        |> validate_format(:email, ~r/^[A-Za-z0-9._-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/)
        |> validate_length(:password, min: 6)
        |> unique_constraint(:cpf)
        |> hash_password
    end

    defp hash_password(changeset) do
        case changeset do
            %Ecto.Changeset{valid?: true, changes: %{in_password: in_password}}
            ->
                put_change(changeset, :password, Comeonin.Bcrypt.hashpwsalt(in_password))
            _ ->
                changeset
        end
    end
end
