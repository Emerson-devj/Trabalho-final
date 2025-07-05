-- Inserindo dados na tabela Estado_civil
INSERT INTO Estado_civil (descricao) VALUES 
('Solteiro(a)'),
('Casado(a)'),
('Divorciado(a)'),
('Viúvo(a)'),
('Separado(a)');

-- Inserindo dados na tabela Sexo
INSERT INTO Sexo (descricao) VALUES 
('Masculino'),
('Feminino'),
('Outro');

-- Inserindo dados na tabela Profissao
INSERT INTO Profissao (descricao) VALUES 
('Engenheiro'),
('Médico'),
('Advogado'),
('Professor'),
('Empresário'),
('Autônomo'),
('Funcionário Público'),
('Comerciante');

-- Inserindo dados na tabela Cidade
INSERT INTO Cidade (nome) VALUES 
('São Paulo'),
('Rio de Janeiro'),
('Belo Horizonte'),
('Porto Alegre'),
('Curitiba');

-- Inserindo dados na tabela Bairro
INSERT INTO Bairro (nome, descricao, Cidade_idCidade) VALUES 
('Moema', 'Bairro nobre de São Paulo', 1),
('Ipanema', 'Bairro nobre do Rio de Janeiro', 2),
('Savassi', 'Bairro nobre de Belo Horizonte', 3),
('Moinhos de Vento', 'Bairro nobre de Porto Alegre', 4),
('Batel', 'Bairro nobre de Curitiba', 5),
('Vila Madalena', 'Bairro boêmio de São Paulo', 1),
('Copacabana', 'Bairro famoso do Rio de Janeiro', 2);

-- Inserindo dados na tabela Endereco
INSERT INTO Endereco (cep, logradouro, complemento, numero, Bairro_idBairro) VALUES 
('04094-000', 'Av. Ibirapuera', 'Apto 101', 3100, 1),
('22020-010', 'Rua Visconde de Pirajá', 'Casa 2', 500, 2),
('30380-112', 'Rua Antônio de Albuquerque', 'Sala 301', 1100, 3),
('90570-010', 'Rua Padre Chagas', 'Apto 502', 400, 4),
('80420-180', 'Av. do Batel', 'Casa', 1750, 5),
('05436-020', 'Rua Aspicuelta', 'Apto 303', 500, 6),
('22021-010', 'Av. Nossa Senhora de Copacabana', 'Apto 1201', 1200, 7);

-- Inserindo dados na tabela Cliente_proprietario
INSERT INTO Cliente_proprietario (nome, cpf, Estado_civil_idEstado_civil, Sexo_idSexo, Proficao_idProficao, Endereco_idEndereco, Endereco_Bairro_idBairro) VALUES 
('João Silva', '123.456.789-01', 2, 1, 1, 1, 1),
('Maria Oliveira', '987.654.321-09', 1, 2, 3, 2, 2),
('Carlos Souza', '456.789.123-45', 2, 1, 5, 3, 3),
('Ana Pereira', '789.123.456-78', 3, 2, 2, 4, 4),
('Pedro Costa', '321.654.987-32', 4, 1, 4, 5, 5);

-- Inserindo dados na tabela Status
INSERT INTO Status (descricao) VALUES 
('Disponível'),
('Alugado'),
('Vendido'),
('Em reforma'),
('Indisponível');

-- Inserindo dados na tabela Categoria
INSERT INTO Categoria (nome) VALUES 
('Residencial'),
('Comercial'),
('Terreno'),
('Industrial'),
('Rural');

-- Inserindo dados na tabela Visita
INSERT INTO Visita (descricao) VALUES 
('Visita agendada para avaliação'),
('Visita técnica para vistoria'),
('Visita de potencial comprador'),
('Visita de manutenção'),
('Visita de medição');

-- Inserindo dados na tabela Cliente_usuario
INSERT INTO Cliente_usuario (nome, cpf, Estado_civil_idEstado_civil, Sexo_idSexo, Endereco_idEndereco, Endereco_Bairro_idBairro, Visita_idVisita) VALUES 
('Fernando Lima', '111.222.333-44', 1, 1, 6, 6, 1),
('Juliana Santos', '222.333.444-55', 2, 2, 7, 7, 2),
('Ricardo Almeida', '333.444.555-66', 1, 1, 1, 1, 3),
('Patrícia Nunes', '444.555.666-77', 3, 2, 2, 2, 4),
('Marcos Vieira', '555.666.777-88', 2, 1, 3, 3, 5);

