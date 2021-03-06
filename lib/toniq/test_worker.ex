# Used for manual testing of toniq
# Usage: Toniq.enqueue(Toniq.TestWorker)
defmodule Toniq.TestWorker do
  use Toniq.Worker

  def perform(:fail_once) do
    unless Application.get_env(:toniq, :fail_once) do
      Application.put_env(:toniq, :fail_once, true)
      raise "failing once"
    end

    IO.inspect "fail once job succeeded"
  end

  def perform([]) do
    IO.puts "Job started in #{Toniq.Keepalive.identifier}"
    :timer.sleep 3000
    IO.puts "Job finished in #{Toniq.Keepalive.identifier}"
  end
end
