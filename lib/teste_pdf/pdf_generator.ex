defmodule TestePdf.PdfGenerator do

  def gerar_pdf() do
    relatorio = %{
      plano_de_trabalho: """
        - Definição dos objetivos de pesquisa para o ano.
        - Planejamento das etapas e métodos de coleta de dados.
        - Distribuição de tarefas entre os membros da equipe.
      """,
      resumo: """
        Durante o ano, realizamos uma série de atividades de pesquisa abrangendo diversas áreas.
        Este resumo destaca os principais pontos abordados e resultados obtidos.
      """,
      introducao: """
        A introdução fornece uma visão geral do contexto da pesquisa, destacando a relevância do tema e as principais questões que orientam nosso trabalho.
      """,
      embasamento_teorico: """
        Nesta seção, apresentamos uma revisão crítica da literatura existente relacionada ao nosso campo de estudo.
        Exploramos teorias e pesquisas anteriores que fundamentam nosso trabalho.
      """,
      resultados: """
        - Análise estatística dos dados coletados.
        - Apresentação de gráficos e tabelas que ilustram os principais resultados.
        - Discussão sobre as descobertas mais significativas.
      """,
      atividades_academicas: """
        - Participação em conferências regionais e internacionais.
        - Apresentação de artigos em eventos acadêmicos.
        - Colaboração em projetos de pesquisa com outras instituições.
      """,
      atividades_nao_academicas: """
        - Palestras e workshops para o público em geral.
        - Participação em eventos comunitários para divulgar a pesquisa.
        - Colaboração com organizações locais para aplicação prática dos resultados.
      """,
      conclusao: """
        A conclusão destaca os principais insights obtidos ao longo do ano, enfatizando a contribuição para o avanço do conhecimento na área de pesquisa.
      """,
      referencias: """
      Referência 1.
      Referência 2.
      Referência 3.
      Referência 4.
      Referência 5.
      Referência 6.
      Referência 7.
      """
    }

    template = TestePdfWeb.RelatorioHTML.relatorio_anual(relatorio)
    |> Phoenix.HTML.Safe.to_iodata()
    |> IO.iodata_to_binary();

    #[content: template, size: :a4]
    #|> ChromicPDF.Template.source_and_options()
    #|> ChromicPDF.print_to_pdf(output: "./priv/static/teste.pdf")
    #pdf
    options = [page_size: "A4", shell_params: ["-T", "2cm"]]
    PdfGenerator.generate_binary!(template, options)
  end
end