-- Inserindo dados na tabela Imovel
-- Alterar o último registro para incluir um valor para locação (mesmo que zero)
INSERT INTO Imovel (foto_url, valor_sugerido_venda, valor_sugerido_locacao, Cliente_proprietario_idCliente_proprietario, Cliente_proprietario_Estado_civil_idEstado_civil, Cliente_proprietario_Sexo_idSexo, Cliente_proprietario_Proficao_idProficao, Status_idStatus, Cliente_usuario_idCliente_usuario, Cliente_usuario_Estado_civil_idEstado_civil, Cliente_usuario_Sexo_idSexo, Categoria_idCategoria, data_construcao, Visita_idVisita, Endereco_idEndereco, Endereco_Bairro_idBairro) VALUES 
('casa_moema.jpg', 1500000.00, 5000.00, 1, 2, 1, 1, 1, 1, 1, 1, 1, '2010-05-15', 1, 1, 1),
('apto_ipanema.jpg', 2500000.00, 8000.00, 2, 1, 2, 3, 2, 2, 2, 2, 1, '2015-08-20', 2, 2, 2),
('casa_savassi.jpg', 1800000.00, 6000.00, 3, 2, 1, 5, 1, 3, 1, 1, 1, '2012-03-10', 3, 3, 3),
('sala_comercial.jpg', 1200000.00, 4000.00, 4, 3, 2, 2, 1, 4, 3, 2, 2, '2018-11-05', 4, 4, 4),
('terreno_batel.jpg', 900000.00, 0.00, 5, 4, 1, 4, 1, 5, 2, 1, 3, '2020-01-01', 5, 5, 5);

-- Inserindo dados na tabela Casa
INSERT INTO Casa (qtd_quartos, qtd_suites, qtd_salas_estar, qtd_salas_jantar, vagas_garagem, area_m2, descricao, Imovel_idImovel, armario_embutido) VALUES 
(4, 2, 2, 1, 3, 250.0, 'Casa espaçosa com jardim', 1, 1),
(3, 1, 1, 1, 2, 180.0, 'Casa moderna com piscina', 3, 1);


-- Inserindo dados na tabela Apartamento
INSERT INTO Apartamento (qtd_suite, qtd_sala_estar, qtd_sala_jantar, area_m2, armario_embutido, descricao, andar, valor_codominio, vagas_garagem, Imovel_idImovel, portaria24hrs) VALUES 
(3, 2, 1, 150.0, 1, 'Apartamento luxuoso com vista para o mar', 12, 1200.00, 2, 2, 1);

-- Inserindo dados na tabela SalaComercial
INSERT INTO SalaComercial (area_m2, qtd_comodos, qtd_banheiros, Imovel_idImovel) VALUES 
(120.0, 3, 2, 4);

-- Inserindo dados na tabela Tipo_terreno
INSERT INTO Tipo_terreno (descricao) VALUES 
('Residencial'),
('Comercial'),
('Industrial'),
('Misto');

-- Inserindo dados na tabela Terreno
INSERT INTO Terreno (area_m2, largura, comprimento, Imovel_idImovel, Tipo_terreno_idTipo_terreno) VALUES 
(500.0, 20.0, 25.0, 3, 1);

-- Inserindo dados na tabela Fiador
INSERT INTO Fiador (nome, renda) VALUES 
('Roberto Mendes', 15000.00),
('Sandra Gomes', 12000.00),
('Luiz Fernando', 18000.00);

-- Inserindo dados na tabela Indicacao
INSERT INTO Indicacao (nome) VALUES 
('Amigo'),
('Familiar'),
('Colega de trabalho'),
('Site de imóveis'),
('Corretor');

-- Inserindo dados na tabela TpoTransação
INSERT INTO TpoTransação (idTpoTransação) VALUES 
(1), -- Locação
(2), -- Venda
(3); -- Permuta

-- Inserindo dados na tabela Transação
INSERT INTO Transação (valor, TpoTransação_idTpoTransação) VALUES 
('5000.00', 1),
('2500000.00', 2),
('6000.00', 1),
('4000.00', 1),
('900000.00', 2);

-- Inserindo dados na tabela Comissao
INSERT INTO Comissao (porcentagem, Transação_idTransação, Transação_TpoTransação_idTpoTransação) VALUES 
(5.0, 1, 1),
(3.0, 2, 2),
(5.0, 3, 1),
(5.0, 4, 1),
(3.0, 5, 2);

-- Inserindo dados na tabela Cargo
INSERT INTO Cargo (salario_base, descricao) VALUES 
(3000.00, 'Corretor de Imóveis'),
(2500.00, 'Assistente Administrativo'),
(5000.00, 'Gerente'),
(2000.00, 'Recepcionista'),
(3500.00, 'Analista de Negócios');

