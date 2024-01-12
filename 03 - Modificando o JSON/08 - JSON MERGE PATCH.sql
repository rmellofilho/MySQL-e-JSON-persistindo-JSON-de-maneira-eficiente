
SELECT JSON_MERGE_PATCH('{"nome":"James","sobrenome":"Bond"}', '{"salario":10000,"cidade":"Rio de Janeiro"}');

SELECT JSON_MERGE_PATCH('{"nome":"James","sobrenome":"Bond"}', '{"nome":"Maxwell","cidade":"Rio de Janeiro"}');

SELECT JSON_MERGE_PATCH('[1,2]','[true, false]');

SELECT JSON_MERGE_PATCH('{"array":[1,2]}','{"array2":[true, false]}');

SELECT JSON_MERGE_PATCH('{"array":[1,2]}','{"array":[true, false]}');