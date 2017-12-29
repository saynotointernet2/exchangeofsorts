defmodule EOS do
  @moduledoc """
  Documentation for EOS.
  """

  use Application

  def start(_type, _args) do
    EOS.Orders.Cache.Supervisor.start_link(name: EOS.Orders.Cache.Supervisor)
    EOS.Web.Router.start_link
  end

end
