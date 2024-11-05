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
('Marcelo', 'padrinho@gmail.com');

INSERT INTO quartos (numero_quarto, quartos_disponiveis)
VALUES
(07, TRUE),
(987, FALSE),
(1001, FALSE),
(15, TRUE),
(647, FALSE);

INSERT INTO  reservas (id_hospede, id_quarto, inicio_reserva, final_reserva)
VALUES
(1, 4, '05/11/2024', '07/11/2024'),
(3, 1, '11/05/2025', '25/05/2025'),
(2, 3, '07/03/2025', '20/03/2025');
