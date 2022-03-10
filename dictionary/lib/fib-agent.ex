defmodule MyCache do
  def start() do
    Agent.start_link(fn -> %{} end)
  end

  def put(agent, new_key, new_val) do
    Agent.update(agent, fn state -> Map.put(state, new_key, new_val) end)
  end

  def get(agent, key) do
    Agent.get(agent, fn state -> Map.get(state, key, nil) end)
  end
end

defmodule FibAgent do
  def start() do
    {:ok, pid} = MyCache.start()
    pid
  end

  def fib(_cache, 0), do: 0
  def fib(_cache, 1), do: 1
  def fib(cache, n) do
    res = MyCache.get(cache, n)
    if res do
      res
    else
      new_res = fib(cache, n-1) + fib(cache, n-2)
      MyCache.put(cache, n, new_res)
      new_res
    end
  end
end
