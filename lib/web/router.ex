defmodule EoS.Web.Router do
  use Plug.Router

  #For CORS headers and stuff, not sure how to configure yet

  plug :match
  plug :dispatch

  post "api/v0/place_market_order" do
    send_resp(conn, 200, "WIP")
  end

  post "api/v0/place_limit_order" do
    send_resp(conn, 200, "WIP")
  end

  post "api/v0/user/order_book" do
    send_resp(conn, 200, "WIP")
  end

  match(_) do
    send_resp(conn, 404, "NOT WIP")
  end

end
