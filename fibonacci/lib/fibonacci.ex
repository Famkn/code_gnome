defmodule Fibonacci do
  alias Fibonacci.Runtime.Server

  @spec fib(integer()) :: integer()
  defdelegate fib(n), to: Server
end
