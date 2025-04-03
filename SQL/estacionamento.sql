-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 03-Abr-2025 às 18:26
-- Versão do servidor: 10.1.38-MariaDB
-- versão do PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `estacionamento`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `estacionar`
--

CREATE TABLE `estacionar` (
  `estacionar_id` int(11) NOT NULL,
  `estacionar_precificacao_id` int(11) NOT NULL,
  `estacionar_forma_pagamento_id` int(11) DEFAULT NULL,
  `estacionar_valor_hora` varchar(20) NOT NULL,
  `estacionar_numero_vaga` int(11) NOT NULL,
  `estacionar_placa_veiculo` varchar(8) NOT NULL,
  `estacionar_marca_veiculo` varchar(30) NOT NULL,
  `estacionar_modelo_veiculo` varchar(20) NOT NULL,
  `estacionar_data_entrada` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estacionar_data_saida` datetime DEFAULT NULL,
  `estacionar_tempo_decorrido` varchar(20) DEFAULT NULL,
  `estacionar_valor_devido` varchar(30) DEFAULT NULL,
  `estacionar_status` tinyint(1) NOT NULL,
  `estacionar_data_alteracao` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `estacionar`
--

INSERT INTO `estacionar` (`estacionar_id`, `estacionar_precificacao_id`, `estacionar_forma_pagamento_id`, `estacionar_valor_hora`, `estacionar_numero_vaga`, `estacionar_placa_veiculo`, `estacionar_marca_veiculo`, `estacionar_modelo_veiculo`, `estacionar_data_entrada`, `estacionar_data_saida`, `estacionar_tempo_decorrido`, `estacionar_valor_devido`, `estacionar_status`, `estacionar_data_alteracao`) VALUES
(10, 2, 1, '15,00', 1, 'ATT-0909', 'Nissan', 'Sky Line', '2025-04-01 08:32:45', '2025-04-02 09:04:27', '24.39', '365.85', 1, '2025-04-02 12:12:27'),
(12, 3, 3, '20,00', 1, 'MVC-6969', 'GM', 'Focus', '2025-04-01 08:34:35', '2025-04-02 09:04:38', '24.37', '487.4', 1, '2025-04-02 12:12:38'),
(14, 3, NULL, '20,00', 7, 'BSD-8888', 'GM', 'Jetta', '2025-04-01 10:58:09', NULL, NULL, NULL, 0, NULL),
(15, 1, 1, '10,00', 10, 'RKH-8478', 'BMW', 'M4', '2025-04-01 10:58:57', '2025-04-02 10:04:24', '23.54', '235.4', 1, '2025-04-02 13:53:24'),
(16, 1, 2, '10,00', 9, 'DIK-9012', 'Ford', 'Fiesta', '2025-04-01 11:00:03', '2025-04-02 10:04:39', '23.53', '235.3', 1, '2025-04-02 13:53:39'),
(17, 4, NULL, '8,00', 25, 'KGB-2864', 'Wolkswagen', 'Fox', '2025-04-01 11:01:23', NULL, NULL, NULL, 0, NULL),
(18, 2, NULL, '15,00', 27, 'MEU-2516', 'Monster', 'Truck', '2025-04-01 11:02:26', NULL, NULL, NULL, 0, NULL),
(19, 1, 2, '10,00', 29, 'AWD-2457', 'legal', 'legal', '2025-04-01 11:02:57', '2025-04-02 09:04:51', '22.9', '229', 1, '2025-04-02 12:12:51');

-- --------------------------------------------------------

--
-- Estrutura da tabela `formas_pagamentos`
--

CREATE TABLE `formas_pagamentos` (
  `forma_pagamento_id` int(11) NOT NULL,
  `forma_pagamento_nome` varchar(30) NOT NULL,
  `forma_pagamento_ativa` tinyint(1) NOT NULL,
  `forma_pagamento_data_alteracao` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `formas_pagamentos`
--

INSERT INTO `formas_pagamentos` (`forma_pagamento_id`, `forma_pagamento_nome`, `forma_pagamento_ativa`, `forma_pagamento_data_alteracao`) VALUES
(1, 'Dinheiro', 1, '2025-03-25 18:57:40'),
(2, 'Cartão de débito', 1, '2025-03-25 18:57:44'),
(3, 'Cartão de crédito', 1, '0000-00-00 00:00:00'),
(4, 'Grátis', 0, '2025-03-28 18:21:38'),
(5, 'Cheque', 0, '2025-04-02 16:39:28'),
(6, 'Transferência bancária', 0, '0000-00-00 00:00:00'),
(7, 'Pix', 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Estrutura da tabela `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(2, '::1', 'pedro@gmail.com', 1743680178),
(3, '::1', 'pedro@gmail.com', 1743680188);

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensalidades`
--

CREATE TABLE `mensalidades` (
  `mensalidade_id` int(11) NOT NULL,
  `mensalidade_mensalista_id` int(11) NOT NULL,
  `mensalidade_precificacao_id` int(11) NOT NULL,
  `mensalidade_valor_mensalidade` varchar(20) NOT NULL,
  `mensalidade_mensalista_dia_vencimento` int(11) NOT NULL,
  `mensalidade_data_vencimento` date NOT NULL,
  `mensalidade_data_pagamento` datetime DEFAULT NULL,
  `mensalidade_status` tinyint(1) NOT NULL,
  `mensalidade_data_alteracao` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `mensalidades`
--

INSERT INTO `mensalidades` (`mensalidade_id`, `mensalidade_mensalista_id`, `mensalidade_precificacao_id`, `mensalidade_valor_mensalidade`, `mensalidade_mensalista_dia_vencimento`, `mensalidade_data_vencimento`, `mensalidade_data_pagamento`, `mensalidade_status`, `mensalidade_data_alteracao`) VALUES
(1, 1, 1, '130,00', 28, '2020-05-05', '2025-04-02 08:51:42', 1, '2025-04-02 11:51:42'),
(2, 1, 3, '180,00', 28, '2025-05-05', '2025-03-28 10:34:33', 1, '2025-03-28 13:34:33'),
(3, 2, 2, '150,00', 28, '2025-03-28', '2025-03-28 10:30:41', 1, '2025-03-28 13:30:41'),
(4, 2, 4, '100,00', 28, '2025-04-28', NULL, 0, NULL),
(8, 3, 3, '180,00', 1, '2025-05-01', NULL, 0, NULL),
(9, 3, 3, '180,00', 1, '2025-04-01', '2025-04-02 11:21:30', 1, '2025-04-02 14:21:30'),
(10, 1, 1, '130,00', 28, '2025-05-28', '2025-04-01 10:51:38', 1, NULL),
(11, 1, 2, '150,00', 28, '2025-04-28', '2025-04-02 08:40:50', 1, '2025-04-02 11:40:50'),
(12, 1, 3, '180,00', 28, '2025-06-28', NULL, 0, NULL),
(13, 5, 4, '100,00', 10, '2025-04-10', '2025-04-03 08:27:41', 1, '2025-04-03 11:27:41');

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensalistas`
--

CREATE TABLE `mensalistas` (
  `mensalista_id` int(11) NOT NULL,
  `mensalista_data_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `mensalista_nome` varchar(45) NOT NULL,
  `mensalista_sobrenome` varchar(150) NOT NULL,
  `mensalista_data_nascimento` date DEFAULT NULL,
  `mensalista_cpf` varchar(20) NOT NULL,
  `mensalista_rg` varchar(20) NOT NULL,
  `mensalista_email` varchar(50) NOT NULL,
  `mensalista_telefone_fixo` varchar(20) DEFAULT NULL,
  `mensalista_telefone_movel` varchar(20) NOT NULL,
  `mensalista_cep` varchar(10) NOT NULL,
  `mensalista_endereco` varchar(155) NOT NULL,
  `mensalista_numero_endereco` varchar(20) NOT NULL,
  `mensalista_bairro` varchar(45) NOT NULL,
  `mensalista_cidade` varchar(105) NOT NULL,
  `mensalista_estado` varchar(2) NOT NULL,
  `mensalista_complemento` varchar(145) NOT NULL,
  `mensalista_ativo` tinyint(1) NOT NULL,
  `mensalista_dia_vencimento` int(11) NOT NULL,
  `mensalista_observacao` tinytext,
  `mensalista_data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `mensalistas`
--

INSERT INTO `mensalistas` (`mensalista_id`, `mensalista_data_cadastro`, `mensalista_nome`, `mensalista_sobrenome`, `mensalista_data_nascimento`, `mensalista_cpf`, `mensalista_rg`, `mensalista_email`, `mensalista_telefone_fixo`, `mensalista_telefone_movel`, `mensalista_cep`, `mensalista_endereco`, `mensalista_numero_endereco`, `mensalista_bairro`, `mensalista_cidade`, `mensalista_estado`, `mensalista_complemento`, `mensalista_ativo`, `mensalista_dia_vencimento`, `mensalista_observacao`, `mensalista_data_alteracao`) VALUES
(1, '2020-03-13 22:00:02', 'Lucio', 'Souza', '2020-03-13', '359.731.420-19', '334.44644-12', 'lucio@gmail.com', '(41) 3232-3232', '(41) 9999-9999', '80530-000', 'Rua de Curitiba', '45', 'Centro', 'Curitiba', 'PR', '', 1, 28, '', '2025-03-28 13:13:49'),
(2, '2020-03-16 18:32:17', 'João', 'Antonio', '1984-03-13', '964.222.370-81', '33.036.268-9', 'joao@gmail.com', '(48) 3434-3434', '(48) 4002-8922', '80120-000', 'Rua do Trabalho', 'sem número', 'Centro', 'Curitiba', 'PR', 'Rua dos trabalhadores', 1, 28, 'Não atende o telefone pela manhã', '2025-03-28 12:49:06'),
(3, '2025-04-01 13:16:01', 'Gabriel', 'Vaz Lima', '2000-02-20', '728.703.050-01', '33.655.203-8', 'gabrielvaz@gmail.com', '(00) 00000-0000', '(48) 1010-1010', '80670-000', 'rua sao jorge', '23', 'vasco', 'Amarelo', 'RJ', 'Do lado da rua azul', 1, 1, '', '2025-04-01 13:36:15'),
(5, '2025-04-03 11:16:00', 'antonio', 'fagundes', '1993-03-20', '883.052.160-47', '11.797.594-1', 'antionio@gmail.com', '(41) 3459-8763', '(24) 3589-0275', '38547-000', 'Rua antonio fagundes', '51', 'mina do toco', 'Antonio', 'FA', 'gundes', 1, 10, '', '2025-04-03 11:42:51');

-- --------------------------------------------------------

--
-- Estrutura da tabela `precificacoes`
--

CREATE TABLE `precificacoes` (
  `precificacao_id` int(11) NOT NULL,
  `precificacao_categoria` varchar(50) NOT NULL,
  `precificacao_valor_hora` varchar(50) NOT NULL,
  `precificacao_valor_mensalidade` varchar(20) NOT NULL,
  `precificacao_numero_vagas` int(11) NOT NULL,
  `precificacao_ativa` tinyint(1) NOT NULL,
  `precificacao_data_alteracao` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `precificacoes`
--

INSERT INTO `precificacoes` (`precificacao_id`, `precificacao_categoria`, `precificacao_valor_hora`, `precificacao_valor_mensalidade`, `precificacao_numero_vagas`, `precificacao_ativa`, `precificacao_data_alteracao`) VALUES
(1, 'Veículo Pequeno', '10,00', '130,00', 30, 1, '2025-04-02 17:11:59'),
(2, 'Veículo Médio', '15,00', '150,00', 30, 1, '2025-04-01 11:31:56'),
(3, 'Veículo Grande', '20,00', '180,00', 30, 1, '2025-04-01 11:31:52'),
(4, 'Veículo Moto', '8,00', '100,00', 30, 1, '2025-04-02 11:19:01');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sistema`
--

CREATE TABLE `sistema` (
  `sistema_id` int(11) NOT NULL,
  `sistema_razao_social` varchar(145) DEFAULT NULL,
  `sistema_nome_fantasia` varchar(145) DEFAULT NULL,
  `sistema_cnpj` varchar(25) DEFAULT NULL,
  `sistema_ie` varchar(25) DEFAULT NULL,
  `sistema_telefone_fixo` varchar(25) DEFAULT NULL,
  `sistema_telefone_movel` varchar(25) NOT NULL,
  `sistema_email` varchar(100) DEFAULT NULL,
  `sistema_site_url` varchar(100) DEFAULT NULL,
  `sistema_cep` varchar(25) DEFAULT NULL,
  `sistema_endereco` varchar(145) DEFAULT NULL,
  `sistema_numero` varchar(25) DEFAULT NULL,
  `sistema_cidade` varchar(45) DEFAULT NULL,
  `sistema_estado` varchar(2) DEFAULT NULL,
  `sistema_texto_ticket` tinytext,
  `sistema_data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `sistema`
--

INSERT INTO `sistema` (`sistema_id`, `sistema_razao_social`, `sistema_nome_fantasia`, `sistema_cnpj`, `sistema_ie`, `sistema_telefone_fixo`, `sistema_telefone_movel`, `sistema_email`, `sistema_site_url`, `sistema_cep`, `sistema_endereco`, `sistema_numero`, `sistema_cidade`, `sistema_estado`, `sistema_texto_ticket`, `sistema_data_alteracao`) VALUES
(1, 'Park Now System', 'Park Now', '80.838.809/0001-26', '683.90228-49', '(41) 3232-3030', '(41) 9999-9999', 'parknow@contato.com.br', 'http://parknow.com.br', '80510-000', 'Rua da Programação', '54', 'Curitiba', 'PR', 'Park Now - Seu veículo em boas mãos.', '2020-03-10 18:01:36');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `data_ultima_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `data_ultima_alteracao`) VALUES
(10, '::1', 'gabrielnunes', '$2y$10$dpPjr1ji7G/b2Q/W9leRPuJeWjMfEn4bX6FUEOQFTB8I95/y.wxs.', 'gabriel@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1743097503, 1743678662, 1, 'gabriel', 'nunes', NULL, NULL, '2025-04-03 11:11:02'),
(11, '::1', 'nunes', '$2y$10$KwxluLpqfZTrn.gRgKm.XuRSB.aXWrPbrOtb8TS0plSSSWiDYxo7S', 'nunes@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1743613425, 1743620536, 1, 'nunes', 'nunes', NULL, NULL, '2025-04-02 19:03:23'),
(12, '::1', 'jaozinho', '$2y$10$PAjZPyaPXd5IqyGZXy7N0OkSWPV.Wo7DwQbF/x2MRBo2v7AzfU/4i', 'joao@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1743620693, NULL, 0, 'joao', 'zinho da silva', NULL, NULL, '2025-04-02 20:45:02'),
(13, '::1', 'pedrinhominecraft', '$2y$10$k2a.LwXCYbLKgBj1JqWUQO.iH9hl3ddX6dUTPHG.yXLe7qErAA5A.', 'pedrinho@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1743621369, 1743680196, 1, 'pedro', 'da cruz', NULL, NULL, '2025-04-03 11:36:36');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(54, 10, 1),
(40, 11, 1),
(56, 12, 2),
(59, 13, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `estacionar`
--
ALTER TABLE `estacionar`
  ADD PRIMARY KEY (`estacionar_id`);

--
-- Indexes for table `formas_pagamentos`
--
ALTER TABLE `formas_pagamentos`
  ADD PRIMARY KEY (`forma_pagamento_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mensalidades`
--
ALTER TABLE `mensalidades`
  ADD PRIMARY KEY (`mensalidade_id`);

--
-- Indexes for table `mensalistas`
--
ALTER TABLE `mensalistas`
  ADD PRIMARY KEY (`mensalista_id`);

--
-- Indexes for table `precificacoes`
--
ALTER TABLE `precificacoes`
  ADD PRIMARY KEY (`precificacao_id`);

--
-- Indexes for table `sistema`
--
ALTER TABLE `sistema`
  ADD PRIMARY KEY (`sistema_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `estacionar`
--
ALTER TABLE `estacionar`
  MODIFY `estacionar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `formas_pagamentos`
--
ALTER TABLE `formas_pagamentos`
  MODIFY `forma_pagamento_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mensalidades`
--
ALTER TABLE `mensalidades`
  MODIFY `mensalidade_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `mensalistas`
--
ALTER TABLE `mensalistas`
  MODIFY `mensalista_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `precificacoes`
--
ALTER TABLE `precificacoes`
  MODIFY `precificacao_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sistema`
--
ALTER TABLE `sistema`
  MODIFY `sistema_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
