defmodule StoneApi.Router do
    use Plug.Router

    alias StoneApi.CMovement
    alias StoneApi.CPeople

    plug :match
    plug Plug.Parsers, parsers: [:json],
                        pass: ["application/json"],
                        json_decoder: Jason
    plug :dispatch

    get "/" do
        send_resp(conn, 200, "Bem-vindo")
    end

    post "/people" do
        CPeople.save(conn.body_params)
        send_resp(conn, 200, "FAZER RETORNO")
    end

    post "/movement" do

        CMovement.movement(conn.body_params)
        send_resp(conn, 200, "FAZER RETORNO")

    end

    post "/transfer" do
        out_account_id = conn.body_params["outAccount"]
        in_account_id = conn.body_params["inAccount"]
        value = conn.body_params["value"]
        # VALIDAR ROLLBACK EM CASO DE SALDO INSUFICIENTE
        %{"value" => value, "type" => 0, "account" => out_account_id}
        |> CMovement.movement()

        %{"value" => value, "type" => 1, "account" => in_account_id}
        |> CMovement.movement()

        send_resp(conn, 200, "FAZER RETORNO")

    end

    match _ do
        send_resp(conn, 404, "Não encontrado")
    end

end
