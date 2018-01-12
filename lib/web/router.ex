defmodule EOS.Web.Router do
  use Plug.Router

  #For CORS headers and stuff, not sure how to configure yet

  plug :match
  plug :dispatch

  post "api/v0/market_order" do
    send_resp(conn, 200, "WIP")
  end

  post "api/v0/limit_order" do
    send_resp(conn, 200, "WIP")
  end

  post "api/v0/order_book" do
    send_resp(conn, 200, "WIP")
  end

  match(_) do
    send_resp(conn, 404, "NOT WIP")
  end

  def start_link do
    Plug.Adapters.Cowboy2.http(EOS.Web.Router, [])
  end

end
