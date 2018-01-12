defmodule EOS.Orders.Cache.OrderCache do
  @moduledoc """
  Simple order store structure.
  """

  alias EOS.Orders.LimitOrder, as: LimitOrder
  alias EOS.Orders.Cache.OrderCache, as: OrderCache

  defstruct [buys: [], sells: [], max_buy: nil, min_sell: nil]

  @type order_cache :: %OrderCache{
    buys: list(LimitOrder.limit_order),
    sells: list(LimitOrder.limit_order),
  }


  @spec limit_order(order_cache, LimitOrder.limit_type, LimitOrder.limit_order) :: {order_cache, atom}
  def limit_order(cache, type, order) do
    {buys, sells} = {cache.buys, cache.sells}
    barrier = buy_sell_barrier(buys, sells)
    case type do
      :limit_buy -> if (barrier > order.price || barrier == nil) do
        Map.replace(cache, :buys, Enum.sort(Enum.into(buys, order), &((&1).price > (&2).price)))
      else
        cache
      end
      :limit_sell -> if (barrier < order.price || barrier == nil) do
        Map.replace(cache, :sells, Enum.sort(Enum.into(sells, order), &((&1).price < (&2).price)))
      else
        cache
      end
    end
  end

  @spec buy_sell_barrier(list(LimitOrder.limit_order), list(LimitOrder.limit_order)) :: number
  defp buy_sell_barrier(buys, sells) do
    case {map_size(buys), map_size(sells)} do
      {0, 0} -> nil
      {0, min_sell} -> min_sell
      {max_buy, 0} -> max_buy
      {max_buy, min_sell} -> (min_sell + max_buy)/2
    end
  end

end