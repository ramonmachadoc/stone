defmodule StoneApi.CMovement do
@moduledoc """
Movement Controller

Withdrawal
Transfer
"""

    alias StoneApi.Account

    alias StoneApi.Repo

    alias StoneApi.Utils

    def movement(changeset) do
                account_id = changeset["account"]
                value = changeset["value"]
                type = changeset["type"]

                account = Repo.get(Account, account_id)
                old_balance = account.balance

                if type == 0 do
                    if value > old_balance do

                    else
                        new_balance = old_balance - value
                        account = Ecto.Changeset.change account, balance: new_balance
                        Repo.update(account)
                    end
                else
                    new_balance = old_balance + value
                    account = Ecto.Changeset.change account, balance: new_balance
                    Repo.update(account)
                end
        Repo.transaction fn ->
            with {:ok, _movement} <-
                Ecto.build_assoc(account, :movements, %{type: type, value: value, date: Utils.get_date()})
                |> Repo.insert()

            do
                # ESCREVER RETORNO
            else
                {:error, reason} -> reason

            end
        end
    end
end
