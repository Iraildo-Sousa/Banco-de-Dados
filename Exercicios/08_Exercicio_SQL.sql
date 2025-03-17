-- SELECT * FROM relatorioEmpreiteira;

/* O cliente solicitou um relatório de quem está trabalhando no Canteiro de Obra e qual a empresa que é responsável e qual a data que iniciou a obra e qual a previsão de dias para a obra.

Nome dos Funcionários Canteiro da Obra
Função dos Funcionários 
Nome da Empresa Responsável
Data Inicio da Obra
Previsão da Obra
Valor da Obra */



SELECT * FROM canteiroObra;
SELECT * FROM obra;
SELECT * FROM projeto;
SELECT * FROM colaborador;
SELECT * FROM empreiteira;
SELECT * FROM pessoa;

SELECT 

O.dataInicio, O.previsao, O.valor, PR.nomeProjeto, PE.nomeFantasia, C.funcao, PC.nome AS nomeFuncionario, PCO.nome AS nomeResponsavel, (PR.valor + O.valor) AS totalObra

FROM canteiroObra CO 

INNER JOIN obra O ON O.idObra = CO.idObra
INNER JOIN projeto PR ON PR.idProjeto = O.idProjeto
INNER JOIN colaborador CP ON CP.idColaborador = PR.idColaborador
INNER JOIN pessoa PCO ON PCO.idPessoa = CP.idPessoa
INNER JOIN empreiteira E ON E.idEmpreiteira = O.idEmpreiteira
INNER JOIN pessoa PE ON PE.idPessoa = E.idPessoa
INNER JOIN colaborador C ON C.idColaborador = CO.idColaborador
INNER JOIN pessoa PC ON PC.idPessoa = C.idPessoa


/*O cliente solicitou que adicionasse no relatório passado as seguintes informações:
Nome do projeto
Nome da pessoa responsável pelo projeto.
Valor total do projeto com a obra.*/