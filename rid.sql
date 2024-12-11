SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "-03:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `rid`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `alocacoes`
--

CREATE TABLE `alocacoes` (
  `id` int(11) NOT NULL,
  `docente` int(11) NOT NULL,
  `nucleo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `docente`
--

CREATE TABLE `docente` (
  `id` int(11) NOT NULL,
  `nome` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `slug` varchar(300) NOT NULL,
  `descricao` text NOT NULL,
  `subcategoria` int(11) NOT NULL,
  `nivel` enum('INTERNACIONAL','NACIONAL','REGIONAL_OU_LOCAL','QUALIS_A1','QUALIS_A2','QUALIS_B1','QUALIS_B2','QUALIS_B3','QUALIS_B4','QUALIS_B5','QUALIS_C','SEM_QUALIS','PRESIDENTE','COORDENADOR','MEMBRO','SUBCOORDENADOR','COLABORADOR','VICE_COORDENADOR','VICE_PRESIDENTE','TITULAR','SUPLENTE') DEFAULT NULL,
  `tipo` enum('EVENTO','MULTIPLICADOR','EXISTENCIA') DEFAULT NULL,
  `multiplicador` float DEFAULT NULL,
  `limite` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `items`
--

INSERT INTO `items` (`id`, `slug`, `descricao`, `subcategoria`, `nivel`, `tipo`, `multiplicador`, `limite`) VALUES
(1, 'aulas_graduacao', 'Na graduação', 1, NULL, 'MULTIPLICADOR', 0.15, NULL),
(2, 'cursos_atualizacao', 'Em cursos de atualização, aperfeiçoamento ou curso lato sensu', 1, NULL, 'MULTIPLICADOR', 1, 26),
(3, 'cursos_pos_graduacao', 'Em cursos de pós-graduação stricto sensu', 1, NULL, 'MULTIPLICADOR', 2, 50),
(4, 'monitor', 'Monitor', 2, NULL, 'MULTIPLICADOR', 3, 12),
(5, 'iniciacao_cientifica_junior', 'Em programas de iniciação científica Júnior - BIC Júnior, PIBIC Júnior e similares', 2, NULL, 'EVENTO', 15, NULL),
(6, 'iniciacao_cientifica', 'Em trabalhos de iniciação científica, projetos de pesquisa e/ou extensão, com ou sem bolsa', 2, NULL, 'EVENTO', 25, NULL),
(7, 'co_orientacao_iniciacao_cientifica', 'Co-orientação em trabalhos de iniciação científica, projetos de pesquisa e/ou extensão, com ou sem bolsa', 2, NULL, 'EVENTO', 15, NULL),
(8, 'tcc', 'Trabalho de conclusão de curso (TCC)', 2, NULL, 'EVENTO', 25, NULL),
(9, 'co_orientacao_tcc', 'Co-orientação de TCC', 2, NULL, 'EVENTO', 15, NULL),
(10, 'cursos_lato_sensu', 'Em cursos lato sensu', 2, NULL, 'EVENTO', 30, NULL),
(11, 'co_orientacao_cursos_lato_sensu', 'Co-orientação em cursos lato sensu', 2, NULL, 'EVENTO', 10, NULL),
(12, 'mestrado', 'Em curso de mestrado', 2, NULL, 'EVENTO', 100, NULL),
(13, 'co_orientacao_mestrado', 'Co-orientação em curso de mestrado', 2, NULL, 'EVENTO', 50, NULL),
(14, 'doutorado', 'Em curso de doutorado', 2, NULL, 'EVENTO', 200, NULL),
(15, 'co_orientacao_doutorado', 'Co-orientação em curso de doutorado', 2, NULL, 'EVENTO', 100, NULL),
(16, 'preceptoria', 'Preceptoria ou orientação de estágio obrigatório', 2, NULL, 'MULTIPLICADOR', 0.1, NULL),
(17, 'supervisor_estagio_obrigatorio', 'Supervisor de estágio obrigatório', 2, NULL, 'MULTIPLICADOR', 0.1, NULL),
(18, 'supervisor_estagio_nao_obrigatorio', 'Supervisor de estágio não obrigatório', 2, NULL, 'MULTIPLICADOR', 0.05, NULL),
(19, 'tutor_pet', 'Tutor do Programa de Educação Tutorial - PET', 2, NULL, 'EVENTO', 30, NULL),
(20, 'interlocutor_pet', 'Interlocutor do PET', 2, NULL, 'EVENTO', 10, NULL),
(21, 'coordenador_piepex', 'Coordenador do PIEPEX', 3, NULL, 'EVENTO', 20, NULL),
(22, 'membro_colegiado_piepex', 'Membro do Colegiado do PIEPEX', 3, NULL, 'EVENTO', 5, NULL),
(23, 'orientador_piepex', 'Orientador de aluno em atividades do PIEPEX', 3, NULL, 'EVENTO', 25, NULL),
(24, 'orientador_tcp', 'Orientador de trabalho de conclusão do Bacharelado Interdisciplinar - TCP', 3, NULL, 'EVENTO', 15, NULL),
(25, 'avaliacao_tcp', 'Avaliação de trabalho de conclusão do Bacharelado Interdisciplinar – TCP', 3, NULL, 'EVENTO', 3, NULL),
(26, 'participacao_piepex_portarias', 'Participação em atividade do PIEPEX designada por portarias (serão consideradas apenas as portarias cujas atividades não tenham sido contempladas nos itens anteriores)', 3, NULL, 'EVENTO', 5, NULL),
(27, 'coordenador_pta', 'Coordenador do PTA', 4, NULL, 'EVENTO', 15, NULL),
(28, 'membro_colegiado_pta', 'Membro do colegiado do PTA', 4, NULL, 'EVENTO', 5, NULL),
(29, 'orientador_pta', 'Orientador de alunos em atividades do PTA', 4, NULL, 'EVENTO', 3, NULL),
(30, 'participacao_pta_portarias', 'Participação em atividade do PTA designada por portarias (serão consideradas apenas as portarias cujas atividades não tenham sido contempladas nos itens anteriores)', 4, NULL, 'EVENTO', 5, NULL),
(31, 'coordenador_pibid', 'Coordenador institucional, coordenador de gestão ou coordenador de área', 5, NULL, 'EVENTO', 30, NULL),
(32, 'pesquisa_congressos_internacional', 'Participação em congressos, simpósios, seminários e demais eventos técnico-científicos (Internacional)', 6, 'INTERNACIONAL', 'EXISTENCIA', 5, NULL),
(33, 'pesquisa_congressos_nacional', 'Participação em congressos, simpósios, seminários e demais eventos técnico-científicos (Nacional)', 6, 'NACIONAL', 'EXISTENCIA', 4, NULL),
(34, 'pesquisa_congressos_regional_local', 'Participação em congressos, simpósios, seminários e demais eventos técnico-científicos (Regional ou local)', 6, 'REGIONAL_OU_LOCAL', 'EXISTENCIA', 3, NULL),
(35, 'pesquisa_palestrante_internacional', 'Palestrante, ministrante de curso, debatedor ou moderador em eventos técnico-científicos (Internacional)', 7, 'INTERNACIONAL', 'EXISTENCIA', 15, NULL),
(36, 'pesquisa_palestrante_nacional', 'Palestrante, ministrante de curso, debatedor ou moderador em eventos técnico-científicos (Nacional)', 7, 'NACIONAL', 'EXISTENCIA', 10, NULL),
(37, 'pesquisa_palestrante_regional_local', 'Palestrante, ministrante de curso, debatedor ou moderador em eventos técnico-científicos (Regional ou local)', 7, 'REGIONAL_OU_LOCAL', 'EXISTENCIA', 5, NULL),
(38, 'pesquisa_apresentacao_oral_internacional', 'Apresentação oral de trabalho em eventos técnico-científicos (Internacional)', 8, 'INTERNACIONAL', 'EXISTENCIA', 15, NULL),
(39, 'pesquisa_apresentacao_oral_nacional', 'Apresentação oral de trabalho em eventos técnico-científicos (Nacional)', 8, 'NACIONAL', 'EXISTENCIA', 10, NULL),
(40, 'pesquisa_apresentacao_oral_regional_local', 'Apresentação oral de trabalho em eventos técnico-científicos (Regional ou local)', 8, 'REGIONAL_OU_LOCAL', 'EXISTENCIA', 5, NULL),
(41, 'pesquisa_apresentacao_poster_internacional', 'Apresentação de trabalho na forma de pôster em eventos técnico-científicos (Internacional)', 9, 'INTERNACIONAL', 'EXISTENCIA', 10, NULL),
(42, 'pesquisa_apresentacao_poster_nacional', 'Apresentação de trabalho na forma de pôster em eventos técnico-científicos (Nacional)', 9, 'NACIONAL', 'EXISTENCIA', 5, NULL),
(43, 'pesquisa_apresentacao_poster_regional_local', 'Apresentação de trabalho na forma de pôster em eventos técnico-científicos (Regional ou local)', 9, 'REGIONAL_OU_LOCAL', 'EXISTENCIA', 3, NULL),
(44, 'pesquisa_publicacao_artigo_completo_internacional', 'Publicação de artigo completo ou resumo expandido em anais (impresso/eletrônico) de eventos técnico-científicos (Internacional)', 10, 'INTERNACIONAL', 'EXISTENCIA', 15, NULL),
(45, 'pesquisa_publicacao_artigo_completo_nacional', 'Publicação de artigo completo ou resumo expandido em anais (impresso/eletrônico) de eventos técnico-científicos (Nacional)', 10, 'NACIONAL', 'EXISTENCIA', 10, NULL),
(46, 'pesquisa_publicacao_artigo_completo_regional_local', 'Publicação de artigo completo ou resumo expandido em anais (impresso/eletrônico) de eventos técnico-científicos (Regional ou local)', 10, 'REGIONAL_OU_LOCAL', 'EXISTENCIA', 5, NULL),
(47, 'pesquisa_publicacao_resumo_internacional', 'Publicação de resumo em anais (impresso/eletrônico) de eventos técnico-científicos (Internacional)', 11, 'INTERNACIONAL', 'EXISTENCIA', 10, NULL),
(48, 'pesquisa_publicacao_resumo_nacional', 'Publicação de resumo em anais (impresso/eletrônico) de eventos técnico-científicos (Nacional)', 11, 'NACIONAL', 'EXISTENCIA', 5, NULL),
(49, 'pesquisa_publicacao_resumo_regional_local', 'Publicação de resumo em anais (impresso/eletrônico) de eventos técnico-científicos (Regional ou local)', 11, 'REGIONAL_OU_LOCAL', 'EXISTENCIA', 3, NULL),
(50, 'pesquisa_publicacao_artigo_revista_qualis_a1', 'Publicação de artigo, texto ou ensaio em revista (impressa/eletrônica) com corpo editorial (Qualis A1)', 12, 'QUALIS_A1', 'EXISTENCIA', 70, NULL),
(51, 'pesquisa_publicacao_artigo_revista_qualis_a2', 'Publicação de artigo, texto ou ensaio em revista (impressa/eletrônica) com corpo editorial (Qualis A2)', 12, 'QUALIS_A2', 'EXISTENCIA', 65, NULL),
(52, 'pesquisa_publicacao_artigo_revista_qualis_b1', 'Publicação de artigo, texto ou ensaio em revista (impressa/eletrônica) com corpo editorial (Qualis B1)', 12, 'QUALIS_B1', 'EXISTENCIA', 60, NULL),
(53, 'pesquisa_publicacao_artigo_revista_qualis_b2', 'Publicação de artigo, texto ou ensaio em revista (impressa/eletrônica) com corpo editorial (Qualis B2)', 12, 'QUALIS_B2', 'EXISTENCIA', 55, NULL),
(54, 'pesquisa_publicacao_artigo_revista_qualis_b3', 'Publicação de artigo, texto ou ensaio em revista (impressa/eletrônica) com corpo editorial (Qualis B3)', 12, 'QUALIS_B3', 'EXISTENCIA', 50, NULL),
(55, 'pesquisa_publicacao_artigo_revista_qualis_b4', 'Publicação de artigo, texto ou ensaio em revista (impressa/eletrônica) com corpo editorial (Qualis B4)', 12, 'QUALIS_B4', 'EXISTENCIA', 45, NULL),
(56, 'pesquisa_publicacao_artigo_revista_qualis_b5', 'Publicação de artigo, texto ou ensaio em revista (impressa/eletrônica) com corpo editorial (Qualis B5)', 12, 'QUALIS_B5', 'EXISTENCIA', 40, NULL),
(57, 'pesquisa_publicacao_artigo_revista_qualis_c', 'Publicação de artigo, texto ou ensaio em revista (impressa/eletrônica) com corpo editorial (Qualis C)', 12, 'QUALIS_C', 'EXISTENCIA', 35, NULL),
(58, 'pesquisa_publicacao_artigo_revista_sem_qualis', 'Publicação de artigo, texto ou ensaio em revista (impressa/eletrônica) sem Qualis', 12, 'SEM_QUALIS', 'EXISTENCIA', 20, NULL),
(59, 'pesquisa_publicacao_resenha_qualis_a1', 'Publicação de resenha, resumo expandido, comunicação ou editorial em revista (impressa/eletrônica) com corpo editorial (Qualis A1)', 13, 'QUALIS_A1', 'EXISTENCIA', 35, NULL),
(60, 'pesquisa_publicacao_resenha_qualis_a2', 'Publicação de resenha, resumo expandido, comunicação ou editorial em revista (impressa/eletrônica) com corpo editorial (Qualis A2)', 13, 'QUALIS_A2', 'EXISTENCIA', 30, NULL),
(61, 'pesquisa_publicacao_resenha_qualis_b1', 'Publicação de resenha, resumo expandido, comunicação ou editorial em revista (impressa/eletrônica) com corpo editorial (Qualis B1)', 13, 'QUALIS_B1', 'EXISTENCIA', 25, NULL),
(62, 'pesquisa_publicacao_resenha_qualis_b2', 'Publicação de resenha, resumo expandido, comunicação ou editorial em revista (impressa/eletrônica) com corpo editorial (Qualis B2)', 13, 'QUALIS_B2', 'EXISTENCIA', 20, NULL),
(63, 'pesquisa_publicacao_resenha_qualis_b3', 'Publicação de resenha, resumo expandido, comunicação ou editorial em revista (impressa/eletrônica) com corpo editorial (Qualis B3)', 13, 'QUALIS_B3', 'EXISTENCIA', 15, NULL),
(64, 'pesquisa_publicacao_resenha_qualis_b4', 'Publicação de resenha, resumo expandido, comunicação ou editorial em revista (impressa/eletrônica) com corpo editorial (Qualis B4)', 13, 'QUALIS_B4', 'EXISTENCIA', 10, NULL),
(65, 'pesquisa_publicacao_resenha_qualis_b5', 'Publicação de resenha, resumo expandido, comunicação ou editorial em revista (impressa/eletrônica) com corpo editorial (Qualis B5)', 13, 'QUALIS_B5', 'EXISTENCIA', 5, NULL),
(66, 'pesquisa_publicacao_resenha_qualis_c', 'Publicação de resenha, resumo expandido, comunicação ou editorial em revista (impressa/eletrônica) com corpo editorial (Qualis C)', 13, 'QUALIS_C', 'EXISTENCIA', 3, NULL),
(67, 'pesquisa_publicacao_resenha_sem_qualis', 'Publicação de resenha, resumo expandido, comunicação ou editorial em revista (impressa/eletrônica) sem Qualis', 13, 'SEM_QUALIS', 'EXISTENCIA', 3, NULL),
(68, 'pesquisa_publicacao_resumo_revista_internacional', 'Publicação de resumo em revista(impressa/eletrônica) com corpo editorial (Internacional)', 14, 'INTERNACIONAL', 'EXISTENCIA', 15, NULL),
(69, 'pesquisa_publicacao_resumo_revista_nacional', 'Publicação de resumo em revista(impressa/eletrônica) com corpo editorial (Nacional)', 14, 'NACIONAL', 'EXISTENCIA', 10, NULL),
(70, 'pesquisa_publicacao_resumo_revista_regional_local', 'Publicação de resumo em revista(impressa/eletrônica) com corpo editorial (Regional ou local)', 14, 'REGIONAL_OU_LOCAL', 'EXISTENCIA', 5, NULL),
(71, 'pesquisa_publicacao_imagens_textos_internacional', 'Publicação de imagens e textos em catálogos de exposições e/ou eventos da área de artes visuais, artes cênicas, cinema, música e dança (Internacional)', 15, 'INTERNACIONAL', 'EXISTENCIA', 70, NULL),
(72, 'pesquisa_publicacao_imagens_textos_nacional', 'Publicação de imagens e textos em catálogos de exposições e/ou eventos da área de artes visuais, artes cênicas, cinema, música e dança (Nacional)', 15, 'NACIONAL', 'EXISTENCIA', 60, NULL),
(73, 'pesquisa_publicacao_imagens_textos_regional_local', 'Publicação de imagens e textos em catálogos de exposições e/ou eventos da área de artes visuais, artes cênicas, cinema, música e dança (Regional ou local)', 15, 'REGIONAL_OU_LOCAL', 'EXISTENCIA', 30, NULL),
(74, 'pesquisa_publicacao_imagens_programas_internacional', 'Publicação de imagens e textos em programas e outras peças gráficas de exposições e/ou eventos da área de artes visuais, artes cênicas, cinema, música e dança (Internacional)', 16, 'INTERNACIONAL', 'EXISTENCIA', 30, NULL),
(75, 'pesquisa_publicacao_imagens_programas_nacional', 'Publicação de imagens e textos em programas e outras peças gráficas de exposições e/ou eventos da área de artes visuais, artes cênicas, cinema, música e dança (Nacional)', 16, 'NACIONAL', 'EXISTENCIA', 25, NULL),
(76, 'pesquisa_publicacao_imagens_programas_regional_local', 'Publicação de imagens e textos em programas e outras peças gráficas de exposições e/ou eventos da área de artes visuais, artes cênicas, cinema, música e dança (Regional ou local)', 16, 'REGIONAL_OU_LOCAL', 'EXISTENCIA', 15, NULL),
(77, 'pesquisa_apresentacao_producoes_internacional', 'Apresentação de produções artísticas, individuais e coletivas em exposições e/ou eventos da área de artes visuais, artes cênicas, cinema, música e dança (Internacional)', 17, 'INTERNACIONAL', 'EXISTENCIA', 100, NULL),
(78, 'pesquisa_apresentacao_producoes_nacional', 'Apresentação de produções artísticas, individuais e coletivas em exposições e/ou eventos da área de artes visuais, artes cênicas, cinema, música e dança (Nacional)', 17, 'NACIONAL', 'EXISTENCIA', 70, NULL),
(79, 'pesquisa_apresentacao_producoes_regional_local', 'Apresentação de produções artísticas, individuais e coletivas em exposições e/ou eventos da área de artes visuais, artes cênicas, cinema, música e dança (Regional ou local)', 17, 'REGIONAL_OU_LOCAL', 'EXISTENCIA', 30, NULL),
(80, 'pesquisa_publicacao_ensaios_internacional', 'Publicação de ensaios, imagens, artigos e resenhas em jornais de resenhas e suplementos artísticos e literários (Internacional)', 18, 'INTERNACIONAL', 'EXISTENCIA', 30, NULL),
(81, 'pesquisa_publicacao_ensaios_nacional', 'Publicação de ensaios, imagens, artigos e resenhas em jornais de resenhas e suplementos artísticos e literários (Nacional)', 18, 'NACIONAL', 'EXISTENCIA', 25, NULL),
(82, 'pesquisa_publicacao_ensaios_regional_local', 'Publicação de ensaios, imagens, artigos e resenhas em jornais de resenhas e suplementos artísticos e literários (Regional ou local)', 18, 'REGIONAL_OU_LOCAL', 'EXISTENCIA', 15, NULL),
(83, 'pesquisa_projetos_curatoriais_internacional', 'Projetos curatoriais para exposições e/ou eventos de artes visuais, artes cênicas, cinema, música e dança (Internacional)', 19, 'INTERNACIONAL', 'EXISTENCIA', 100, NULL),
(84, 'pesquisa_projetos_curatoriais_nacional', 'Projetos curatoriais para exposições e/ou eventos de artes visuais, artes cênicas, cinema, música e dança (Nacional)', 19, 'NACIONAL', 'EXISTENCIA', 70, NULL),
(85, 'pesquisa_projetos_curatoriais_regional_local', 'Projetos curatoriais para exposições e/ou eventos de artes visuais, artes cênicas, cinema, música e dança (Regional ou local)', 19, 'REGIONAL_OU_LOCAL', 'EXISTENCIA', 30, NULL),
(86, 'projetos_pesquisa_coordenador_projeto', 'Coordenador de projeto de pesquisa financiado por agência de fomento e registrado na Pró-Reitoria de Pesquisa e Pós-Graduação', 20, NULL, 'EVENTO', 25, NULL),
(87, 'projetos_pesquisa_colaborador_projeto', 'Colaborador em projeto de pesquisa financiado por agência de fomento e registrado na Pró-Reitoria de Pesquisa e Pós-Graduação', 20, NULL, 'EVENTO', 7, NULL),
(88, 'projetos_pesquisa_coordenador_projeto_sem_financiamento', 'Coordenador de projeto de pesquisa sem financiamento e registrado na Pró-Reitoria de Pesquisa e Pós-Graduação', 20, NULL, 'EVENTO', 20, NULL),
(89, 'projetos_pesquisa_colaborador_projeto_sem_financiamento', 'Colaborador em projeto de pesquisa sem financiamento e registrado na Pró-Reitoria de Pesquisa e Pós-Graduação', 20, NULL, 'EVENTO', 5, NULL),
(90, 'grupos_pesquisa_coordenador_grupo', 'Coordenador do Grupo de Pesquisa', 21, 'COORDENADOR', 'EVENTO', 10, NULL),
(91, 'grupos_pesquisa_membro_grupo', 'Membro do Grupo de Pesquisa', 21, 'MEMBRO', 'EVENTO', 5, 10),
(92, 'livros_autoria_livro', 'Autoria de livro técnico científico cadastrado no ISBN, na respectiva área de conhecimento ou atuação docente', 45, NULL, 'EVENTO', 100, NULL),
(93, 'livros_autoria_capitulo_livro', 'Autoria de capítulo ou parte de livro técnico científico cadastrado no ISBN, na respectiva área de conhecimento ou atuação docente', 45, NULL, 'EVENTO', 25, NULL),
(94, 'livros_traducao_livro', 'Tradução de livro técnico científico cadastrado no ISBN, na respectiva área de conhecimento ou atuação docente', 45, NULL, 'EVENTO', 70, NULL),
(95, 'livros_traducao_artigo', 'Tradução de artigo, ensaio ou capítulo de livro técnico científico cadastrado no ISBN, na respectiva área de conhecimento ou atuação docente', 45, NULL, 'EVENTO', 20, NULL),
(96, 'livros_prefacio_livro', 'Prefácio, apresentação, introdução ou orelha de livro técnico científico cadastrado no ISBN, na respectiva área de conhecimento ou atuação docente', 45, NULL, 'EVENTO', 15, NULL),
(97, 'livros_organizacao_livro', 'Organização de livro técnico científico cadastrado no ISBN, na respectiva área de conhecimento ou atuação docente', 45, NULL, 'EVENTO', 50, NULL),
(98, 'membro_indexado_periodico_internacional', 'Membro do corpo editorial de periódico (impresso/eletrônico) indexado (Internacional)', 22, 'INTERNACIONAL', 'EVENTO', 20, NULL),
(99, 'membro_indexado_periodico_nacional', 'Membro do corpo editorial de periódico (impresso/eletrônico) indexado (Nacional)', 22, 'NACIONAL', 'EVENTO', 10, NULL),
(100, 'membro_nao_indexado_periodico_internacional', 'Membro do corpo editorial de periódico (impresso/eletrônico) não indexado (Internacional)', 23, 'INTERNACIONAL', 'EVENTO', 10, NULL),
(101, 'membro_nao_indexado_periodico_nacional', 'Membro do corpo editorial de periódico (impresso/eletrônico) não indexado (Nacional)', 23, 'NACIONAL', 'EVENTO', 5, NULL),
(102, 'avaliador_artigo_periodico_internacional', 'Avaliador ou consultor ad hoc de artigo científico para periódico (impresso/eletrônico) com corpo editorial (Internacional)', 24, 'INTERNACIONAL', 'EVENTO', 20, NULL),
(103, 'avaliador_artigo_periodico_nacional', 'Avaliador ou consultor ad hoc de artigo científico para periódico (impresso/eletrônico) com corpo editorial (Nacional)', 24, 'NACIONAL', 'EVENTO', 10, NULL),
(104, 'avaliador_artigo_nao_indexado_periodico_internacional', 'Avaliador ou consultor ad hoc de artigo científico para periódico (impresso/eletrônico) não indexado (Internacional)', 25, 'INTERNACIONAL', 'EVENTO', 10, NULL),
(105, 'avaliador_artigo_nao_indexado_periodico_nacional', 'Avaliador ou consultor ad hoc de artigo científico para periódico (impresso/eletrônico) não indexado (Nacional)', 25, 'NACIONAL', 'EVENTO', 5, NULL),
(106, 'adhoc_pesq_ext', 'Avaliador ad hoc de projetos de pesquisa e extensão registrados nas Pró-Reitorias da UNIFAL-MG ou outras Instituições de Ensino Superior - Por Projeto', 26, NULL, 'EVENTO', 5, NULL),
(107, 'adhoc_evento', 'Avaliador ad hoc de projetos, resumos ou trabalhos para apresentação em eventos técnico-científicos', 27, NULL, 'EVENTO', 5, NULL),
(108, 'bancas_tcc', 'De trabalho de conclusão de curso', 28, NULL, 'EVENTO', 5, NULL),
(109, 'bancas_tcc_suplente', 'Indicação como suplente de banca de trabalho de conclusão de curso', 28, NULL, 'EVENTO', 1, NULL),
(110, 'bancas_monografia', 'De monografia em cursos de especialização', 28, NULL, 'EVENTO', 5, NULL),
(111, 'bancas_monografia_suplente', 'Indicação como suplente de banca de monografia em cursos de especialização', 28, NULL, 'EVENTO', 1, NULL),
(112, 'bancas_pos_latu', 'De processo seletivo para cursos de Pós-Graduação latu sensu', 28, NULL, 'EVENTO', 3, NULL),
(113, 'bancas_pos_latu_suplente', 'Indicação como suplente de banca de processo seletivo para cursos de Pós-Graduação latu sensu', 28, NULL, 'EVENTO', 1.5, NULL),
(114, 'bancas_processo_seletivo_stricto', 'De processo seletivo para cursos de Pós-Graduação stricto sensu', 28, NULL, 'EVENTO', 5, NULL),
(115, 'bancas_processo_seletivo_stricto_suplente', 'Indicação como suplente de banca de processo seletivo para cursos de Pós-Graduação stricto sensu', 28, NULL, 'EVENTO', 2.5, NULL),
(116, 'bancas_qualificacao_mestrado', 'De exame de qualificação em cursos de mestrado', 28, NULL, 'EVENTO', 10, NULL),
(117, 'bancas_qualificacao_mestrado_suplente', 'Indicação como suplente de banca de exame de qualificação em curso de mestrado', 28, NULL, 'EVENTO', 5, NULL),
(118, 'bancas_defesa_dissertacao', 'De defesa de dissertação', 28, NULL, 'EVENTO', 15, NULL),
(119, 'bancas_defesa_dissertacao_suplente', 'Indicação como suplente de banca de defesa de dissertação', 28, NULL, 'EVENTO', 7.5, NULL),
(120, 'bancas_qualificacao_doutorado', 'De exame de qualificação em cursos de doutorado', 28, NULL, 'EVENTO', 15, NULL),
(121, 'bancas_qualificacao_doutorado_suplente', 'Indicação como suplente de banca de exame de qualificação em curso de doutorado', 28, NULL, 'EVENTO', 7.5, NULL),
(122, 'bancas_defesa_tese', 'De defesa de tese', 28, NULL, 'EVENTO', 25, NULL),
(123, 'bancas_defesa_tese_suplente', 'Indicação como suplente de banca de defesa de tese', 28, NULL, 'EVENTO', 10, NULL),
(124, 'bancas_processo_seletivo_professor', 'De processo seletivo ou de concurso público para provimento de cargo de professor em Instituição de Ensino Superior', 28, NULL, 'EVENTO', 10, NULL),
(125, 'bancas_processo_seletivo_professor_suplente', 'Indicação como suplente de banca examinadora de processo seletivo ou de concurso público para provimento de cargo de professor em Instituição de Ensino Superior', 28, NULL, 'EVENTO', 5, NULL),
(126, 'bancas_processo_seletivo_discentes', 'De processo seletivo para discentes à iniciação científica, remanejamento interno, PIBID, transferência ou similares', 28, NULL, 'EVENTO', 5, NULL),
(127, 'organizacao_eventos_internacional_presidente', 'Eventos de âmbito internacional (Presidente)', 29, 'INTERNACIONAL', 'EXISTENCIA', 80, NULL),
(128, 'organizacao_eventos_internacional_coordenador_comissao', 'Eventos de âmbito internacional (Coordenador de Comissão)', 29, 'INTERNACIONAL', 'EXISTENCIA', 60, NULL),
(129, 'organizacao_eventos_internacional_membro_comissao', 'Eventos de âmbito internacional (Membro de Comissão)', 29, 'INTERNACIONAL', 'EXISTENCIA', 30, NULL),
(130, 'organizacao_eventos_nacional_presidente', 'Eventos de âmbito nacional (Presidente)', 29, 'NACIONAL', 'EXISTENCIA', 60, NULL),
(131, 'organizacao_eventos_nacional_coordenador_comissao', 'Eventos de âmbito nacional (Coordenador de Comissão)', 29, 'NACIONAL', 'EXISTENCIA', 40, NULL),
(132, 'organizacao_eventos_nacional_membro_comissao', 'Eventos de âmbito nacional (Membro de Comissão)', 29, 'NACIONAL', 'EXISTENCIA', 20, NULL),
(133, 'organizacao_eventos_regional_local_presidente', 'Eventos de âmbito regional ou local: semanas, simpósios, jornadas (Presidente)', 29, 'REGIONAL_OU_LOCAL', 'EXISTENCIA', 40, NULL),
(134, 'organizacao_eventos_regional_local_coordenador_comissao', 'Eventos de âmbito regional ou local: semanas, simpósios, jornadas (Coordenador de Comissão)', 29, 'REGIONAL_OU_LOCAL', 'EXISTENCIA', 30, NULL),
(135, 'organizacao_eventos_regional_local_membro_comissao', 'Eventos de âmbito regional ou local: semanas, simpósios, jornadas (Membro de Comissão)', 29, 'REGIONAL_OU_LOCAL', 'EXISTENCIA', 15, NULL),
(136, 'organizacao_eventos_eventos_cadastrados_coordenador', 'Eventos cadastrados na Pró-Reitoria de Extensão: mesa-redonda, palestra, oficinas, fóruns, ciclos e seminários (Coordenador)', 29, 'COORDENADOR', 'EVENTO', 15, NULL),
(137, 'organizacao_eventos_eventos_cadastrados_vice_coordenador', 'Eventos cadastrados na Pró-Reitoria de Extensão: mesa-redonda, palestra, oficinas, fóruns, ciclos e seminários (Vice-Coordenador)', 29, 'VICE_COORDENADOR', 'EVENTO', 7.5, NULL),
(150, 'projetos_desenvolvimento_softwares_pedido_registro', 'Pedido de registro de software com número de protocolo emitido por autoridade competente', 30, NULL, 'EXISTENCIA', 50, NULL),
(151, 'projetos_desenvolvimento_softwares_registro', 'Registro de software com número de protocolo emitido por autoridade competente', 30, NULL, 'EXISTENCIA', 60, NULL),
(152, 'projetos_desenvolvimento_softwares_autoria', 'Autoria de software livre com número de ISBN', 30, NULL, 'EXISTENCIA', 50, NULL),
(153, 'projetos_desenvolvimento_patentes_pedido', 'Pedido de patente com número de protocolo emitido por autoridade competente', 30, NULL, 'EXISTENCIA', 50, NULL),
(154, 'projetos_desenvolvimento_patentes_carta', 'Carta patente com certificado emitido por autoridade competente', 30, NULL, 'EXISTENCIA', 60, NULL),
(155, 'projetos_desenvolvimento_marcas_pedido', 'Pedido de registro de marcas, com número de protocolo emitido por autoridade competente', 30, NULL, 'EXISTENCIA', 30, NULL),
(156, 'projetos_desenvolvimento_marcas_registro', 'Registro de marcas com certificado emitido por autoridade competente', 30, NULL, 'EXISTENCIA', 60, NULL),
(157, 'projetos_desenvolvimento_desenho_industrial_pedido', 'Pedido de registro de desenho industrial com número de protocolo emitido por autoridade competente', 30, NULL, 'EXISTENCIA', 50, NULL),
(158, 'projetos_desenvolvimento_desenho_industrial_registro', 'Registro de desenho industrial com certificado emitido por autoridade competente', 30, NULL, 'EXISTENCIA', 60, NULL),
(159, 'projetos_desenvolvimento_geograficas_pedido', 'Pedido de registro de indicações geográficas com número de protocolo emitido por autoridade competente', 30, NULL, 'EXISTENCIA', 50, NULL),
(160, 'projetos_desenvolvimento_geograficas_registro', 'Registro de indicações geográficas com certificado emitido por autoridade competente', 30, NULL, 'EXISTENCIA', 60, NULL),
(161, 'projetos_desenvolvimento_certificado_cultivar', 'Certificado de proteção de cultivar emitido pelo Ministério da Agricultura', 30, NULL, 'EXISTENCIA', 60, NULL),
(162, 'programa_projeto_fomento_coordenador', 'Participação em programa e/ou projeto de extensão aprovado por agência de fomento ou Instituição de Ensino Superior (Coordenador)', 31, 'COORDENADOR', 'EVENTO', 25, NULL),
(163, 'programa_projeto_fomento_subcoordenador', 'Participação em programa e/ou projeto de extensão aprovado por agência de fomento ou Instituição de Ensino Superior (Sub coordenador)', 31, 'VICE_COORDENADOR', 'EVENTO', 15, NULL),
(164, 'programa_projeto_fomento_colaborador', 'Participação em programa e/ou projeto de extensão aprovado por agência de fomento ou Instituição de Ensino Superior (Colaborador)', 31, 'COLABORADOR', 'EVENTO', 8, NULL),
(165, 'programa_projeto_sem_fomento_coordenador', 'Participação em programa e/ou projeto de extensão sem recursos de agência de fomento ou Instituição de Ensino Superior (Coordenador)', 32, 'COORDENADOR', 'EVENTO', 20, NULL),
(166, 'programa_projeto_sem_fomento_subcoordenador', 'Participação em programa e/ou projeto de extensão sem recursos de agência de fomento ou Instituição de Ensino Superior (Sub coordenador)', 32, 'SUBCOORDENADOR', 'EVENTO', 10, NULL),
(167, 'programa_projeto_sem_fomento_colaborador', 'Participação em programa e/ou projeto de extensão sem recursos de agência de fomento ou Instituição de Ensino Superior (Colaborador)', 32, 'COLABORADOR', 'EVENTO', 5, NULL),
(168, 'coordenacao_cursos_extensao_coordenador', 'Coordenador de cursos, eventos e serviços de extensão (Coordenador)', 33, 'COORDENADOR', 'EVENTO', 10, NULL),
(169, 'coordenacao_cursos_extensao_vice_coodenador', 'Coordenador de cursos, eventos e serviços de extensão (Vice Coordenador)', 33, 'VICE_COORDENADOR', 'EVENTO', 5, NULL),
(170, 'participacao_atividades_saude_assistencia', 'Participação em atividades de assistência à saúde, família ou sociedade, ligadas à área de atuação docente e promovidas pela UNIFAL-MG e/ou parceria com órgãos públicos', 34, NULL, 'EVENTO', 5, NULL),
(171, 'disseminacao_conhecimento', 'Reunião técnica, dias de campo, demonstração técnica e outras atividades similares que caracterizem disseminação de conhecimento técnico científico na área de atuação do docente, devidamente registradas pela Pró-Reitoria de Extensão ou órgão competente', 35, NULL, 'EVENTO', 5, NULL),
(172, 'reportagem', 'Reportagem em TV, rádio, jornal ou revista com abordagem de assuntos relativos à área de atuação docente', 36, NULL, 'EVENTO', 5, NULL),
(173, 'elaboracao_projetos_coordenador', 'Elaboração de projetos técnico-científicos para órgãos públicos, para a Universidade ou para organizações não-governamentais, devidamente comprovados por órgãos competentes (Coordenador)', 37, 'COORDENADOR', 'EVENTO', 30, NULL),
(174, 'elaboracao_projetos_subcoordenador', 'Elaboração de projetos técnico-científicos para órgãos públicos, para a Universidade ou para organizações não-governamentais, devidamente comprovados por órgãos competentes (Sub coordenador)', 37, 'SUBCOORDENADOR', 'EVENTO', 25, NULL),
(175, 'elaboracao_projetos_colaborador', 'Elaboração de projetos técnico-científicos para órgãos públicos, para a Universidade ou para organizações não-governamentais, devidamente comprovados por órgãos competentes (Colaborador)', 37, 'COLABORADOR', 'EVENTO', 15, NULL),
(176, 'consultoria', 'Consultor ad hoc para atividades diversas em órgãos públicos, organizações não governamentais, instituições privadas e na própria UNIFAL-MG: assessoria, consultoria, perícia, auditoria científica, técnica e/ou administrativa, na área de atuação docente', 38, NULL, 'EVENTO', 5, 20),
(177, 'representacao', 'Representante em conselhos, comitês, comissões ou afins, em órgãos públicos e outras instituições', 39, NULL, 'EVENTO', 5, 20),
(178, 'mencao_honrosa', 'Menção honrosa ou premiação atribuída a trabalho técnico-científico, descobertas comprovadas e similares', 40, NULL, 'EVENTO', 20, NULL),
(182, 'reitor', 'Reitor', 46, NULL, 'EVENTO', 100, NULL),
(183, 'vice_reitor', 'Vice-Reitor', 46, NULL, 'EVENTO', 80, NULL),
(184, 'pro_reitor', 'Pró-Reitor', 46, NULL, 'EVENTO', 40, NULL),
(185, 'pro_reitor_adjunto', 'Pró-Reitor Adjunto', 46, NULL, 'EVENTO', 20, NULL),
(186, 'diretor_campus', 'Diretor de Campus', 46, NULL, 'EVENTO', 30, NULL),
(187, 'vice_diretor_campus', 'Vice Diretor de Campus', 46, NULL, 'EVENTO', 15, NULL),
(188, 'diretor_faculdade', 'Diretor de Faculdade, Escola ou Instituto', 46, NULL, 'EVENTO', 30, NULL),
(189, 'vice_diretor_faculdade', 'Vice Diretor de Faculdade, Escola ou Instituto', 46, NULL, 'EVENTO', 15, NULL),
(190, 'chefe_departamento', 'Chefe de Departamento Acadêmico', 46, NULL, 'EVENTO', 30, NULL),
(191, 'vice_chefe_departamento', 'Vice Chefe de Departamento Acadêmico', 46, NULL, 'EVENTO', 15, NULL),
(192, 'chefe_laboratorios', 'Chefe de laboratórios e clínicas', 46, NULL, 'EVENTO', 30, NULL),
(193, 'coordenador_cursos', 'Coordenador de curso de graduação presencial e a distância', 46, NULL, 'EVENTO', 30, NULL),
(194, 'vice_coordenador_cursos', 'Vice Coordenador de curso de graduação presencial e a distância', 46, NULL, 'EVENTO', 15, NULL),
(195, 'coordenador_cead', 'Coordenador do CEAD – Centro de educação a distância', 46, NULL, 'EVENTO', 30, NULL),
(196, 'coordenador_adjunto_cead', 'Coordenador Adjunto do CEAD – Centro de educação a distância', 46, NULL, 'EVENTO', 15, NULL),
(197, 'coordenador_extensao', 'Coordenador de Projetos e Programas de Extensão, Coordenador de Cursos, Eventos e Prestações de Serviços, Coordenador de Cultura', 46, NULL, 'EVENTO', 15, NULL),
(198, 'coordenador_adjunto_extensao', 'Coordenador Adjunto de extensão', 46, NULL, 'EVENTO', 7.5, NULL),
(199, 'coordenador_latu', 'Coordenador de curso lato sensu', 46, NULL, 'EVENTO', 10, NULL),
(200, 'vice_coordenador_latu', 'Vice Coordenador de curso lato sensu', 46, NULL, 'EVENTO', 5, NULL),
(201, 'coordenador_stricto', 'Coordenador de curso stricto sensu', 46, NULL, 'EVENTO', 30, NULL),
(202, 'vice_coordenador_stricto', 'Vice Coordenador de curso stricto sensu', 46, NULL, 'EVENTO', 15, NULL),
(203, 'coordenador_pos', 'Coordenador de pós-graduação', 46, NULL, 'EVENTO', 30, NULL),
(204, 'membro_comissoes_presidente', 'Membro de comissões permanentes: Comitê de Ética em Pesquisa, Comissão de Ética no Uso de Animais, Comissão Permanente de Pessoal Docente, Comissão de Ética, Comissão Própria de Avaliação, Comissão Interna de Supervisão, Comissão Permanente de Prevenção e Controle de Riscos Químicos, Comissão Permanente de Vestibular, Núcleo Docente Estruturante (Presidente)', 41, 'PRESIDENTE', 'EVENTO', 15, NULL),
(205, 'membro_comissoes_vice_presidente', 'Membro de comissões permanentes: Comitê de Ética em Pesquisa, Comissão de Ética no Uso de Animais, Comissão Permanente de Pessoal Docente, Comissão de Ética, Comissão Própria de Avaliação, Comissão Interna de Supervisão, Comissão Permanente de Prevenção e Controle de Riscos Químicos, Comissão Permanente de Vestibular, Núcleo Docente Estruturante (Vice-Presidente)', 41, 'VICE_PRESIDENTE', 'EVENTO', 10, NULL),
(206, 'membro_comissoes_titular', 'Membro de comissões permanentes: Comitê de Ética em Pesquisa, Comissão de Ética no Uso de Animais, Comissão Permanente de Pessoal Docente, Comissão de Ética, Comissão Própria de Avaliação, Comissão Interna de Supervisão, Comissão Permanente de Prevenção e Controle de Riscos Químicos, Comissão Permanente de Vestibular, Núcleo Docente Estruturante (Membro Titular)', 41, 'TITULAR', 'EVENTO', 10, NULL),
(207, 'membro_comissoes_suplente', 'Membro de comissões permanentes: Comitê de Ética em Pesquisa, Comissão de Ética no Uso de Animais, Comissão Permanente de Pessoal Docente, Comissão de Ética, Comissão Própria de Avaliação, Comissão Interna de Supervisão, Comissão Permanente de Prevenção e Controle de Riscos Químicos, Comissão Permanente de Vestibular, Núcleo Docente Estruturante (Membro suplente com mínimo de 3 participações)', 41, 'SUPLENTE', 'EVENTO', 5, NULL),
(208, 'participacao_camaras_titular', 'Participação como membro de câmaras, Conselho Universitário, Conselho de Curadores, Conselho de Ensino, Pesquisa e Extensão, colegiado de cursos, congregação dos Institutos ou Faculdades (Membro Titular)', 42, 'TITULAR', 'EVENTO', 10, NULL),
(209, 'participacao_camaras_suplente', 'Participação como membro de câmaras, Conselho Universitário, Conselho de Curadores, Conselho de Ensino, Pesquisa e Extensão, colegiado de cursos, congregação dos Institutos ou Faculdades (Membro Suplente com mínimo de 3 participações)', 42, 'SUPLENTE', 'EVENTO', 5, NULL),
(210, 'participacao_portarias', 'Participação em atividades acadêmico-administrativas designadas por portarias (serão consideradas apenas as portarias cujas atividades não tenham sido contempladas nos itens', 43, NULL, 'EVENTO', 5, NULL),
(211, 'participacao_pad', 'Participação em Comissão de Sindicância ou de Comissão de Processo Administrativo Disciplinar', 44, NULL, 'EVENTO', 10, NULL),
(212, 'curso_estagio', 'Participação em curso ou estágio, na respectiva área de conhecimento ou de atuação docente, com carga horária inferior a 40 horas', 47, NULL, 'MULTIPLICADOR', 0.1, NULL),
(213, 'creditos_isolados', 'Obtenção de créditos isolados em disciplinas de cursos de graduação ou de pós-graduação', 47, NULL, 'MULTIPLICADOR', 0.2, NULL),
(214, 'participacao_prodoc', 'Participação em cursos de capacitação como o PRODOC e outros oferecidos pela UNIFAL-MG', 47, NULL, 'MULTIPLICADOR', 1, NULL),
(215, 'certificado_estagio', 'Obtenção de certificado de estágio, curso de atualização ou aperfeiçoamento, na respectiva área de conhecimento ou de atuação docente, com carga horária igual ou superior a 40 horas', 47, NULL, 'EVENTO', 5, NULL),
(216, 'certificado_especialista', 'Obtenção de certificado de especialista', 47, NULL, 'EVENTO', 120, NULL),
(217, 'titulo_mestre', 'Obtenção do título de mestre', 47, NULL, 'EVENTO', 300, NULL),
(218, 'titulo_doutor', 'Obtenção do título de doutor', 47, NULL, 'EVENTO', 600, NULL),
(219, 'estagio_pos_doutorado', 'Estágio de Pós-Doutorado concluído', 47, NULL, 'EXISTENCIA', 150, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `nucleos`
--

CREATE TABLE `nucleos` (
  `id` int(11) NOT NULL,
  `nucleo` varchar(300) NOT NULL,
  `abrev` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `nucleos`
--

INSERT INTO `nucleos` (`id`, `nucleo`, `abrev`) VALUES
(1, 'Engenharia Ambiental', 'EA'),
(2, 'Geologia e Mineração', 'GEOMIN'),
(3, 'Engenharia Química', 'EQ'),
(4, 'Engenharia de Produção', 'EP'),
(5, 'Física', 'FIS'),
(6, 'Humanidades e Empreendedorismo', 'HUMAN'),
(7, 'Matemática, Computação e Estatística', 'MATCOMPE'),
(8, 'Química', 'QUIM'),
(9, 'Engenharia Civil', 'EC');

-- --------------------------------------------------------

--
-- Estrutura da tabela `records`
--

CREATE TABLE `records` (
  `id` int(11) NOT NULL,
  `ridId` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `value` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rids`
--

CREATE TABLE `rids` (
  `id` int(11) NOT NULL,
  `docente` int(11) NOT NULL,
  `ano` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Estrutura da tabela `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL,
  `orderNum` int(11) NOT NULL,
  `parentCategory` enum('ENSINO','PESQUISA','EXTENSAO','ADMINISTRATIVA','CAPACITACAO') NOT NULL,
  `subcategoria` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `subcategories`
--

INSERT INTO `subcategories` (`id`, `orderNum`, `parentCategory`, `subcategoria`) VALUES
(1, 1, 'ENSINO', 'Aulas ministradas'),
(2, 2, 'ENSINO', 'Orientação'),
(3, 3, 'ENSINO', 'PIEPEX – Programa Integrado de Ensino, Pesquisa e Extensão'),
(4, 4, 'ENSINO', 'Programa Tutorial Acadêmico - PTA'),
(5, 5, 'ENSINO', 'Programa Institucional de Bolsa de Iniciação à Docência - PIBID'),
(6, 6, 'PESQUISA', 'Participação em congressos, simpósios, seminários e demais eventos técnico-científicos'),
(7, 7, 'PESQUISA', 'Palestrante, ministrante de curso, debatedor ou moderador em eventos técnico-científicos'),
(8, 8, 'PESQUISA', 'Apresentação oral de trabalho em eventos técnico-científicos'),
(9, 9, 'PESQUISA', 'Apresentação de trabalho na forma de pôster em eventos técnico-científicos'),
(10, 10, 'PESQUISA', 'Publicação de artigo completo ou resumo expandido em anais (impresso/eletrônico) de eventos técnico-científicos'),
(11, 11, 'PESQUISA', 'Publicação de resumo em anais (impresso/eletrônico) de eventos técnico-científicos'),
(12, 12, 'PESQUISA', 'Publicação de artigo, texto ou ensaio em revista (impressa/eletrônica) com corpo editorial'),
(13, 13, 'PESQUISA', 'Publicação de resenha, resumo expandido, comunicação ou editorial em revista (impressa/eletrônica) com corpo editorial'),
(14, 14, 'PESQUISA', 'Publicação de resumo em revista(impressa/eletrônica) com corpo editorial'),
(15, 15, 'PESQUISA', 'Publicação de imagens e textos em catálogos de exposições e/ou eventos da área de artes visuais, artes cênicas, cinema, música e dança'),
(16, 16, 'PESQUISA', 'Publicação de imagens e textos em programas e outras peças gráficas de exposições e/ou eventos da área de artes visuais, artes cênicas, cinema, música e dança'),
(17, 17, 'PESQUISA', 'Apresentação de produções artísticas, individuais e coletivas em exposições e/ou eventos da área de artes visuais, artes cênicas, cinema, música e dança'),
(18, 18, 'PESQUISA', 'Publicação de ensaios, imagens, artigos e resenhas em jornais de resenhas e suplementos artísticos e literários'),
(19, 19, 'PESQUISA', 'Projetos curatoriais para exposições e/ou eventos de artes visuais, artes cênicas, cinema, música e dança'),
(20, 20, 'PESQUISA', 'Projetos de Pesquisa'),
(21, 21, 'PESQUISA', 'Grupos de Pesquisa cadastrados no Diretório de Grupos de Pesquisa do CNPq'),
(22, 23, 'PESQUISA', 'Membro do corpo editorial de periódico (impresso/eletrônico) indexado'),
(23, 24, 'PESQUISA', 'Membro do corpo editorial de periódico (impresso/eletrônico) não indexado'),
(24, 25, 'PESQUISA', 'Avaliador ou consultor ad hoc de artigo científico para periódico (impresso/eletrônico) com corpo editorial'),
(25, 26, 'PESQUISA', 'Avaliador ou consultor ad hoc de artigo científico para periódico (impresso/eletrônico) não indexado'),
(26, 27, 'PESQUISA', 'Avaliador ad hoc de projetos de pesquisa e extensão registrados nas Pró-Reitorias da UNIFAL-MG ou outras Instituições de Ensino Superior'),
(27, 28, 'PESQUISA', 'Avaliador ad hoc de projetos, resumos ou trabalhos para apresentação em eventos técnico-científicos'),
(28, 29, 'PESQUISA', 'Participação em bancas examinadoras'),
(29, 30, 'PESQUISA', 'Organização de eventos técnico-científicos comprovados pela Pró-Reitoria de Extensão, Pesquisa e Pós-Graduação, Sociedade Científica ou Profissional'),
(30, 31, 'PESQUISA', 'Projetos e desenvolvimento de propriedade intelectual e/ou industrial, de interesse da instituição, devidamente documentados ou registrados por órgãos competentes'),
(31, 32, 'EXTENSAO', 'Participação em programa e/ou projeto de extensão aprovado por agência de fomento ou Instituição de Ensino Superior'),
(32, 33, 'EXTENSAO', 'Participação em programa e/ou projeto de extensão sem recursos de agência de fomento ou Instituição de Ensino Superior'),
(33, 34, 'EXTENSAO', 'Coordenador de cursos, eventos e serviços de extensão'),
(34, 35, 'EXTENSAO', 'Participação em atividades de assistência à saúde, família ou sociedade'),
(35, 36, 'EXTENSAO', 'Atividades que caracterizem disseminação de conhecimento técnico científico'),
(36, 37, 'EXTENSAO', 'Reportagem com abordagem de assuntos relativos à área de atuação docente'),
(37, 38, 'EXTENSAO', 'Elaboração de projetos técnico-científicos para órgãos públicos, para a Universidade ou para organizações não-governamentais, devidamente comprovados por órgãos competentes'),
(38, 39, 'EXTENSAO', 'Consultoria'),
(39, 40, 'EXTENSAO', 'Representação'),
(40, 41, 'EXTENSAO', 'Menção honrosa ou premiação'),
(41, 43, 'ADMINISTRATIVA', 'Membro de comissões permanentes: Comitê de Ética em Pesquisa, Comissão de Ética no Uso de Animais, Comissão Permanente de Pessoal Docente, Comissão de Ética, Comissão Própria de Avaliação, Comissão Interna de Supervisão, Comissão Permanente de Prevenção e Controle de Riscos Químicos, Comissão Permanente de Vestibular, Núcleo Docente Estruturante'),
(42, 44, 'ADMINISTRATIVA', 'Participação como membro de câmaras, Conselho Universitário, Conselho de Curadores, Conselho de Ensino, Pesquisa e Extensão, colegiado de cursos, congregação dos Institutos ou Faculdades'),
(43, 45, 'ADMINISTRATIVA', 'Participação em atividades acadêmico-administrativas designadas por portarias'),
(44, 46, 'ADMINISTRATIVA', 'Participação em Comissão de Sindicância ou de Comissão de Processo Administrativo Disciplinar'),
(45, 22, 'PESQUISA', 'Livros'),
(46, 42, 'ADMINISTRATIVA', 'Atividades Administrativas'),
(47, 48, 'CAPACITACAO', 'Capacitação Docente');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `alocacoes`
--
ALTER TABLE `alocacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `docente` (`docente`),
  ADD KEY `nucleo` (`nucleo`);

--
-- Índices para tabela `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcategoria` (`subcategoria`);

--
-- Índices para tabela `nucleos`
--
ALTER TABLE `nucleos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ridId` (`ridId`),
  ADD KEY `item` (`item`);

--
-- Índices para tabela `rids`
--
ALTER TABLE `rids`
  ADD PRIMARY KEY (`id`),
  ADD KEY `docente` (`docente`);

--
-- Índices para tabela `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alocacoes`
--
ALTER TABLE `alocacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `docente`
--
ALTER TABLE `docente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

--
-- AUTO_INCREMENT de tabela `nucleos`
--
ALTER TABLE `nucleos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `records`
--
ALTER TABLE `records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `rids`
--
ALTER TABLE `rids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100092;

--
-- AUTO_INCREMENT de tabela `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `alocacoes`
--
ALTER TABLE `alocacoes`
  ADD CONSTRAINT `alocacoes_ibfk_1` FOREIGN KEY (`docente`) REFERENCES `docente` (`id`),
  ADD CONSTRAINT `alocacoes_ibfk_2` FOREIGN KEY (`nucleo`) REFERENCES `nucleos` (`id`);

--
-- Limitadores para a tabela `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`subcategoria`) REFERENCES `subcategories` (`id`);

--
-- Limitadores para a tabela `records`
--
ALTER TABLE `records`
  ADD CONSTRAINT `records_ibfk_1` FOREIGN KEY (`ridId`) REFERENCES `rids` (`id`),
  ADD CONSTRAINT `records_ibfk_2` FOREIGN KEY (`item`) REFERENCES `items` (`id`);

--
-- Limitadores para a tabela `rids`
--
ALTER TABLE `rids`
  ADD CONSTRAINT `rids_ibfk_1` FOREIGN KEY (`docente`) REFERENCES `docente` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
