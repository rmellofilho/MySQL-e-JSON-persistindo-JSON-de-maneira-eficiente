
SELECT JSON_LENGTH('{}');
SELECT JSON_LENGTH('{"nome":"Joao"}');
SELECT JSON_LENGTH('{"nome":"Joao","sobrenome":"Machado"}');
SELECT JSON_LENGTH('{"nome":"Joao","sobrenome":"Machado","hobby":["praia"]}');
SELECT JSON_LENGTH('{"nome":"Joao","sobrenome":"Machado","hobby":["praia","volei"]}');
SELECT JSON_LENGTH('{"nome":"Joao","sobrenome":"Machado","hobby":["praia","volei"],"filho":{"nome":"carlos"}}');
SELECT JSON_LENGTH('["PRAIA","VOLEI","FUTEBOL"]');
SELECT JSON_LENGTH('{"HOBBY":["PRAIA","VOLEI","FUTEBOL"]}');
SELECT doc FROM countryinfo;
SELECT JSON_LENGTH(doc) FROM countryinfo;
SELECT doc FROM countryinfo WHERE JSON_LENGTH(doc) <> 8;
