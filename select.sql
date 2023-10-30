SELECT nome, preco FROM produtos WHERE id_fornecedor = '6';

-- vai selecionar a coluna nome e preco da tabela produtos cujo fornecedor é 6

OR e AND

select * from produtos where preco = 200 OR preco = 140;
select * from produtos where preco = 200 AND  miniestoque = 5;
select * from produtos where (preco = 200) AND (preco < 1000); 
select * from produtos where (preco > 140 AND preco < 1000) OR id_fornecedor = 3;
-- preferência de colocar as premissas entre parenteses

-- BETWEEN e IN
SELECT * FROM produtos WHERE estoque BETWEEN 5 AND 10;

SELECT * FROM produtos WHERE id_fornecedor IN (1,6,3);
-- seleciona baseado em multiplas opções.

-- ORDER BY
 SELECT * FROM produtos WHERE id_fornecedor IN (1,6,3) ORDER BY estoque ASC;
--  OBS: a ordem será colocada depois das eventuais condições.

SELECT * FROM produtos ORDER BY minestoque ASC, nome DESC;
-- Ordena primeiro por miniestoque, depois por nome os que estão empatados.


SELECT * FROM produtos WHERE miniestoque BETWEEN 8 AND 50 ORDER BY miniestoque LIMIT 4;
-- Limita o resultados em 4 elementos

SELECT * FROM produtos LIMIT 6,3;
-- Pula 6 items e mostra 3

SELECT COUNT(*) FROM produtos WHERE id_fornecedor = 6;
-- Retornará quantos produtos do fornecedor 6 (count 10)

SELECT COUNT(*) AS contagem FROM produtos WHERE id_fornecedor = 6;
-- Podemos usar um alias para uma melhor visualização (contagem = 10)

SELECT AVG(preco) AS media_preco, COUNT(*) AS total FROM produtos;
SELECT AVG(preco) AS media_preco, COUNT(*) AS total FROM produtos WHERE id_fornecedor = 3;

SELECT AVG(preco) AS media_preco,
 COUNT(*) AS total,
 SUM(estoque) AS soma_estoque 
FROM produtos WHERE id_fornecedor = 3;

SELECT SUM(estoque) AS estoqueTotal, id_fornecedor FROM produtos GROUP BY id_fornecedor;
-- Aqui ele vai somar os produtos do estoque e vai separar a soma agrupando por fornecedor

-- SUBQUERY
SELECT *, (SELECT fornecedores.nome FROM fornecedores WHERE fornecedores.id = produtos.id_fornecedor) as fornecedor FROM produtos;
-- Essa subquery foi usada entre o SELECT e o FROM, a subquery deve retornar somente um resultado.
-- Possui uma carga maior de processamento pois faz mais consultas que o normal

-- INNER JOIN
SELECT produtos.id, produtos.nome, produtos.preco, produtos.estoque, produtos.miniestoque, fornecedores.nome  FROM produtos INNER JOIN fornecedores ON fornecedores.id = produtos.id_fornecedor;
-- INNER JOIN vai juntar as duas tabelas, nesse caso junta os fornecedores através do id do fornecedor em produtos
SELECT produtos.*, fornecedores.nome AS fornecedor FROM produtos INNER JOIN fornecedores ON fornecedores.id = produtos.id_fornecedor;
-- Essa é uma forma resumida

-- RIGHT JOIN retorna todos os resultados da tabela da direita, independentemente se ele tem algum resultado na tabela da esquerda. Nesse caso temos o Google como fornecedor e os demais campos ficam com NULL.

-- LEFT JOIN retorna todos os produtos da esquerda independente da tabela da direita ter relação.

-- INNER JOIN só vai pegar o item em que os dois registros baterem. Se tiver um produto sem fornecedor ele não vem. vice versa.

-- INSERT INTO
INSERT INTO usuarios (nome,datacadastro) VALUES ('Fulano','2020-12-30'), ('Beltrano',NOW());


-- UPDATE para alterar algum dado.

UPDATE usuarios SET nome = 'Pedro da Silva' WHERE usuarios.id = 2;

-- 'update sem where'
-- UPDATE usuarios SET nome = 'Vanderlei';
-- vai mudar o nome de todos os registros. Para evitar isso digite primeiro
-- UPDATE usuarios SET WHERE ... ;


UPDATE produtos SET preco = preco * 1.1 WHERE id_fornecedor = 6;
-- Esse comando altera valores de mais de um registro.
-- Aí digita a condição depois o resto do comando.

DELETE
DELETE FROM fornecedores WHERE id = 8;
