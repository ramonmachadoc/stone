defmodule Stone_api.Repo.Migrations.CreatePeople do
  use Ecto.Migration

  def change do
  create table(:people) do
    add :name, :string, null: false
    add :cpf, :string, null: false
    add :email, :string, null: false
    add :password, :string, null: false

    timestamps()
  end
  end
end
