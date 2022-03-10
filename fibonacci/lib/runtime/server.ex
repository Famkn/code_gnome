defmodule Fibonacci.Runtime.Server do
  alias Fibonacci.Impl.Fibonacci
  @me __MODULE__
  def start_link do
    Agent.start_link(&Fibonacci.init/0, name: @me)
  end

  def fib(n) do
    {new_cache, result} =
      Agent.get(@me, & &1)
      |> Fibonacci.fib(n)
    Agent.update(@me, fn _cache -> new_cache end)
    result
  end
end
