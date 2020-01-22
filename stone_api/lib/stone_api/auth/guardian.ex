defmodule StoneApi.Guardian do
@moduledoc """
Guardian implementation
"""
  use Guardian, otp_app: :stone_api

  def subject_for_token(resource, _claims) do

    sub = to_string(resource.id)
    {:ok, sub}
  end
  def subject_for_token(_, _) do
    {:error, :reason_for_error}
  end

  def resource_from_claims(claims) do

    id = claims["sub"]
    resource = StoneApi.get_resource_by_id(id)
    {:ok,  resource}
  end
  def resource_from_claims(_claims) do
    {:error, :reason_for_error}
  end
end
