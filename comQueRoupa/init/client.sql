--- primeira versão do banco de dados para aplicação web que gerencia peças de roupas de um guarda-roupa hipotético
--- autor: Daiane Marcon
--- 


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


--
-- Estrutura para tabela `CLOTHES`
--

CREATE TABLE `CLOTHES` (
  `id` int,
  `tipo` varchar(255) NOT NULL,
  `salto` boolean,
  `cor` varchar(255) NOT NULL,
  `imagem` varchar(355) NOT NULL,
  `clima` varchar(255),
  `lavar` boolean DEFAULT 0,
  `manutencao` boolean DEFAULT 0,
  `disponivel` boolean DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Inicializando a tabela com algumas entradas para facilitar o teste da aplicação
--

INSERT INTO
`CLOTHES` (`id`, `tipo`, `salto`, `cor`, `imagem`, `clima`, `lavar`, `manutencao`, `disponivel`)
VALUES
(1, 'vestido', NULL, 'rosa', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F3d%2F49%2F3d49ac2625b7ee9ea8e9f27c94ed13340f114c49.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]', 'inverno', 0, 0, 1),
(2, 'vestido', NULL, 'branco', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F17%2F7b%2F177b8b3cf5194c27322a4be52ad0e4f9a4ea9a0f.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]', 'verao', 0, 0, 1),
(3, 'vestido', NULL, 'preto', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F87%2F23%2F87233eb6033fd1b9f8a73717a23e508a6c7b6ed3.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]', 'meiaEstacao', 0, 0, 1),
(4, 'vestido', NULL, 'marrom', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F3f%2F98%2F3f98b21fa1e42a47dd170c28bd881208958d2f02.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]', 'verao', 0, 0, 1),
(5, 'vestido', NULL, 'rosa', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F21%2F34%2F213459c796b995525d8b1854a8ce683176cc8fbe.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]', 'inverno', 0, 0, 1),
(6, 'vestido', NULL, 'azul', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fc0%2F43%2Fc0432c47b72aa06e18b3b5a0b9cd7ab64e417ede.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]', 'verao', 0, 0, 1);


INSERT INTO
`CLOTHES` (`id`, `tipo`, `salto`, `cor`, `imagem`, `clima`, `lavar`, `manutencao`, `disponivel`)
VALUES
(7, 'saia', NULL, 'azul', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F6d%2F7d%2F6d7db9f4f8e24046e3441aa7765dcd2b336e7823.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5BLadies_skirts_denim%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]', 'verao', 0, 0, 1),
(8, 'saia', NULL, 'preto', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fd9%2F3e%2Fd93e2e8454f4eb5f6b09eca28e71d2dba22fd1f6.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5BLadies_skirts_denim%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]', 'meiaEstacao', 0, 0, 1),
(9, 'saia', NULL, 'rosa', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fc6%2F16%2Fc6167a91dc8c74d6bdcf2b8a3c1d8381a13a0a4a.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5BLadies_skirts_denim%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]', 'inverno', 0, 0, 1),
(10, 'saia', NULL, 'azul', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fcb%2F40%2Fcb408edd1425caa3948c154bc3508383ff8777af.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5BLadies_skirts_denim%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]', 'verao', 0, 0, 1),
(11, 'saia', NULL, 'preto', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F64%2F93%2F64935b1fb04dc14c411bff177212a18af1407e69.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5BLadies_skirts_denim%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]', 'verao', 0, 0, 1),
(12, 'saia', NULL, 'preto', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fe3%2Fca%2Fe3ca772a6234f5ed0fb7a3b2a41fd1207ea8cf16.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5BLadies_skirts_denim%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]', 'inverno', 0, 0, 1);



INSERT INTO
`CLOTHES` (`id`, `tipo`, `salto`, `cor`, `imagem`, `clima`, `lavar`, `manutencao`, `disponivel`)
VALUES
(13, 'short', NULL, 'preto', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F30%2Fa5%2F30a5adc742f26e6cc9489151cbe968f5d8c0bdd6.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_shorts_jeans%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]', 'verao', 0, 0, 1),
(14, 'short', NULL, 'branco', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F18%2F8d%2F188dd6d525587d8712422cbbe29a26d108d8f937.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_shorts_jeans%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]', 'verao', 0, 0, 1),
(15, 'short', NULL, 'preto', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F01%2Fe6%2F01e628fbadc27208ceea101238cd2ad5d9294518.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_shorts_jeans%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]', 'verao', 0, 0, 1),
(16, 'short', NULL, 'azul', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fea%2F1f%2Fea1f5c2d691e6ecd698dbae0cc2d184aa12ff278.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_shorts_jeans%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]', 'verao', 0, 0, 1);


INSERT INTO
`CLOTHES` (`id`, `tipo`, `salto`, `cor`, `imagem`, `clima`, `lavar`, `manutencao`, `disponivel`)
VALUES
(17, 'calca', NULL, 'azul', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fcf%2Fc0%2Fcfc04ea2b893dcc5e82f36973dbb6c6928132bf2.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_jeans_straight%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/fullscreen]', 'meiaEstacao', 0, 0, 1),
(18, 'calca', NULL, 'preto', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F01%2Fa2%2F01a2d5b84a65b336a3a5275d6190c95403cb0bfd.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_jeans_straight%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/fullscreen]', 'meiaEstacao', 0, 0, 1),
(19, 'calca', NULL, 'preto', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fea%2F78%2Fea78389b0c736f8427e559e000cb4a95733562e2.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_jeans_straight%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/fullscreen]', 'meiaEstacao', 0, 0, 1),
(20, 'calca', NULL, 'preto', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F05%2Fdc%2F05dc48410fafc078837e57bb61f8b602369fd1f9.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_jeans_straight%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/fullscreen]', 'inverno', 0, 0, 1),
(21, 'calca', NULL, 'preto', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fe6%2Fd0%2Fe6d026c9ab0d5ff15652580c79ecb33d487bc06c.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_jeans_straight%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/fullscreen]', 'meiaEstacao', 0, 0, 1),
(22, 'calca', NULL, 'preto', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F47%2F53%2F47534561e7abf40578890565b0014c032d12d3e4.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_jeans_straight%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/fullscreen]', 'verao', 0, 0, 1),
(23, 'calca', NULL, 'verde', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F6b%2F3f%2F6b3f5f51e4db457eaa3740ebade9321d85fd732f.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_jeans_straight%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/fullscreen]', 'meiaEstacao', 0, 0, 1);


INSERT INTO
`CLOTHES` (`id`, `tipo`, `salto`, `cor`, `imagem`, `clima`, `lavar`, `manutencao`, `disponivel`)
VALUES
(24, 'camiseta', NULL, 'preto', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F49%2Fc8%2F49c81ad21d21ba329db75924c0af11170b61f43d.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]', 'verao', 0, 0, 1),
(25, 'camiseta', NULL, 'branco', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F22%2Fd4%2F22d4ecddb7feca9b96c03ab2c0a3c82ab9851391.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]', 'verao', 0, 0, 1),
(26, 'camiseta', NULL, 'cinza', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F9a%2Fba%2F9aba0632a65d87ecf7d20b738813cc6672d00171.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]', 'verao', 1, 0, 0),
(27, 'camiseta', NULL, 'preto', 'https://lp2.hm.com/hmgoepprod?set=source[/3d/a3/3da3daacf0b7f10881a3f07782f8ab004c57374d.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[y],hmver[2]&call=url[file:/product/main]', 'verao', 0, 0, 1),
(28, 'camiseta', NULL, 'cinza', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fe8%2F18%2Fe8188794af8288835a780378c7e69b6ac5772e0c.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/fullscreen]', 'verao', 0, 0, 1),
(29, 'camiseta', NULL, 'preto', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fa9%2Fe3%2Fa9e355ac4418b3e94745e487acb4e40b918f82ca.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/fullscreen]', 'verao', 0, 0, 1);

INSERT INTO
`CLOTHES` (`id`, `tipo`, `salto`, `cor`, `imagem`, `clima`, `lavar`, `manutencao`, `disponivel`)
VALUES
(30, 'blusa', NULL, 'marrom', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F0b%2Fbb%2F0bbbf06257dd763f09f5ec93bdb03b7f4ab0b2f9.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]', 'meiaEstacao', 1, 0, 0),
(31, 'blusa', NULL, 'branco', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F49%2F13%2F491350276ee2da84ba492c08a721d96311adcf6c.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]', 'meiaEstacao', 0, 0, 1),
(32, 'blusa', NULL, 'preto', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F23%2F81%2F2381c112a97ec0b2e0874939f7553f35bb18e0b7.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]', 'verao', 0, 0, 1),
(33, 'blusa', NULL, 'preto', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fbe%2F87%2Fbe872c2332213346db0e518d69ad5e69f3441708.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]', 'meiaEstacao', 0, 0, 1),
(34, 'blusa', NULL, 'preto', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fb3%2F51%2Fb35191407257dc5c7eb6d71e8dd0e0ed9d326842.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]', 'inverno', 0, 0, 1),
(35, 'blusa', NULL, 'dourado', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F62%2F79%2F62792f6c0388a82642578983bdb921c9a94e29df.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]', 'verao', 0, 0, 1),
(36, 'blusa', NULL, 'branco', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F8b%2F93%2F8b938cd30434c5f37a1ce53d290d009d48fb833a.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]', 'meiaEstacao', 0, 0, 1),
(37, 'blusa', NULL, 'estampado', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fb1%2F34%2Fb134e0831d276a6613ce6aeefadba9f828015899.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]', 'meiaEstacao', 0, 0, 1);


INSERT INTO
`CLOTHES` (`id`, `tipo`, `salto`, `cor`, `imagem`, `clima`, `lavar`, `manutencao`, `disponivel`)
VALUES
(38, 'moletom', NULL, 'cinza', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F07%2F03%2F0703d7ecbca1335a9a528e28977fe67c35cd74bd.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_cardigansjumpers_hoodiessweatshirts%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/fullscreen]', 'meiaEstacao', 0, 0, 1),
(39, 'moletom', NULL, 'preto', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fa6%2Fda%2Fa6da1b14c7bc072fbf73ce26f79585ef729bbf81.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_cardigansjumpers_hoodiessweatshirts%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/fullscreen]', 'meiaEstacao', 0, 1, 0),
(40, 'moletom', NULL, 'cinza', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fca%2F64%2Fca64fe5bb051ce7440c802c887ba5b68dce18827.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_cardigansjumpers_hoodiessweatshirts%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/fullscreen]', 'meiaEstacao', 0, 0, 1),
(41, 'moletom', NULL, 'verde', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F6c%2F22%2F6c22121c10ed1404f5d988f957960ae513f30ac3.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_cardigansjumpers_hoodiessweatshirts%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/fullscreen]', 'inverno', 0, 0, 1),
(42, 'moletom', NULL, 'cinza', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F1b%2F23%2F1b239abd3a701e027653ebb00957bcc4db8098f5.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_cardigansjumpers_hoodiessweatshirts%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/fullscreen]', 'inverno', 0, 0, 1);


INSERT INTO
`CLOTHES` (`id`, `tipo`, `salto`, `cor`, `imagem`, `clima`, `lavar`, `manutencao`, `disponivel`)
VALUES
(43, 'casaco', NULL, 'preto', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fdb%2F28%2Fdb287628c35c6680197a1e410c2d25a802eecdbf.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_jacketscoats_denim%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/fullscreen]', 'meiaEstacao', 0, 0, 1),
(44, 'casaco', NULL, 'marrom', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F0e%2Fbe%2F0ebe5e295942a041abaf04a543077b32e966f222.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_jacketscoats_denim%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/fullscreen]', 'inverno', 0, 0, 1),
(45, 'casaco', NULL, 'branco', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fe2%2F5d%2Fe25da0044ae1fde210e56f183acc721fa99c5703.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bladies_jacketscoats_denim%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/fullscreen]', 'inverno', 0, 0, 1);


INSERT INTO
`CLOTHES` (`id`, `tipo`, `salto`, `cor`, `imagem`, `clima`, `lavar`, `manutencao`, `disponivel`)
VALUES
(46, 'sapato', 0, 'preto', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F67%2Faf%2F67afac5d8ff2106b9322ffc33dd7fa90b6690490.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]', 'inverno', 0, 0, 1),
(47, 'sapato', 0, 'branco', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Faa%2F78%2Faa78ead947be2b93a0e7a9d43e8b815878f2fb43.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]', 'verao', 0, 0, 1),
(48, 'sapato', 1, 'branco', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F7a%2F96%2F7a96611a77af49b8d88c6e6dab2284bada4705a2.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]', 'meiaEstacao', 0, 0, 1),
(49, 'sapato', 1, 'marrom', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fef%2Fa5%2Fefa5157e79c6c62ad35125c892f65405d5fcc56f.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]', 'inverno', 0, 0, 1),
(50, 'sapato', 1, 'preto', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fbb%2F35%2Fbb3554cd8bcfd2553ac99cab5b97f517207a951e.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]', 'meiaEstacao', 0, 1, 0),
(51, 'sapato', 0, 'preto', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F56%2F37%2F56378e5252fe5b95720662aa8d63c5d13da25fb4.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]', 'verao', 0, 0, 1),
(52, 'sapato', 0, 'branco', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F68%2F4a%2F684a412c2da2a565c524bf5c1d0ee58f890e81c0.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]', 'verao', 0, 0, 1),
(53, 'sapato', 1, 'preto', 'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Fc6%2Fb5%2Fc6b5517d5f9d4bbb01f6d05c0f2899add8ca9b0c.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]', 'meiaEstacao', 0, 0, 1);



--
-- Índices de tabela `CLOTHES`
--
ALTER TABLE `CLOTHES`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para o id das próximas entradas
--
ALTER TABLE `CLOTHES`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
COMMIT;