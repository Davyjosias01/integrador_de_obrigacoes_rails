require 'httparty'

class EmpresasController < ApplicationController
  def index
    integrador = Integrador.new(ENV["RAZONET_TOKEN"])
    resposta = integrador.buscar_empresas

    if resposta.code == 200
      @empresas = resposta.parsed_response["companies"] || []
    else
      @empresas = []
    end
  end

  def integrar
    integrador = Integrador.new(ENV["RAZONET_TOKEN"])

    dados = {
      cnpj: params[:cnpj],
      note: params[:note],
    }

    resposta = integrador.integrar_empresa(dados)

    redirect_to root_path(status: resposta.code)
  end
end
