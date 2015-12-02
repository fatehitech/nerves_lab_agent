defmodule NervesLabAgent do
  use Application

  @endpoint "http://127.0.0.1:4000/api"
  @token "12345"

  def start(_type, _args) do
    HTTPoison.start
    { :ok, self } # i dont know how to setup supervision stuff :(
    #work()
  end

  def work() do
    get_work |> do_work |> report_result
    #:timer.sleep 1000
    #work()
  end

  defp get_work() do
    HTTPoison.get!(@endpoint<>"/jobs") |> parse_json
  end

  defp parse_json(%{ body: body}) do
    Poison.decode!(body)
  end

  defp do_work(job) do
    IO.inspect job
    iolist = []
    iolist
  end

  defp report_result(iolist) do
    :ok
  end
end
