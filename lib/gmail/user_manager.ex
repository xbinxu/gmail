defmodule Gmail.UserManager do
  @moduledoc """
  Supervises user processes.
  """

  use Supervisor

  @doc false
  def start_link do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  @doc false
  def init(:ok) do
    [Gmail.User]
    |> Supervisor.init(strategy: :simple_one_for_one)
  end
end
