defmodule EOS.Orders.Cache.Client do
  @moduledoc """
  Calls made to order cache client
  """

  defp server_name, do: EOS.Orders.Cache.Simple.server_name

  alias EOS.Orders.LimitOrder, as: LimitOrder

  @doc """
  Place limit order
  """
  @spec place_limit_order(LimitOrder) :: none
  def place_limit_order(order) do
    GenServer.cast(server_name(), {:limit_order, order})
  end

  @doc """
  handle a market order
  """
  def handle_market_order(order) do
    GenServer.call(server_name(), {:market_order, order})
  end

  @doc """
  get all current orders
  """
  @spec get_order_book :: [LimitOrder]
  def get_order_book do
    GenServer.call(server_name(), {:all_orders})
  end

end