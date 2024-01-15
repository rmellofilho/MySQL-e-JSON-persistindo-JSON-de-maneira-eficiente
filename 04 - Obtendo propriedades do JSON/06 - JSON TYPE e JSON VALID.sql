

SELECT JSON_TYPE('{"a":[10,true]}');

SELECT JSON_EXTRACT('{"a":[10,true]}','$.a');

SELECT JSON_TYPE(JSON_EXTRACT('{"a":[10,true]}','$.a'));

SELECT JSON_EXTRACT('{"a":[10,true]}','$.a');

SELECT JSON_TYPE(JSON_EXTRACT('{"a":[10, true]}','$.a[0]'));

SELECT JSON_TYPE(JSON_EXTRACT('{"a":[10, true]}',"$.a[1]"));


SELECT JSON_VALID('{"a":[10, true]}');
SELECT JSON_VALID('{"a":[10, true]}');
SELECT JSON_VALID('{"a":[10, true]');




