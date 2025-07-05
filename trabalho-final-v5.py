import mysql.connector

# aqui eu to Conectando ao banco de dados
conexao = mysql.connector.connect(
    host='localhost',
    user='root',
    password='unifesspa',
    database='trabalho'
)

cursor = conexao.cursor()

# aqui eu to adicionando os selects
consultas = [
    # 1. Imóveis com proprietários e profissões (ordenados por valor)
    """
    SELECT i.idImovel, i.valor_sugerido_venda, cp.nome AS proprietario, p.descricao AS profissao
    FROM Imovel i
    JOIN Cliente_proprietario cp ON i.Cliente_proprietario_idCliente_proprietario = cp.idCliente_proprietario
    JOIN Profissao p ON cp.Proficao_idProficao = p.idProfissao
    ORDER BY i.valor_sugerido_venda DESC;
    """,

    # 2. Casas com armário embutido e localização
    """
    SELECT c.idCasa, c.qtd_quartos, c.qtd_suites, c.area_m2, b.nome AS bairro, ci.nome AS cidade
    FROM Casa c
    JOIN Imovel i ON c.Imovel_idImovel = i.idImovel
    JOIN Endereco e ON i.Endereco_idEndereco = e.idEndereco
    JOIN Bairro b ON e.Bairro_idBairro = b.idBairro
    JOIN Cidade ci ON b.Cidade_idCidade = ci.idCidade
    WHERE c.armario_embutido = 1;
    """,

    # 3. Apartamentos com portaria 24h (ordenados por valor locação)
    """
    SELECT a.idApartamento, a.andar, a.valor_codominio, i.valor_sugerido_locacao, b.nome AS bairro
    FROM Apartamento a
    JOIN Imovel i ON a.Imovel_idImovel = i.idImovel
    JOIN Endereco e ON i.Endereco_idEndereco = e.idEndereco
    JOIN Bairro b ON e.Bairro_idBairro = b.idBairro
    WHERE a.portaria24hrs = 1
    ORDER BY i.valor_sugerido_locacao;
    """,

    # 4. Histórico de manutenções com status
    """
    SELECT m.descricao AS manutencao, i.idImovel, cp.nome AS proprietario, s.descricao AS status
    FROM Manutencao m
    JOIN Imovel i ON m.Imovel_idImovel = i.idImovel
    JOIN Cliente_proprietario cp ON i.Cliente_proprietario_idCliente_proprietario = cp.idCliente_proprietario
    JOIN Status s ON i.Status_idStatus = s.idStatus;
    """,

    # 5. Clientes usuários com dados cadastrais
    """
    SELECT cu.nome AS cliente, ec.descricao AS estado_civil, s.descricao AS sexo, e.logradouro AS endereco
    FROM Cliente_usuario cu
    JOIN Estado_civil ec ON cu.Estado_civil_idEstado_civil = ec.idEstado_civil
    JOIN Sexo s ON cu.Sexo_idSexo = s.idSexo
    JOIN Endereco e ON cu.Endereco_idEndereco = e.idEndereco;
    """,

    # 6. Terrenos ordenados por tamanho
    """
    SELECT t.idTerreno, t.area_m2, tt.descricao AS tipo_terreno, b.nome AS bairro
    FROM Terreno t
    JOIN Tipo_terreno tt ON t.Tipo_terreno_idTipo_terreno = tt.idTipo_terreno
    JOIN Imovel i ON t.Imovel_idImovel = i.idImovel
    JOIN Endereco e ON i.Endereco_idEndereco = e.idEndereco
    JOIN Bairro b ON e.Bairro_idBairro = b.idBairro
    ORDER BY t.area_m2 DESC;
    """,

    # 7. Contratos com datas e partes envolvidas
    """
    SELECT ct.numero AS contrato, cp.nome AS proprietario, cu.nome AS cliente, ct.data_contrato
    FROM Contrato ct
    JOIN Cliente_proprietario cp ON ct.Cliente_proprietario_idCliente_proprietario = cp.idCliente_proprietario
    JOIN Cliente_usuario cu ON ct.Cliente_usuario_idCliente_usuario = cu.idCliente_usuario
    ORDER BY ct.data_contrato DESC;
    """,

    # 8. Salas comerciais com banheiro
    """
    SELECT sc.idSalaComercial, sc.qtd_comodos, sc.area_m2, i.valor_sugerido_locacao, b.nome AS bairro
    FROM SalaComercial sc
    JOIN Imovel i ON sc.Imovel_idImovel = i.idImovel
    JOIN Endereco e ON i.Endereco_idEndereco = e.idEndereco
    JOIN Bairro b ON e.Bairro_idBairro = b.idBairro
    WHERE sc.qtd_banheiros >= 1;
    """,

    # 9. Funcionários com cargos e salários
    """
    SELECT f.nome AS funcionario, cg.descricao AS cargo, cg.salario_base, s.descricao AS sexo
    FROM Funcionario f
    JOIN Cargo_has_Funcionario chf ON f.idFuncionario = chf.Funcionario_idFuncionario
    JOIN Cargo cg ON chf.Cargo_idCargo = cg.idCargo
    JOIN Sexo s ON f.Sexo_idSexo = s.idSexo;
    """,

    # 10. Visitas agendadas com clientes
    """
    SELECT v.idVisita, v.descricao, cu.nome AS cliente, e.logradouro AS endereco_visita
    FROM Visita v
    JOIN Cliente_usuario cu ON v.idVisita = cu.Visita_idVisita
    JOIN Endereco e ON cu.Endereco_idEndereco = e.idEndereco
    ORDER BY v.idVisita;
    """
]

# Executa cada SELECT
for i, consulta in enumerate(consultas, start=1):
    print(f"\n--- Resultado da Consulta {i} ---")
    cursor.execute(consulta)
    resultados = cursor.fetchall()

    # Imprime os resultados de forma simples
    for linha in resultados:
        print(linha)

# Finalizar conexão
cursor.close()
conexao.close()