-- Inserindo dados na tabela Telefone
INSERT INTO Telefone (ddd, numero, Cliente_proprietario_idCliente_proprietario, Cliente_proprietario_Estado_civil_idEstado_civil, Cliente_proprietario_Sexo_idSexo, Cliente_proprietario_Proficao_idProficao, Cliente_proprietario_Endereco_idEndereco, Cliente_proprietario_Endereco_Bairro_idBairro, Cliente_usuario_idCliente_usuario, Cliente_usuario_Estado_civil_idEstado_civil, Cliente_usuario_Sexo_idSexo, Cliente_usuario_Endereco_idEndereco, Cliente_usuario_Endereco_Bairro_idBairro, Cliente_usuario_Funcionario_idFuncionario, Cliente_usuario_Funcionario_Sexo_idSexo) VALUES 
(11, 987654321, 1, 2, 1, 1, 1, 1, 1, 1, 1, 6, 6, 1, 1),
(21, 998877665, 2, 1, 2, 3, 2, 2, 2, 2, 2, 7, 7, 1, 1),
(31, 912345678, 3, 2, 1, 5, 3, 3, 3, 1, 1, 1, 1, 1, 1),
(51, 923456789, 4, 3, 2, 2, 4, 4, 4, 3, 2, 2, 2, 1, 1),
(41, 934567890, 5, 4, 1, 4, 5, 5, 5, 2, 1, 3, 3, 1, 1);

-- Inserindo dados na tabela Funcionario
INSERT INTO Funcionario (nome, cpf, salario_total, Sexo_idSexo, Comissao_idComissao, Comissao_Transação_idTransação, Comissao_Transação_TpoTransação_idTpoTransação, Telefone_idTelefone, Endereco_idEndereco, Endereco_Bairro_idBairro) VALUES 
('Marcos Andrade', '111.222.333-44', '5000.00', 1, 1, 1, 1, 1, 6, 6),
('Carla Ribeiro', '222.333.444-55', '4500.00', 2, 2, 2, 2, 2, 7, 7),
('Gustavo Henrique', '333.444.555-66', '5500.00', 1, 3, 3, 1, 3, 1, 1);

-- Inserindo dados na tabela Manutencao
-- Inserção para imóvel 1
INSERT INTO Manutencao (descricao, Imovel_idImovel, 
    Imovel_Cliente_proprietario_idCliente_proprietario,
    Imovel_Cliente_proprietario_Estado_civil_idEstado_civil,
    Imovel_Cliente_proprietario_Sexo_idSexo,
    Imovel_Cliente_proprietario_Proficao_idProficao,
    Imovel_Status_idStatus,
    Imovel_Cliente_usuario_idCliente_usuario,
    Imovel_Cliente_usuario_Estado_civil_idEstado_civil,
    Imovel_Cliente_usuario_Sexo_idSexo,
    Imovel_Categoria_idCategoria)
SELECT 
    'Troca de piso',
    idImovel,
    Cliente_proprietario_idCliente_proprietario,
    Cliente_proprietario_Estado_civil_idEstado_civil,
    Cliente_proprietario_Sexo_idSexo,
    Cliente_proprietario_Proficao_idProficao,
    Status_idStatus,
    Cliente_usuario_idCliente_usuario,
    Cliente_usuario_Estado_civil_idEstado_civil,
    Cliente_usuario_Sexo_idSexo,
    Categoria_idCategoria
FROM Imovel
WHERE idImovel = 1;

-- Inserção para imóvel 4
INSERT INTO Manutencao (descricao, Imovel_idImovel, 
    Imovel_Cliente_proprietario_idCliente_proprietario,
    Imovel_Cliente_proprietario_Estado_civil_idEstado_civil,
    Imovel_Cliente_proprietario_Sexo_idSexo,
    Imovel_Cliente_proprietario_Proficao_idProficao,
    Imovel_Status_idStatus,
    Imovel_Cliente_usuario_idCliente_usuario,
    Imovel_Cliente_usuario_Estado_civil_idEstado_civil,
    Imovel_Cliente_usuario_Sexo_idSexo,
    Imovel_Categoria_idCategoria)
SELECT 
    'Pintura interna',
    idImovel,
    Cliente_proprietario_idCliente_proprietario,
    Cliente_proprietario_Estado_civil_idEstado_civil,
    Cliente_proprietario_Sexo_idSexo,
    Cliente_proprietario_Proficao_idProficao,
    Status_idStatus,
    Cliente_usuario_idCliente_usuario,
    Cliente_usuario_Estado_civil_idEstado_civil,
    Cliente_usuario_Sexo_idSexo,
    Categoria_idCategoria
