defmodule Stone_api.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :number, :string, null: false
      add :balance, :float, default: 1000.00
      add :people_id, references(:people)

      timestamps()
    end
  end
end
