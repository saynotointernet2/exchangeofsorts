defmodule EOS.Orders.LimitOrder do

  @moduledoc """
  Limit order type
  """

  defstruct [:order_type, :price, :amount, :account_id, :order_id]

  alias EOS.Orders.LimitOrder, as: LimitOrder

  @type limit_type :: :limit_buy | :limit_sell
  @type limit_order :: %LimitOrder{
    order_type: limit_type,
    price: number,
    amount: number,
    account_id: String.t,
    order_id: String.t
  }

end