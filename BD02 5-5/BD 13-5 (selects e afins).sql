-- mostra só 10 linhas
SELECT * FROM Cliente LIMIT 10;

-- Mostra em ordem alfabética
SELECT * FROM Cliente ORDER BY nome;

-- filtrar por um valor específico
SELECT * FROM Cliente WHERE nome = 'Ana';