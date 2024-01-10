-- Criação da tabela
CREATE TABLE tb_object_departamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    JSONVALUE JSON
);

-- Inserção de dados de exemplo
INSERT INTO tb_object_departamento (JSONVALUE) VALUES
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
  "Numero_Departamento": "10",
  "Data_Inicio_Gerente": "1995-08-15",
  "Nome_Departamento": "Desenvolvimento",
  "Cpf_Gerente": "11122333444",
  "Projeto": [
    {
      "Numero_Projeto": "5",
      "Nome_Projeto": "Produto X",
      "Local_Projeto": "Campinas"
    },
    {
      "Numero_Projeto": "8",
      "Nome_Projeto": "Produto W",
      "Local_Projeto": "Rio de Janeiro"
    }
  ]
}');

-- Consulta para encontrar departamentos com gerentes cujo CPF é "33344555587"
SELECT
	REPLACE(JSON_EXTRACT(`JSONVALUE`, "$.Nome_Departamento"),'"','') AS Departamento
FROM tb_object_departamento
WHERE
	JSON_EXTRACT(`JSONVALUE`, "$.Cpf_Gerente") = "33344555587";
