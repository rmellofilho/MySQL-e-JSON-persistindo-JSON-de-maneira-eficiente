-- Criação da tabela
CREATE TABLE tb_object_departamento_trabalha_em (
	JSONVALUE JSON
);

-- Inserção de dados
INSERT INTO tb_object_departamento_trabalha_em(JSONVALUE) VALUES
('{
  "Numero_Departamento": "5",
  "Data_Inicio_Gerente": "1988-05-22",
  "Nome_Departamento": "Pesquisa",
  "Cpf_Gerente": "33344555587",
  "Projeto": [
    {
      "Numero_Projeto": "2",
      "Nome_Projeto": "Produto Y",
      "Local_Projeto": "Itu",
      "Horas_Trabalhadas": [
        {
          "Cpf_Funcionario": "111222333",
          "Horas": 30
        },
        {
          "Cpf_Funcionario": "222333222",
          "Horas": 24
        },
        {
          "Cpf_Funcionario": "4443334444",
          "Horas": 30
        }
      ]
    },
    {
      "Numero_Projeto": "3",
      "Nome_Projeto": "Produto Z",
      "Local_Projeto": "São Paulo",
      "Horas_Trabalhadas": [
        {
          "Cpf_Funcionario": "111222333",
          "Horas": 25
        },
        {
          "Cpf_Funcionario": "5555444343",
          "Horas": 12
        },
        {
          "Cpf_Funcionario": "4443334444",
          "Horas": 48
        }
      ]
    }
  ]
}
'),
('{
  "Numero_Departamento": "5",
  "Data_Inicio_Gerente": "1988-05-22",
  "Nome_Departamento": "Comercial",
  "Cpf_Gerente": "33344555587",
  "Projeto": [
    {
      "Numero_Projeto": "2",
      "Nome_Projeto": "Produto Y",
      "Local_Projeto": "Itu",
      "Horas_Trabalhadas": [
        {
          "Cpf_Funcionario": "111222333",
          "Horas": 30
        },
        {
          "Cpf_Funcionario": "222333222",
          "Horas": 24
        },
        {
          "Cpf_Funcionario": "4443334444",
          "Horas": 30
        }
      ]
    },
    {
      "Numero_Projeto": "3",
      "Nome_Projeto": "Produto Z",
      "Local_Projeto": "São Paulo",
      "Horas_Trabalhadas": [
        {
          "Cpf_Funcionario": "111222333",
          "Horas": 25
        },
        {
          "Cpf_Funcionario": "5555444343",
          "Horas": 12
        },
        {
          "Cpf_Funcionario": "4443334444",
          "Horas": 48
        }
      ]
    }
  ]
}
');

SELECT 
    JSON_EXTRACT(JSONVALUE, "$.Nome_Departamento") AS Nome_Departamento,
    JSON_EXTRACT(JSONVALUE, "$.Projeto[0].Nome_Projeto") AS Nome_Projeto,
    t2.CPF_FUNCIONARIO,
    t2.Horas
FROM tb_object_departamento_trabalha_em
CROSS JOIN JSON_TABLE(
    JSON_EXTRACT(JSONVALUE, "$.Projeto[0].Horas_Trabalhadas"),
    "$[*]"
    COLUMNS (
        CPF_FUNCIONARIO VARCHAR(11) PATH "$.Cpf_Funcionario",
        Horas INT PATH "$.Horas"
    )
) t2;

/* Select para obtemos o nome do departamento, o nome do projeto,
o CPF do funcionário e as horas trabalhadas para o
primeiro projeto do departamento
*/
SELECT 
    JSON_EXTRACT(JSONVALUE, "$.Nome_Departamento") AS Nome_Departamento,
    JSON_EXTRACT(JSONVALUE, "$.Projeto[0].Nome_Projeto") AS Nome_Projeto,
    t2.CPF_FUNCIONARIO,
    t2.Horas
FROM tb_object_departamento_trabalha_em
CROSS JOIN JSON_TABLE(
    JSON_EXTRACT(JSONVALUE, "$.Projeto[0].Horas_Trabalhadas"),
    "$[*]"
    COLUMNS (
        CPF_FUNCIONARIO VARCHAR(11) PATH "$.Cpf_Funcionario",
        Horas INT PATH "$.Horas"
    )
) t2;


-- utilize esse comando para limpar a tabela se for necessário
TRUNCATE tb_object_departamento_trabalha_em; 
