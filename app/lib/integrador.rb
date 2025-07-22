require 'httparty'

class Integrador
  include httparty
  base_uri = 'https://app.razonet.com.br'


  def initialize(token)
    @headers = {
      "Authorization" => token,
      "Content-Type" => "application/json"
    }
  end


  def buscar_empresas
    query: {
      obligation: 'zeramento_de_balancos',
      date_start: '01/01/2025',
      date_end: '01/01/2026',
      fields: 'cnpj,ie,dominio_code,fantasy_name,has_variables,has_pro_labore'
    }
    
    self.class.get(
      "/integration/v1/companies/index", headers: @headers, query
    )
  end


  def integrar_empresa(dados)
    query = {
      obligation: 'zeramento_de_balancos',
      date_start: '01/01/2025',
      date_end: '01/01/2026',
      cnpj: dados[:cnpj]
      note: 'integrado via interface de testes'
    }
    self.class.post(
      "/integration/v1/companies/set_as_integrated", headers: @headers, query
    )
  end
  
end