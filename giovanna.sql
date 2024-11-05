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
inicio_reserva DATE NOT NULL DEFAULT CURRENT_DATE,
final_reserva DATE NOT NULL DEFAULT CURRENT_DATE,
id_hospede INT NOT NULL,
id_quarto INT NOT NULL,
CONSTRAINT fk_hospede FOREIGN KEY (id_hospede) REFERENCES hospedes (id_hospede),
CONSTRAINT fk_quarto FOREIGN KEY (id_quarto) REFERENCES quartos (id_quarto)
);