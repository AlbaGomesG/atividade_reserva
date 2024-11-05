CREATE DATABASE reservaquartos;
\c reservaquartos; 

CREATE TABLE hospedes (
id_hospede SERIAL PRIMARY KEY,
nome VARCHAR (100) NOT NULL,
email VARCHAR (200) UNIQUE NOT NULL
);

CREATE TABLE quartos (
id_quarto SERIAL PRIMARY KEY,
numero_quarto INT,
quartos_disponiveis BOOLEAN
);

CREATE TABLE reservas (
id_reserva SERIAL PRIMARY KEY,
inicio_reserva DATE NOT NULL,
final_reserva DATE NOT NULL,
id_hospede INT NOT NULL,
id_quarto INT NOT NULL,
CONSTRAINT fk_hospede FOREIGN KEY (id_hospede) REFERENCES hospedes (id_hospede),
CONSTRAINT fk_quarto FOREIGN KEY (id_quarto) REFERENCES quartos (id_quarto)
);

INSERT INTO hospedes (nome, email)
VALUES
('Giovanna Alba', 'giovanna@gmail.com'),
('Maria Parma', 'maria@gmail.com'),
('Marcelo', 'padrinho@gmail.com'),
('Shawn Mendes', 'mendes@gmail.com'),
('Camila Cabello', 'camila@gmail.com');

INSERT INTO quartos (numero_quarto, quartos_disponiveis)
VALUES
(07, FALSE),
(987, TRUE),
(1001, TRUE),
(15, FALSE),
(647, TRUE);

INSERT INTO  reservas (id_hospede, id_quarto, inicio_reserva, final_reserva)
VALUES
(1, 1, '05/11/2024', '07/11/2024'),
(3, 4, '30/10/2024', '06/11/2024'),
(2, 3, '07/03/2025', '20/03/2025'),
(4, 2, '15/12/2024', '25/12/2024'),
(5, 5, '07/02/2025', '09/02/2025');

\\Selecionar todos os hóspedes

SELECT
r.id_reserva,
h.nome AS hospede,
h.email,
q.numero_quarto AS quarto,
q.quartos_disponiveis,
r.inicio_reserva,
r.final_reserva

FROM
reservas r
JOIN
hospedes h ON r.id_hospede = h.id_hospede
JOIN
quartos q ON r.id_quarto = q.id_quarto;

\\Selecionar somente os quartos que ainda não foram ocupados

SELECT * FROM quartos WHERE quartos_disponiveis = TRUE;