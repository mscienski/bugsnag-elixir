defmodule Bugsnag.SessionTracker do
  import Supervisor.Spec

  @maximum_session_count = 100
  @session_payload_version = "1.0"

  def start_session(session_url) do
    new_session = %{
      id: UUID.uuid4(:hex),
      startedAt: System.monotonic_time() |> Time.to_string(),
      events: %{
        handled: 0,
        unhandled: 0
      }
    }
  end
end
