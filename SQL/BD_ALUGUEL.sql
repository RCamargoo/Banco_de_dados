CREATE DATABASE IF NOT EXISTS BD_ALUGUEL;
USE BD_ALUGUEL;

CREATE TABLE IF NOT EXISTS CLIENTE(
	
    CLI_ID			INT AUTO_INCREMENT PRIMARY KEY,
    CLI_NOME 		VARCHAR(50) NOT NULL,
    CLI_CPF 		VARCHAR(11) NOT NULL,
    CLI_EMAIL 		VARCHAR(50) NOT NULL,
    CLI_TELEFONE	VARCHAR(9) NOT NULL
	
);

ALTER TABLE CLIENTE
MODIFY COLUMN CLI_CPF VARCHAR(11) NOT NULL UNIQUE;

CREATE TABLE IF NOT EXISTS PRODUTO(
    PRO_ID 					INT AUTO_INCREMENT PRIMARY KEY,
    PRO_NOME 				VARCHAR(50) NOT NULL,
    PRO_DESCRICAO	 		VARCHAR(200),
    PRO_PRECO 				DOUBLE NOT NULL,
    PRO_QTD_DISPONIVEIS 	INT NOT NULL

);

CREATE TABLE IF NOT EXISTS ALUGUEL(
	ALU_ID 				INT AUTO_INCREMENT PRIMARY KEY,
    ALU_DATA_ALUGUEL 	DATE NOT NULL,
    ALU_DATA_DEVOLUCAO 	DATE NOT NULL,
    ALU_VALOR 			DOUBLE NOT NULL,
    FK_CLI_ID 			INT,
    FOREIGN KEY (FK_CLI_ID) REFERENCES CLIENTE(CLI_ID)

);

CREATE TABLE IF NOT EXISTS ALUGUEL_PRODUTO(
	ALP_ID INT AUTO_INCREMENT PRIMARY KEY,
    FK_PRO_ID INT NOT NULL,
    FK_ALU_ID INT NOT NULL,
    FOREIGN KEY (FK_PRO_ID) REFERENCES PRODUTO (PRO_ID),
    FOREIGN KEY (FK_ALU_ID) REFERENCES ALUGUEL (ALU_ID)

);

INSERT INTO CLIENTE ( CLI_NOME, CLI_CPF, CLI_EMAIL, CLI_TELEFONE)
VALUES ("Rafael", "42973404886", "rafael@email.com", "990258869");

INSERT INTO CLIENTE ( CLI_NOME, CLI_CPF, CLI_EMAIL, CLI_TELEFONE)
VALUES ("Davi", "12345678901", "davi@email.com", "123456789");


INSERT INTO PRODUTO (	PRO_NOME, 
						PRO_PRECO, 
						PRO_QTD_DISPONIVEIS)
                        
VALUES ("Ipone 18 Pro Max", 590.90, 100);


INSERT INTO PRODUTO (	PRO_NOME, 
						PRO_DESCRICAO,
						PRO_PRECO, 
						PRO_QTD_DISPONIVEIS)
                        
VALUES ("Lancha Turbo", "Lancha Tubo Para Rio e Mar", 5590.90, 5);


INSERT INTO ALUGUEL(ALU_DATA_ALUGUEL, ALU_DATA_DEVOLUCAO, ALU_VALOR, FK_CLI_ID )
VALUES ("2026-10-08", "2026-10-15", 600.90, 2);


INSERT INTO ALUGUEL_PRODUTO(FK_PRO_ID, FK_ALU_ID)
VALUES(1,1);


INSERT INTO CLIENTE (CLI_NOME, CLI_CPF, CLI_EMAIL, CLI_TELEFONE)
VALUES		("Ana Silva", "12345674901", "Ana.Silva@email.com", "889125341"),
			("Bruno Souza", "22345678902", "Bruno.Souza@email.com", "119112947"),
			("Carla Mendes", "32345678903", "Carla.Mendes@email.com", "649550462"),
			("Daniel Rocha", "42345678904", "Daniel.Rocha@email.com", "349239228"),
			("Eliane Costa", "52345678905", "Eliane.Costa@email.com", "929019576"),
			("Felipe Lima", "62345678906", "Felipe.Lima@email.com", "829738651"),
			("Gisele Martins", "72345678907", "Gisele.Martins@email.com", "329383245"),
			("Henrique Alves", "82345678908", "Henrique.Alves@email.com", "939570819"),
			("Isabela Ferreira", "92345678909", "Isabela.Ferreira@email.com", "929797184"),
			("João Oliveira", "02345678910", "João.Oliveira@email.com", "279783499");
                     

