DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos (
    plano_id	INT PRIMARY KEY AUTO_INCREMENT,
    plano_nome	VARCHAR(45) NOT NULL,
    plano_valor	DECIMAL(3,2) NOT NULL
);

INSERT INTO planos (plano_nome, plano_valor)
VALUES
  ('gratuito', 0),
  ('universitario', 5.99),
  ('pessoal', 6.99),
  ('familiar', 7.99);

CREATE TABLE usuario(
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_nome VARCHAR(45),
    usuario_idade INT,
    data_assinatura DATE NOT NULL,
    plano_id INT,

    FOREIGN KEY (plano_id) REFERENCES planos (plano_id)
);

INSERT INTO usuario (usuario_nome, usuario_idade, plano_id, data_assinatura)
VALUES
('Barbara Liskov', 82, 1, '2019-10-20'),
('Robert Cecil Martin', 58, 1, '2017-01-06'),
('Ada Lovelace', 37, 4, '2017-12-30'),
('Martin Fowler', 46, 4, '2017-01-17'),
('Sandi Metz', 58, 4, '2018-04-29'),
('Paulo Freire', 19, 2, '2018-02-14'),
('Bell Hooks', 26, 2, '2018-01-05'),
('Christopher Alexander', 85, 3, '2019-06-05'),
('Judith Butler', 45, 3, '2020-05-13'),
('Jorge Amado', 58, 3, '2017-02-17');

CREATE TABLE artista (
  artista_id INT PRIMARY KEY AUTO_INCREMENT,
  artista_nome VARCHAR(45) NOT NULL
);

INSERT INTO artista (artista_nome)
VALUES
('Beyoncé'),
('Queen'),
('Elis Regina'),
('Baco Exu do Blues'),
('Blind Guardian'),
('Nina Simone');

CREATE TABLE album (
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  album_nome VARCHAR(45) NOT NULL,
  album_ano_lancamento YEAR NOT NULL,
  artista_id INT,
  FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
);

INSERT INTO album (artista_id, album_nome, album_ano_lancamento)
VALUES 
(1, 'Renaissance', 2002),
(2, 'Jazz', 1978),
(2, 'Hot Space', 1982),
(3, 'Falso Brilhante', 1998),
(3, 'Vento de Maio', 2001),
(4, 'QVVJFA?', 2003),
(5, 'Somewhere Far Beyond', 2007),
(6, 'I Put A Spell On You', 2012);

CREATE TABLE cancoes (
  cancao_id INT PRIMARY KEY AUTO_INCREMENT,
  cancao_nome VARCHAR(45) NOT NULL,
  cancao_duracao INT NOT NULL,
  album_id INT,
  FOREIGN KEY (album_id) REFERENCES album (album_id)
);

INSERT INTO cancoes (cancao_nome, cancao_duracao, album_id)
VALUES
('BREAK MY SOUL', 279, 1),
("VIRGO'S GROOVE", 369, 1),
('ALIEN SUPERSTAR', 116, 1),
("DON'T STOP ME NOW", 203, 2),
('UNDER PRESSURE', 152, 3),
('COMO NOSSOS PAIS', 105, 4),
('O MEDO DE AMAR É O MEDO DE SER LIVRE', 207, 5),
('SAMBA EM PARIS', 267, 6),
("THE BARD'S SONG", 244, 7),
('FEELING GOOD', 100, 8);

CREATE TABLE usuario_artista (
  usuario_id INT,
  artista_id INT,

  PRIMARY KEY (usuario_id, artista_id),
  FOREIGN KEY (usuario_id) REFERENCES usuario (usuario_id),
  FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
);

INSERT INTO usuario_artista(usuario_id, artista_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(4, 4),
(5, 5),
(5, 6),
(6, 1),
(6, 6),
(7, 6),
(9, 3),
(10, 2);

CREATE TABLE historico (
  usuario_id INT,
  cancao_id INT,
  historico_data DATETIME NOT NULL,
  PRIMARY KEY (usuario_id, cancao_id),
  FOREIGN KEY (usuario_id) REFERENCES usuario (usuario_id),
  FOREIGN KEY (cancao_id) REFERENCES cancoes (cancao_id)
);

INSERT INTO historico (usuario_id, cancao_id, historico_data)
VALUES
(1, 8, '2022-02-28 10:45:55'),
(1, 2, '2020-05-02 05:30:55'),
(1, 10, '2020-03-06 11:22:33'),
(2, 7, '2020-01-02 07:40:33'),
(2, 10, '2022-08-05 08:05:17'),
(3, 2, '2020-12-05 18:38:30'),
(3, 10, '2020-11-13 16:55:13'),
(4, 8, '2021-08-15 17:10:10'),
(5, 5, '2020-08-06 15:23:43'),
(5, 8, '2022-01-09 01:44:33'),
(6, 1, '2017-10-12 12:35:20'),
(6, 7, '2017-01-24 00:31:17'),
(7, 4, '2011-12-15 22:30:49'),
(8, 4, '2012-03-17 14:56:41'),
(9, 9, '2022-02-24 21:14:22'),
(10, 3, '2015-12-13 08:30:22');