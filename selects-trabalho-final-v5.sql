-- 1) Mostra todos os imóveis cadastrados com o nome do proprietário e sua profissão, ordenados pelo valor de venda 
SELECT 
    i.idImovel, 
    i.valor_sugerido_venda,
    cp.nome AS proprietario,
    p.descricao AS profissao
FROM 
    Imovel i
JOIN 
    Cliente_proprietario cp ON i.Cliente_proprietario_idCliente_proprietario = cp.idCliente_proprietario
JOIN 
    Profissao p ON cp.Proficao_idProficao = p.idProfissao
ORDER BY 
    i.valor_sugerido_venda DESC;

-- 2) Lista todas as casas que possuem armário embutido,
-- mostrando quantos quartos e suítes têm, área em m², e em qual bairro/cidade estão localizadas.
SELECT 
    c.idCasa,
    c.qtd_quartos,
    c.qtd_suites,
    c.area_m2,
    b.nome AS bairro,
    ci.nome AS cidade
FROM 
    Casa c
JOIN 
    Imovel i ON c.Imovel_idImovel = i.idImovel
JOIN 
    Endereco e ON i.Endereco_idEndereco = e.idEndereco
JOIN 
    Bairro b ON e.Bairro_idBairro = b.idBairro
JOIN 
    Cidade ci ON b.Cidade_idCidade = ci.idCidade
WHERE 
    c.armario_embutido = 1;
    
-- 3) Exibe apartamentos que oferecem portaria 24 horas,
-- mostrando andar, valor do condomínio, valor de locação e em qual bairro se encontram.

SELECT 
    a.idApartamento,
    a.andar,
    a.valor_codominio,
    i.valor_sugerido_locacao,
    b.nome AS bairro
FROM 
    Apartamento a
JOIN 
    Imovel i ON a.Imovel_idImovel = i.idImovel
JOIN 
    Endereco e ON i.Endereco_idEndereco = e.idEndereco
JOIN 
    Bairro b ON e.Bairro_idBairro = b.idBairro
WHERE 
    a.portaria24hrs = 1
ORDER BY 
    i.valor_sugerido_locacao;
    
-- 4) Apresenta todas as manutenções feitas,
-- identificando em qual imóvel foram realizadas, quem é o proprietário e qual o status atual do imóvel.
SELECT 
    m.descricao AS manutencao,
    i.idImovel,
    cp.nome AS proprietario,
    s.descricao AS status
FROM 
    Manutencao m
JOIN 
    Imovel i ON m.Imovel_idImovel = i.idImovel
JOIN 
    Cliente_proprietario cp ON i.Cliente_proprietario_idCliente_proprietario = cp.idCliente_proprietario
JOIN 
    Status s ON i.Status_idStatus = s.idStatus;
    
-- 5) Mostra informações pessoais dos clientes que alugam/imóveis, 
-- incluindo seu estado civil, sexo e endereço completo
SELECT 
    cu.nome AS cliente,
    ec.descricao AS estado_civil,
    s.descricao AS sexo,
    e.logradouro AS endereco
FROM 
    Cliente_usuario cu
JOIN 
    Estado_civil ec ON cu.Estado_civil_idEstado_civil = ec.idEstado_civil
JOIN 
    Sexo s ON cu.Sexo_idSexo = s.idSexo
JOIN 
    Endereco e ON cu.Endereco_idEndereco = e.idEndereco;
    
-- 6) Lista todos os terrenos cadastrados com seu tamanho em m²,
-- tipo de terreno (residencial, comercial etc.) e localização por bairro.
SELECT 
    t.idTerreno,
    t.area_m2,
    tt.descricao AS tipo_terreno,
    b.nome AS bairro
FROM 
    Terreno t
JOIN 
    Tipo_terreno tt ON t.Tipo_terreno_idTipo_terreno = tt.idTipo_terreno
JOIN 
    Imovel i ON t.Imovel_idImovel = i.idImovel
JOIN 
    Endereco e ON i.Endereco_idEndereco = e.idEndereco
JOIN 
    Bairro b ON e.Bairro_idBairro = b.idBairro
ORDER BY 
    t.area_m2 DESC;
    
-- 7) Exibe todos os contratos registrados, mostrando quem é o proprietário do imóvel,
--  quem é o cliente locatário e a data do contrato.
SELECT 
    ct.numero AS contrato,
    cp.nome AS proprietario,
    cu.nome AS cliente,
    ct.data_contrato
FROM 
    Contrato ct
JOIN 
    Cliente_proprietario cp ON ct.Cliente_proprietario_idCliente_proprietario = cp.idCliente_proprietario
JOIN 
    Cliente_usuario cu ON ct.Cliente_usuario_idCliente_usuario = cu.idCliente_usuario
ORDER BY 
    ct.data_contrato DESC;
    
-- 8) Apresenta salas comerciais disponíveis que possuem pelo menos 1 banheiro, 
-- mostrando quantidade de cômodos, área e valor de locação
SELECT 
    sc.idSalaComercial,
    sc.qtd_comodos,
    sc.area_m2,
    i.valor_sugerido_locacao,
    b.nome AS bairro
FROM 
    SalaComercial sc
JOIN 
    Imovel i ON sc.Imovel_idImovel = i.idImovel
JOIN 
    Endereco e ON i.Endereco_idEndereco = e.idEndereco
JOIN 
    Bairro b ON e.Bairro_idBairro = b.idBairro
WHERE 
    sc.qtd_banheiros >= 1;
    
-- 9)  consulta que retorna os Funcionários com cargos e salários
SELECT 
    f.nome AS funcionario,
    cg.descricao AS cargo,
    cg.salario_base,
    s.descricao AS sexo
FROM 
    Funcionario f
JOIN 
    Cargo_has_Funcionario chf ON f.idFuncionario = chf.Funcionario_idFuncionario
JOIN 
    Cargo cg ON chf.Cargo_idCargo = cg.idCargo
JOIN 
    Sexo s ON f.Sexo_idSexo = s.idSexo;
    
-- 10) Lista todas as visitas marcadas por clientes, 
-- mostrando qual cliente agendou e para qual endereço foi marcada a visita
SELECT 
    v.idVisita,
    v.descricao,
    cu.nome AS cliente,
    e.logradouro AS endereco_visita
FROM 
    Visita v
JOIN 
    Cliente_usuario cu ON v.idVisita = cu.Visita_idVisita
JOIN 
    Endereco e ON cu.Endereco_idEndereco = e.idEndereco
ORDER BY 
    v.idVisita;