FROM Imovel
WHERE idImovel = 4;

-- Inserção para imóvel 5
INSERT INTO Manutencao (descricao, Imovel_idImovel, 
    Imovel_Cliente_proprietario_idCliente_proprietario,
    Imovel_Cliente_proprietario_Estado_civil_idEstado_civil,
    Imovel_Cliente_proprietario_Sexo_idSexo,
    Imovel_Cliente_proprietario_Proficao_idProficao,
    Imovel_Status_idStatus,
    Imovel_Cliente_usuario_idCliente_usuario,
    Imovel_Cliente_usuario_Estado_civil_idEstado_civil,
    Imovel_Cliente_usuario_Sexo_idSexo,
    Imovel_Categoria_idCategoria)
SELECT 
    'Reparo hidráulico',
    idImovel,
    Cliente_proprietario_idCliente_proprietario,
    Cliente_proprietario_Estado_civil_idEstado_civil,
    Cliente_proprietario_Sexo_idSexo,
    Cliente_proprietario_Proficao_idProficao,
    Status_idStatus,
    Cliente_usuario_idCliente_usuario,
    Cliente_usuario_Estado_civil_idEstado_civil,
    Cliente_usuario_Sexo_idSexo,
    Categoria_idCategoria
FROM Imovel
WHERE idImovel = 5;

-- Inserindo dados na tabela Contrato
INSERT INTO Contrato (numero, documento, data_contrato, Cliente_proprietario_idCliente_proprietario, Cliente_proprietario_Estado_civil_idEstado_civil, Cliente_proprietario_Sexo_idSexo, Cliente_proprietario_Proficao_idProficao, Cliente_proprietario_Endereco_idEndereco, Cliente_proprietario_Endereco_Bairro_idBairro, Cliente_usuario_idCliente_usuario, Cliente_usuario_Estado_civil_idEstado_civil, Cliente_usuario_Sexo_idSexo, Cliente_usuario_Endereco_idEndereco, Cliente_usuario_Endereco_Bairro_idBairro, Cliente_usuario_Visita_idVisita) VALUES 
(1001, 'Contrato de locação residencial', '2025-01-15', 1, 2, 1, 1, 1, 1, 1, 1, 1, 6, 6, 1),
(1002, 'Contrato de compra e venda', '2025-02-20', 2, 1, 2, 3, 2, 2, 2, 2, 2, 7, 7, 2),
(1003, 'Contrato de locação comercial', '2025-03-10', 4, 3, 2, 2, 4, 4, 4, 3, 2, 2, 2, 4);

-- Inserindo dados na tabela Cargo_has_Funcionario

-- Inserindo dados na tabela Locacao
INSERT INTO Locacao (data_locacao, Transação_idTransação, Transação_TpoTransação_idTpoTransação, Cliente_usuario_idCliente_usuario, Cliente_usuario_Estado_civil_idEstado_civil, Cliente_usuario_Sexo_idSexo, Cliente_usuario_Endereco_idEndereco, Cliente_usuario_Endereco_Bairro_idBairro, Cliente_usuario_Funcionario_idFuncionario, Cliente_usuario_Funcionario_Sexo_idSexo, Funcionario_idFuncionario, Funcionario_Sexo_idSexo) VALUES 
('2025-01-15 10:00:00', 1, 1, 1, 1, 1, 6, 6, 1, 1, 1, 1),
('2025-03-01 14:30:00', 3, 1, 3, 1, 1, 1, 1, 1, 1, 2, 2),
('2025-04-10 11:15:00', 4, 1, 4, 3, 2, 2, 2, 1, 1, 3, 1);

-- Inserindo dados na tabela Compra
INSERT INTO Compra (data_compra, Transação_idTransação, Transação_TpoTransação_idTpoTransação, Cliente_usuario_idCliente_usuario, Cliente_usuario_Estado_civil_idEstado_civil, Cliente_usuario_Sexo_idSexo, Cliente_usuario_Endereco_idEndereco, Cliente_usuario_Endereco_Bairro_idBairro, Cliente_usuario_Funcionario_idFuncionario, Cliente_usuario_Funcionario_Sexo_idSexo) VALUES 
('2025-02-20 16:45:00', 2, 2, 2, 2, 2, 7, 7, 1, 1),
('2025-05-05 09:30:00', 5, 2, 5, 2, 1, 3, 3, 1, 1);

