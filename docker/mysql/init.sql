SET NAMES utf8mb4;

CREATE DATABASE IF NOT EXISTS `catalogo_gastronomico` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `catalogo_gastronomico`;

CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(200) NOT NULL,
    imagem VARCHAR(255) NOT NULL DEFAULT 'logo-junior.png',
    preco DECIMAL(10,2) NOT NULL
);

-- Inserindo os Salgados
INSERT INTO `produtos` (`tipo`, `nome`, `descricao`, `imagem`, `preco`) VALUES 
('Salgado', 'Filet Mignon com Bacon', 'Medalhões suculentos envoltos em bacon, acompanhados de batatas rústicas douradas.', 'file_mignon.jpg', 65.90),
('Salgado', 'Salmão ao Maracujá', 'Filé de salmão grelhado regado com molho agridoce de maracujá fresco e ervas.', 'salmao.jpg', 72.50),
('Salgado', 'Escondidinho de Carne', 'Clássico purê de mandioca cremoso com recheio generoso de carne seca desfiada.', 'escondidinho-de-carne.jpg', 48.00),
('Salgado', 'Rondelli ao Molho Branco', 'Massa artesanal recheada com presunto e queijo sob um aveludado molho bechamel.', 'rondelli.jpeg', 42.90);

-- Inserindo os Doces
INSERT INTO `produtos` (`tipo`, `nome`, `descricao`, `imagem`, `preco`) VALUES 
('Doce', 'Cheesecake de Frutas Vermelhas', 'Creme de queijo leve sobre base crocante, finalizado com calda artesanal de morango e amora.', 'creanchese.jpg', 22.00),
('Doce', 'Banoffee Especial', 'Camadas de doce de leite, banana e chantilly polvilhado com cacau fino.', 'banoffe.jpg', 18.50),
('Doce', 'Torta de Limão Siciliano', 'Recheio cítrico cremoso com cobertura de merengue suíço maçaricado.', 'torta-de-limao.jpg', 16.90),
('Doce', 'Bolo de Chocolate Supreme', 'Bolo denso de chocolate belga decorado com morangos frescos e cerejas.', 'bolo-chocolate.jpg', 25.00);
