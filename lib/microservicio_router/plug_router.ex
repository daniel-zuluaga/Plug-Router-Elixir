defmodule MicroservicioRouter.PlugRouter do
  use (Plug.Router)

  plug :match
  plug :dispatch

  get("/") do
    IO.puts("Visistan la raiz")

    send_resp(conn, 200, "Hello Daniel, How are you ?")
  end

  get("/hola") do
    IO.puts("Visitan la pagina hola")
    send_resp(conn, 200, "Hello user, How are you ?")
  end

  get("/blog/:nombre") do
    IO.puts("Nos piden el articulo de blog #{nombre}")
    send_resp(conn, 200, "Articulo para #{nombre}")
  end

  # forward("/blog", to: MicroservicioRouter.BlogRouter) ## Esto nos ayuda a regirirnos a un segundo router
end
