defmodule Gmail.Supervisor do
  @moduledoc """
  Supervises all the things.
  """

  use Supervisor

  @doc false
  def start_link do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  @doc false
  def init(:ok) do
    children = [
      {DynamicSupervisor, strategy: :one_for_one, name: Gmail.UserManager}
      {Gmail.Thread.Pool, []},
      {Gmail.Message.Pool, []}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
