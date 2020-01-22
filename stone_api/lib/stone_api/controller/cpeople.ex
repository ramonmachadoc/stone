defmodule StoneApi.CPeople do
@moduledoc """
People Controller
Save
Get
"""

    alias StoneApi.People

    alias StoneApi.Repo

    alias StoneApi.Utils

    require Ecto.Query

    def save(changeset) do

        Repo.transaction fn ->
            with {:ok, people} <-
                people = People.changeset(%StoneApi.People{}, changeset)
                |> Repo.insert(),

                Ecto.build_assoc(people, :accounts, %{number: Utils.permalink(10)})
                |> Repo.insert()
            do
                #ESCREVER RETORNO
            else
                {:error, reason} ->
                Repo.rollback(reason)

            end
        end
    end

end
