defmodule Fibonacci.Runtime.Application do

  use Application
  alias Fibonacci.Runtime.Server

  def start(_type, _args) do
    Server.start_link()
  end
end
