defmodule TestChecksum.Checksum do
  use GenServer

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]}
    }
  end

  @spec start_link(list(Integer.t())) :: {:ok, pid()}
  def start_link(opts \\ []),
    do: GenServer.start_link(__MODULE__, opts, name: __MODULE__)

  @spec calculate_checksum() :: {:ok, Integer.t()}
  def calculate_checksum(nil), do: calculate_checksum("0")

  def calculate_checksum(timeout) do
    try do
      GenServer.call(__MODULE__, {:calculate, String.to_integer(timeout)}, 15)
    catch
      :exit, _ -> {:error, :timeout}
    end
  end

  @spec add_elements(list(Integer.t())) :: :ok
  def add_elements(elements) do
    GenServer.cast(__MODULE__, {:add, elements})
  end

  @spec clear_elements() :: :ok
  def clear_elements() do
    GenServer.cast(__MODULE__, :clear)
  end

  @impl GenServer
  def init(opts) do
    {:ok, opts}
  end

  @impl GenServer
  def handle_call({:calculate, timeout}, _, state) do
    Process.sleep(timeout)
    odd = Enum.take_every(state, 2)

    sum_result = Enum.sum(odd) * 3 + Enum.sum(state -- odd)

    result =
      case rem(sum_result, 10) do
        0 -> 0
        x -> 10 - x
      end

    {:reply, {:ok, result}, state}
  end

  @impl GenServer
  def handle_cast({:add, elements}, state) do
    {:noreply, Enum.concat([state, elements])}
  end

  @impl GenServer
  def handle_cast(:clear, _state) do
    {:noreply, []}
  end

  @impl GenServer
  def handle_info(:timeout, state) do
    {:noreply, state}
  end
end
