defmodule StoneApi.RouterTest do
    use ExUnit.Case
    use Plug.Test

    alias StoneApi.Router

    @opts Router.init([])

    test "returns welcome" do
        conn =
            :get
            |> conn("/", "")
            |> Router.call(@opts)

        assert conn.state == :sent
        assert conn.status == 200
    end

    test "returns 404" do
        conn =
            :get
            |> conn("/missing", "")
            |> Router.call(@opts)

        assert conn.state == :sent
        assert conn.status == 404
    end

    test "insert people" do
        conn =
            :post
            |> conn("/people",%{"name" => "Ramon", "cpf" => "12345678901", "email" => "ramon.carmom@gmail.com", "inPassword" => "1234567890"})
            |> Router.call(@opts)

        assert conn.state == :sent
        assert conn.status == 200
    end
end
