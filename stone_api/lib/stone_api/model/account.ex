defmodule StoneApi.Account do
@moduledoc """
Account table Model
"""
    use Ecto.Schema

    schema "accounts" do
        field :number, :string
        field :balance, :float
        belongs_to :people, StoneApi.People
        has_many :movements, StoneApi.Movement

        timestamps()
    end
end
