SELECT nome, preco FROM produtos WHERE id_fornecedor = '6';

-- vai selecionar a coluna nome e preco da tabela produtos cujo fornecedor é 6

OR e AND

select * from produtos where preco = 200 OR preco = 140;
select * from produtos where preco = 200 AND  miniestoque = 5;
select * from produtos where (preco = 200) AND (preco < 1000); 
select * from produtos where (preco > 140 AND preco < 1000) OR id_fornecedor = 3;
-- preferência de colocar as premissas entre parenteses

