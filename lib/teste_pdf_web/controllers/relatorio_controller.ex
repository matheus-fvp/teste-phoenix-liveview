defmodule TestePdfWeb.RelatorioController do
  use TestePdfWeb, :controller

  def download_pdf(conn, params) do
    IO.inspect params
    pdf_binary = TestePdf.PdfGenerator.gerar_pdf()
     conn
       |> put_resp_content_type("application/pdf")
       |> send_resp(200, pdf_binary)
  end
end
