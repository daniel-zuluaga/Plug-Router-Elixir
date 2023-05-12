defmodule MicroservicioRouter.PlugConn do
  # CONN

  import Plug.Conn

  def init(options) do
    IO.inspect(options, label: "init ->")
  end

  def call(conn, _options) do
    IO.inspect(conn, label: "conn ->")

    ## Peticiones base de datos o web o algo

    ## pero tambien que devuelva una respuesta

    send_resp(conn, 200, "Hello World")
  end
end
