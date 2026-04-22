INSERT INTO Pessoa (id_pessoa, nome, email, rua, numero, cidade, cep) VALUES
(1, 'Ana Souza', 'ana.souza@email.com', 'Rua das Flores', '120', 'Sao Paulo', '01001000'),
(2, 'Bruno Lima', 'bruno.lima@email.com', 'Avenida Central', '45', 'Sao Bernardo', '09600000'),
(3, 'Carla Mendes', 'carla.mendes@email.com', 'Rua Verde', '300', 'Santo Andre', '09000000'),
(4, 'Diego Martins', 'diego.martins@email.com', 'Rua Azul', '89', 'Sao Caetano', '09500000'),
(5, 'Eduarda Alves', 'eduarda.alves@email.com', 'Rua da Praia', '510', 'Santos', '11000000'),
(6, 'Felipe Costa', 'felipe.costa@email.com', 'Avenida Brasil', '700', 'Campinas', '13000000'),
(7, 'Aurora Silva', 'contato@aurora.com', 'Rua do Estudio', '77', 'Sao Paulo', '01111000'),
(8, 'Banda Horizonte', 'contato@horizonte.com', 'Avenida Musical', '500', 'Rio de Janeiro', '20000000');

INSERT INTO Telefone (id_pessoa, telefone) VALUES
(1, '11987654321'),
(1, '11976543210'),
(2, '11991234567'),
(3, '11999887766'),
(4, '11995554433'),
(5, '13998887766'),
(6, '19997776655'),
(7, '11990001111'),
(8, '21990002222');

INSERT INTO Cliente (id_pessoa, cpf, data_cadastro) VALUES
(1, '12345678901', '2026-01-10'),
(2, '23456789012', '2026-01-12'),
(3, '34567890123', '2026-01-15'),
(4, '45678901234', '2026-01-20'),
(5, '56789012345', '2026-01-25');

INSERT INTO Artista (id_pessoa, nome_artistico, estilo_musical_1, estilo_musical_2) VALUES
(6, 'Felipe Costa DJ', 'Eletronica', 'Funk');

INSERT INTO Artista (id_pessoa, nome_artistico, estilo_musical_1) VALUES
(7, 'MC Aurora', 'Trap'),
(8, 'Banda Horizonte', 'Pop Rock');

INSERT INTO Evento (id_evento, nome, data, local, capacidade_total) VALUES
(101, 'Festival Luz da Noite', '2026-06-15', 'Arena Sao Paulo', 20000),
(102, 'Rodeio Music Fest', '2026-07-20', 'Parque de Eventos ABC', 15000),
(103, 'Vibra Summer Show', '2026-08-10', 'Espaco Litoral', 12000);

INSERT INTO Setor (id_setor, nome_setor, capacidade, preco_base, id_evento) VALUES
(201, 'Pista', 8000, 120.00, 101),
(202, 'VIP', 3000, 250.00, 101),
(203, 'Camarote', 1500, 400.00, 101),
(204, 'Pista', 7000, 100.00, 102),
(205, 'VIP', 2500, 220.00, 102),
(206, 'Pista Premium', 2000, 300.00, 103);

INSERT INTO Apresentacao (id_apresentacao, horario_inicio, duracao, palco, id_evento) VALUES
(301, '20:00', 90, 'Palco Principal', 101),
(302, '22:00', 80, 'Palco Principal', 101),
(303, '21:00', 100, 'Palco Arena', 102),
(304, '23:00', 70, 'Palco Arena', 102),
(305, '19:30', 95, 'Palco Praia', 103);

INSERT INTO Compra (id_compra, data_compra, valor_compra, canal_vendas, id_pessoa) VALUES
(401, '2026-05-20', 240.00, 'Online', 1),
(402, '2026-05-22', 500.00, 'App', 2),
(403, '2026-06-01', 400.00, 'Bilheteria', 3),
(404, '2026-06-10', 220.00, 'Online', 4),
(405, '2026-06-15', 600.00, 'App', 5),
(406, '2026-07-01', 300.00, 'Online', 1);

INSERT INTO Pagamento (id_pagamento, metodo, status, data_pagamento, valor_pago, id_compra) VALUES
(501, 'Pix', 'Aprovado', '2026-05-20', 240.00, 401),
(502, 'Cartao', 'Aprovado', '2026-05-22', 500.00, 402),
(503, 'Dinheiro', 'Aprovado', '2026-06-01', 400.00, 403),
(504, 'Pix', 'Aprovado', '2026-06-10', 220.00, 404),
(505, 'Cartao', 'Aprovado', '2026-06-15', 600.00, 405),
(506, 'Pix', 'Aprovado', '2026-07-01', 300.00, 406);

INSERT INTO Ingresso (id_ingresso, tipo, valor_final, status, id_setor, id_compra) VALUES
(601, 'Inteira', 120.00, 'Valido', 201, 401),
(602, 'Meia', 120.00, 'Valido', 201, 401),
(603, 'VIP', 250.00, 'Valido', 202, 402),
(604, 'VIP', 250.00, 'Valido', 202, 402),
(605, 'Inteira', 400.00, 'Valido', 203, 403),
(606, 'Inteira', 100.00, 'Valido', 204, 404),
(607, 'VIP', 220.00, 'Valido', 205, 405),
(608, 'VIP', 220.00, 'Valido', 205, 405),
(609, 'Inteira', 300.00, 'Valido', 206, 406),
(610, 'Meia', 0.00, 'Cancelado', 206, 406);

INSERT INTO Participa (id_pessoa, id_evento, data_presenca, avaliacao) VALUES
(1, 101, '2026-06-15', 5),
(2, 101, '2026-06-15', 4),
(3, 101, '2026-06-15', 5),
(4, 102, '2026-07-20', 4),
(5, 102, '2026-07-20', 5),
(1, 103, '2026-08-10', 4);

INSERT INTO Apresenta (id_pessoa, id_apresentacao) VALUES
(6, 301),
(7, 302),
(8, 303),
(7, 304),
(6, 305);