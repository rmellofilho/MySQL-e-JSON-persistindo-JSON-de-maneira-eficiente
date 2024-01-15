-- Criação da tabela
CREATE TABLE tb_object_departamento (
	JSONVALUE JSON
);

-- Inserção de dados
INSERT INTO tb_object_departamento(JSONVALUE) VALUES
('{
  "Numero_Departamento": "5",
  "Data_Inicio_Gerente": "1988-05-22",
  "Nome_Departamento": "Pesquisa",
  "Cpf_Gerente": "33344555587",
  "Projeto": [
    {
      "Numero_Projeto": "2",
      "Nome_Projeto": "Produto Y",
      "Local_Projeto": "Itu"
    },
    {
      "Numero_Projeto": "3",
      "Nome_Projeto": "Produto Z",
      "Local_Projeto": "São Paulo"
    }
  ]
}'),
('{
  "Numero_Departamento": "5",
  "Data_Inicio_Gerente": "2005-05-22",
  "Nome_Departamento": "Pesquisa",
  "Cpf_Gerente": "333445555872",
  "Projeto": [
    {
      "Numero_Projeto": "2",
      "Nome_Projeto": "Produto Y",
      "Local_Projeto": "Itu"
    },
    {
      "Numero_Projeto": "3",
      "Nome_Projeto": "Produto Z",
      "Local_Projeto": "São Paulo"
    }
  ]
}');

-- Visualizar CPF do gerente que iníciou a gerência em 2005
SELECT JSON_UNQUOTE(JSON_EXTRACT(JSONVALUE, "$.Cpf_Gerente")) AS cpf_gerente
FROM tb_object_departamento
WHERE YEAR(JSON_EXTRACT(JSONVALUE, "$.Data_Inicio_Gerente")) = 2005;

