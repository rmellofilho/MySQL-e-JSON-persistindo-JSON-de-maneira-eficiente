TRUNCATE X;
INSERT INTO X VALUES ('{"key1":"value1"}');
SELECT Y FROM X;

UPDATE X SET Y = JSON_INSERT (Y, "$.key2", "value2");
SELECT Y FROM X;
UPDATE X SET Y = JSON_INSERT (Y, "$.key3", "value3", "$.key4", "value4");
SELECT Y FROM X;

UPDATE X SET Y = JSON_INSERT (Y, "$.key3", "value1x", "$.key5", "value5");
SELECT Y FROM X;

UPDATE X SET Y = JSON_REPLACE (Y, "$.key1", "value1x");
SELECT Y FROM X;

UPDATE X SET Y = JSON_REPLACE (Y, "$.key2", "value2x", "$.key6", "value6x");
SELECT Y FROM X;

UPDATE X SET Y = JSON_REMOVE (Y, "$.key1");
SELECT Y FROM X;

UPDATE X SET Y = JSON_REMOVE (Y, "$.key5", "$.key3");
SELECT Y FROM X;


UPDATE X SET Y = JSON_SET(Y, "$.key1", "value1y", "$.key5", "value5");
SELECT Y FROM X;

UPDATE X SET Y = JSON_SET(Y, "$.key1", "value1y", "$.key5", "");
SELECT Y FROM X;

