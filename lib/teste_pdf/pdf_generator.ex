defmodule TestePdf.PdfGenerator do

  def gerar_pdf() do

    template = TestePdfWeb.RelatorioLive.render(%{
      primeira_secao: %{
        acao_planejamento: "Realização de workshops sobre metodologias de pesquisa",
        participacao_grupos_estudo: "Participação ativa em dois grupos de estudo",
        acoes_pesquisa: "Condução de entrevistas com participantes do estudo",
        participacao_treinamentos: "Participação no treinamento anual de pesquisa",
        publicacao: "Publicação de artigo em conferência internacional"
      },
      segunda_secao: %{
        previsao_acao_planejamento: "Planejamento para organizar uma conferência",
        previsao_participacao_grupos_estudo: "Planejamento para se juntar a um novo grupo de estudo",
        previsao_participacao_treinamentos: "Planejamento para participar de treinamentos futuros",
        previsao_acoes_pesquisa: "Planejamento para iniciar nova pesquisa"
      }
    })
    |> Phoenix.HTML.Safe.to_iodata()
    |> IO.iodata_to_binary();

    #{:ok, filename} = PdfGenerator.generate_binary!(template, page_size: "A4")
    pdf_binary = PdfGenerator.generate_binary!(template, page_size: "A4")
    #File.write("priv/static/pdf_out.pdf", File.read!(filename));
    #filename
    pdf_binary
  end
end
