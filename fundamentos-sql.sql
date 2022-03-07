/*Criação*/
CREATE TABLE aluno(
	id INTEGER PRIMARY KEY,
	nome VARCHAR(255),
	cpf CHAR(11),
	observação TEXT,
	idade INTEGER,
	dinheiro NUMERIC(10,2),
	altura real,
	ativo BOOLEAN,
	data_nascimento DATE,
	hora_aula TIME,
	data_matricula timestamp
);
SELECT * FROM aluno;
INSERT INTO aluno (
	id,
	nome,
	cpf,
	observação,
	idade,
	dinheiro,
	altura,
	ativo,
	data_nascimento,
	hora_aula,
	data_matricula
)
VALUES(
	1,
	'Diogo',
	'50958511802',
	'Lorem IMpsum',
	35,
	100.50,
	1.81,
	TRUE,
	'1984-08-27',
	'17:30:00',
	'2020-02-08 12:32:45'

);
/*Atualização*/
SELECT * FROM aluno
UPDATE aluno SET 
	nome = 'Nico',
	cpf = '12435678954',
	observação = 'Teste',
	idade = 38,
	dinheiro = 14.23,
	altura = 1.90,
	ativo = FALSE,
	data_nascimento = '1980-02-02',
	hora_aula = '13:00:00',
	data_matricula = '2020-02-02 15:00:00'
WHERE id = 1;

SELECT nome,idade FROM aluno;

INSERT INTO aluno (id, nome) VALUES (2,'Zezein');
INSERT INTO aluno (id, nome) VALUES (3,'Cleitin');
INSERT INTO aluno (id, nome) VALUES (4,'Fumin');
INSERT INTO aluno (id, nome) VALUES (5,'Joazin');

/*WHERE para uma busca expecifica em um valor*/
/*IS ou IS NOT passa uma parametro para a busca*/
SELECT * FROM aluno WHERE cpf IS NULL
SELECT * FROM aluno WHERE cpf IS NOT NULL
SELECT * FROM aluno WHERE idade BETWEEN 10 AND 40
SELECT * FROM aluno WHERE ativo = true
SELECT * FROM aluno WHERE ativo IS NULL

/*LIKE para algum valor semelhante ao buscado*/
/*AND retorna quando as duas condições forem verdadeiras*/
/*OR para um outro parametro verdadeiro ou não */
/* TERMINA com ... para '%' no começo do parametro e
COMEÇA com... para '%' no fim do parametro*/
SELECT * FROM aluno WHERE nome LIKE 'J%'AND cpf IS NULL 
OR nome LIKE 'Z%'

/*CRIANDO TABELA COM CHAVE PRIMÁRIA*/
CREATE TABLE curso(
	id INTEGER,
	nome VARCHAR(255)
);
INSERT INTO curso (id, nome) VALUES (NULL, NULL);
SELECT * FROM curso;
/*está sendo possivel add valores nulos ... para isso usa-se NOT NULL*/
DROP TABLE curso;

CREATE TABLE curso(
	/*UNIQUE para impedir de duplicar o mesmo valo ou usa-se a PRIMARY KEYr*/
	id INTEGER PRIMARY KEY,
	nome VARCHAR(255) NOT NULL
);
INSERT INTO curso (id, nome) VALUES (1, 'HTML');
INSERT INTO curso (id, nome) VALUES (2, 'CSS');
SELECT * FROM curso;

/*CRIANDO TABELA COM CHAVE ESTRANGEIRA*/
/*para evitar valores que não existem no sistema e relacionar elementos de tabelas usa-se a chave estrangeira*/
CREATE TABLE aluno_curso(
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id, curso_id),
	FOREIGN KEY (aluno_id)
		REFERENCES aluno (id),
	FOREIGN KEY (curso_id)
		REFERENCES curso (id)
);
	INSERT INTO aluno_curso (aluno_id,  curso_id) VALUES (1,1);
	INSERT INTO aluno_curso (aluno_id,  curso_id) VALUES (2,1);
	INSERT INTO aluno_curso (aluno_id, curso_id)  VALUES (3,2);
	
/*CONSULTAS COM RELACIONAMENTOS*/
SELECT aluno.nome as "Nome do aluno", curso.nome as "nome do curso" FROM aluno 
JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
JOIN curso ON curso.id = aluno_curso.curso_id

/*LEFT, RIGHT e FULL JOINS*/
/*LEFT para dados existentes do lado esquerdo da tabela e RIGHT para o direito. 
No exemplo seguinte, para alunos que não estão matriculados em nenhum curso: */
SELECT aluno.nome as "Nome do aluno", curso.nome as "nome do curso" FROM aluno 
LEFT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
LEFT JOIN curso ON curso.id = aluno_curso.curso_id
/*FULL JOIN vai trazer todos os dados mesmo que seja nulo*/

/*USANDO O CASCADE*/
/*O CASCADE  DELETE permitira a esxclusão de um dado da tabela
mesmo se estiver vínculado com outra. 
O CASCADE UPDATE permitira alterar: 

CREATE TABLE aluno_curso(
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id, curso_id),
	FOREIGN KEY (aluno_id)
		REFERENCES aluno (id),
	ON DELETE CASCADE
	ON UPDATE CASCADE
	FOREIGN KEY (curso_id)
		REFERENCES curso (id)
);
*/
/*Ordenando Consultas
EXEMPLO: Você está trabalhando em uma universidade,
que aplicou uma prova de vestibular e precisa saber os 100 primeiros colocados, 
ordenados pela maior nota e por ordem alfabética.

SELECT nome, nota FROM notas
ORDER BY nota DESC, nome LIMIT
*/

/*Funções de agregação
-- COUNT - Retorna a qtt de registros
-- SUM - Retorna a soma dos registros
-- MAX - Retorna o maior valor dos registros 
-- MIN - Retorna o menor valor dos registros
-- AVG - Retorna a média dos registros
*/









