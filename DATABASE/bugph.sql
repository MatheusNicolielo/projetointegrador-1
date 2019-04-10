# Host: localhost  (Version 5.5.5-10.1.30-MariaDB)
# Date: 2019-04-10 19:57:24
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "usuarios"
#

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) DEFAULT '',
  `senha` varchar(255) NOT NULL DEFAULT '',
  `ultimo_login` varchar(255) NOT NULL DEFAULT '',
  `datahora` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `token` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "usuarios"
#


#
# Structure for table "posts"
#

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `datahora` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `fk_usuario_post` (`id_usuario`),
  CONSTRAINT `fk_usuario_post` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "posts"
#


#
# Structure for table "comentarios"
#

DROP TABLE IF EXISTS `comentarios`;
CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `id_post` int(11) DEFAULT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  `datahora` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `fk_usuario_comment` (`id_usuario`),
  KEY `fk_post_comment` (`id_post`),
  CONSTRAINT `fk_post_comment` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id`),
  CONSTRAINT `fk_usuario_comment` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "comentarios"
#


#
# Structure for table "curtidas"
#

DROP TABLE IF EXISTS `curtidas`;
CREATE TABLE `curtidas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `id_post` int(11) DEFAULT NULL,
  `datahora` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_like` (`id_usuario`),
  KEY `fk_post_like` (`id_post`),
  CONSTRAINT `fk_post_like` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id`),
  CONSTRAINT `fk_usuario_like` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "curtidas"
#


#
# Structure for table "logs"
#

DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL DEFAULT '0',
  `log` varchar(255) DEFAULT '',
  `datahora` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `FK_USUARIO` (`id_usuario`),
  CONSTRAINT `FK_USUARIO` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "logs"
#

