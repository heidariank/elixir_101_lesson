defmodule Spec do

  def update(agent, args \\ [attempts: 3]) do
    Agent.update(agent, fn (state) -> Map.put(state, :attempts, args[:attempts]) end)
  end

  def update({name, node} = agent, [] = args, [] = _options) do
    {opts, _, _} = OptionParser.parse(args, [switches: [attempts: :integer]])
    Agent.get_and_update(agent, fn (state) -> {Map.get(state, :attempts), Map.put(state, :attempts, opts[:attempts])} end)
  end

  def update({:global, name} = agent, args, options \\ [global: true]) when is_binary(args) do
    {opts, _, _} =
    args
    |> String.split()
    |> OptionParser.parse([switches: [attempts: :integer]])

    current_attempts = Agent.get(agent, fn(state) -> Map.get(state, :attempts) end)
    if current_attempts < opts[:attempts] do
      Agent.update(agent, fn(state) -> Map.put(state, :attempts, opts[:attempts]) end)
    else
      {:err, "More attempts have already been made"}
    end
  end

  def update({:via, module, name} = agent, args \\ [attempts: 5], options \\ [global: false]) do
    current_attempts = Agent.get_and_update(agent, fn (state) -> {Map.get(state, :attempts), Map.put(state, :attempts, opts[:attempts])} end)
    {:ok, [attempts_updated: {current_attempts, args[:attempts]}]}
  end
end