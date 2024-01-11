-- Criação da tabela
CREATE TABLE tb_object_trabalha_em (
    id INT AUTO_INCREMENT PRIMARY KEY,
    JSONVALUE JSON
);

-- Inserção de dados de exemplo
INSERT INTO tb_object_trabalha_em (JSONVALUE) VALUES
('{
  "Cpf_Funcionario": "111222333",
  "Numero_Projeto": "5",
  "Horas": 30
}'),
('{
  "Cpf_Funcionario": "1112223334",
  "Numero_Projeto": "4",
  "Horas": 25
}'),
('{
  "Cpf_Funcionario": "1112223333",
  "Numero_Projeto": "3",
  "Horas": 21
}'),
('{
  "Cpf_Funcionario": "1112223332",
  "Numero_Projeto": "2",
  "Horas": 44
}'),
('{
  "Cpf_Funcionario": "111222331",
  "Numero_Projeto": "1",
  "Horas": 34
}');


-- Obtém a média das horas trabalhadas
SELECT 
	AVG(JSON_EXTRACT(JSONVALUE, "$.Horas")) AS media_horas
FROM tb_object_trabalha_em;
