-- Descomente e altere as linhas abaixo:

CREATE TABLE SpotifyClone.cancao_favorita(
	  usuario_id INT NOT NULL,
    cancao_id INT NOT NULL,
    
    PRIMARY KEY (usuario_id, cancao_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario (usuario_id),
    FOREIGN KEY (cancao_id) REFERENCES cancoes (cancao_id)
);

INSERT INTO SpotifyClone.cancao_favorita (usuario_id, cancao_id)
VALUES
(1, 3),
(1, 6),
(1, 10),
(2, 4),
(3, 1),
(3, 3),
(4, 7),
(4, 4),
(5, 10),
(5, 2),
(8, 4),
(9, 7),
(10, 3);