-- Notebook Dell Inspiron | Notebook com processador Intel Core i7, 16GB de RAM, 512GB SSD | 450 | 10
-- Smartphone Samsung Galaxy S21 | Smartphone com tela de 6.2 polegadas, 128GB de armazenamento | 350 | 15
-- TV LG 55" 4K | Smart TV com resolução 4K e HDR | 280 | 8
-- Drone DJI Phantom 4 | Drone com câmera 4K e estabilização de imagem | 300 | 55
-- Câm. Canon EOS T7 | Câmera DSLR com lente 18-55mm, 24.1MP | 250 | 2
-- Câmera GoPro Hero 9 | Câmera de ação com resolução 5K e resistência à água | 80 | 60
-- Tenda Eventos 5x5m | Tenda resistente à água e fácil de montar | 200 | 4
-- Microfone Shure SM58 | Microfone para apresentações e shows | 40 | 35
-- Mesa de Som Behringer | Mesa de som com 16 canais e efeitos integrados | 500 | 3
-- Kit de Iluminação Fotográfica | Kit com softbox, tripés e lâmpadas de LED | 100 | 6

INSERT INTO PRODUTO (	PRO_NOME, 
						PRO_DESCRICAO,
						PRO_PRECO, 
						PRO_QTD_DISPONIVEIS)
                        
VALUES  ("Notebook Dell Inspiron", "Notebook com processador Intel Core i7, 16GB de RAM, 512GB SSD", 450, 10),
		("Smartphone Samsung Galaxy S21", "Smartphone com tela de 6.2 polegadas, 128GB de armazenamento", 350, 15),
		("TV LG 55\" 4K", "Smart TV com resolução 4K e HDR", 280, 8),
		("Drone DJI Phantom 4", "Drone com câmera 4K e estabilização de imagem", 300, 55),
		("Câm. Canon EOS T7", "Câmera DSLR com lente 18-55mm, 24.1MP", 250, 2),
		("Câmera GoPro Hero 9", "Câmera de ação com resolução 5K e resistência à água", 80, 60),
		("Tenda Eventos 5x5m", "Tenda resistente à água e fácil de montar", 200, 4),
		("Microfone Shure SM58", "Microfone para apresentações e shows", 40, 35),
		("Mesa de Som Behringer", "Mesa de som com 16 canais e efeitos integrados", 500, 3),
		("Kit de Iluminação Fotográfica", "Kit com softbox, tripés e lâmpadas de LED", 100, 6);

SELECT * FROM PRODUTO;
SELECT * FROM CLIENTE;
SELECT * FROM ALUGUEL_PRODUTO;
SELECT * FROM ALUGUEL;

-- ESSE É PRA SELECIONAR UMA COLUNA ESPECIFICA.!!!

SELECT PRO_NOME, PRO_DESCRICAO FROM PRODUTO;
SELECT PRO_NOME, PRO_DESCRICAO, PRO_PRECO FROM PRODUTO;

-- SELECIONAR APENAS OS PRODUTOS COM PREÇO MAIOR QUE 250

SELECT * FROM PRODUTO WHERE PRO_PRECO > 250;
SELECT * FROM PRODUTO WHERE PRO_PRECO < 250;

-- SELECIONAR APENAS O PRODUTO DE ID 3!!!

SELECT * FROM PRODUTO WHERE PRO_ID = 3;
SELECT PRO_ID, PRO_NOME FROM PRODUTO WHERE PRO_ID = 3;

-- SELECIONAR TODOS OS PRODUTOS QUE COMTENHA 'NOTEBOOK' E 'A' EM QULQUER PARTE DO NOME!!!

SELECT * FROM PRODUTO WHERE PRO_NOME LIKE '%NOTEBOOK%';
SELECT * FROM PRODUTO WHERE PRO_NOME LIKE '%A%';

-- ATUALIZAR A QUANTIDADE DE NOTEBOKK PARA 200!!!

-- ---------------------------------------------------------------------------------------------------
-- ----------------------------------!!!   update PRSISA TER WHERE   !!!------------------------------
-- ---------------------------------------------------------------------------------------------------

UPDATE PRODUTO SET PRO_QTD_DISPONIVEIS = 200 WHERE PRO_ID = 3; 

-- ATUALIZACAO DA DESCRISCAO DO NOTEBOOK PARA VAZIO

UPDATE PRODUTO SET PRO_DESCRICAO = NULL WHERE PRO_ID = 3;

-- APAGAR (DELETAR) O NOTEBOOK

DELETE FROM PRODUTO WHERE PRO_ID = 3;
SELECT * FROM PRODUTO WHERE PRO_NOME LIKE '%NOTEBOOK%';







