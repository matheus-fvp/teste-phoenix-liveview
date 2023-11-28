defmodule TestePdfWeb.RelatorioController do
  use TestePdfWeb, :controller

  def download_pdf(conn, params) do
    IO.inspect params
    pdf_binary = TestePdf.PdfGenerator.gerar_pdf()
     conn
       |> put_resp_content_type("application/pdf; charset=utf-8")
       |> put_resp_header("content-disposition", ~s(attachment; filename="relatorio.pdf"))
       |> send_resp(200, pdf_binary)
  end
end
