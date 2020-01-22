defmodule Stone_api.Repo.Migrations.CreateMovements do
  use Ecto.Migration

  def change do
    create table(:movements) do
      add :type, :integer
      add :value, :float
      add :date, :string
      add :account_id, references(:accounts)

      timestamps()
    end
  end
end
