defmodule StoneApi.Utils do
@moduledoc """
Generic Functions
"""
    def get_date do
        d = DateTime.utc_now
        DateTime.to_string(d)
        "#{d.day}/#{d.month}/#{d.year}"
    end

    def permalink(bytes_count) do
        bytes_count
        |> :crypto.strong_rand_bytes()
        |> Base.url_encode64(padding: false)
    end
end
