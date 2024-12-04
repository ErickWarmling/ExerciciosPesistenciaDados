CREATE TABLE carros (
	carro_id SERIAL PRIMARY KEY,
	conteudo XML
);

INSERT INTO carros (conteudo) VALUES 
('<carro><marca>Volkswagen</marca><modelo>T-Cross</modelo><ano>2023</ano><cor>Azul Norway</cor><placa>XFY-6821</placa></carro>'),
('<carro><marca>Chevrolet</marca><modelo>Montana</modelo><ano>2019</ano><cor>Vermelho</cor><placa>MKJ-4235</placa></carro>'),
('<carro><marca>Volkswagen</marca><modelo>Fox</modelo><ano>2020</ano><cor>Branco</cor><placa>LFT-1034</placa></carro>'),
('<carro><marca>Fiat</marca><modelo>Fiat Toro</modelo><ano>2022</ano><cor>Preto</cor><placa>BHS-1927</placa></carro>'),
('<carro><marca>Ford</marca><modelo>Fusion</modelo><ano>2017</ano><cor>Cinza</cor><placa>NGB-5029</placa></carro>'),
('<carro><marca>Volkswagwen</marca><modelo>Nivus</modelo><ano>2024</ano><cor>Cinza Platinum</cor><placa>QID-7412</placa></carro>');

SELECT xpath('/carro/modelo/text()', conteudo) AS marcas
FROM carros;

SELECT carro_id, conteudo 
FROM carros
WHERE xpath_exists('/carro[modelo="Montana"]', conteudo);

SELECT COUNT(*)
FROM carros
WHERE xpath_exists('/carro[marca="Volkswagen"]', conteudo);

SELECT 
xpath('/carro/modelo/text()', conteudo) AS modelo,
xpath('/carro/marca/text()', conteudo) AS marca,
xpath('/carro/ano/text()', conteudo) AS ano
FROM carros;

SELECT carro_id, conteudo
FROM carros
WHERE xpath_exists('/carro[cor="Branco" or cor="Cinza"]', conteudo);

SELECT carro_id, conteudo
FROM carros
WHERE xpath_exists('/carro[placa="NGB-5029"]', conteudo);


