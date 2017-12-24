defmodule EOS.Orders.Cache.Simple do
  @moduledoc """
  Simple attempt at an order-book / orders cache
  """

  use GenServer

  @name OrdersCache

  def server_name, do: @name

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts ++ [name: @name])
  end

  def init(_opts) do
    {
      :ok,
      []
    }
  end

  @doc """
  place limit order
  """
  def handle_cast({:limit_order, order}, order_list) do
    {
      :noreply,
      Enum.into(order_list, order)
    }
  end

  @doc """
  handle market order... how?! maybe should also be cast depending on where we're matching
  """
  def handle_call({:market_order, _something}, _from, order_list) do
    {
      :reply,
      "oh shit",
      order_list
    }
  end

  @doc """
  get all orders
  """
  def handle_call({:all_orders}, _from, orders) do
    {
      :reply,
      orders,
      orders
    }
  end


end