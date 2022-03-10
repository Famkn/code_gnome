defmodule Fibonacci.Impl.Fibonacci do

  def init() do
    %{0 => 0, 1 => 1}
  end

  def fib(cache, n) do
    if Map.has_key?(cache, n) do
      {cache, cache[n]}
    else
      # IO.inspect("computing n: #{n}")
      {cache, fib_min_1 } = fib(cache, n-1)
      {cache, fib_min_2 } = fib(cache, n-2)
      result = fib_min_1 + fib_min_2
      cache = Map.put(cache, n, result)
      {cache, result}
    end
  end
end

# def fib(cache, n) do
#   res = MyCache.get(cache, n)
#   if res do
#     res
#   else
#     new_res = fib(cache, n-1) + fib(cache, n-2)
#     MyCache.put(cache, n, new_res)
#     new_res
#   end
# end
