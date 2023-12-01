-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 30-11-2023 a las 16:42:43
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Viajes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `destino_id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(255) NOT NULL,
  `comentario` text NOT NULL,
  `fecha_comentario` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destinos`
--

CREATE TABLE `destinos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`descripcion`)),
  `imagen` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`imagen`)),
  `precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `destinos`
--

INSERT INTO `destinos` (`id`, `nombre`, `descripcion`, `imagen`, `precio`) VALUES
(17, 'Barcelona', '{\r\n        \"Header\": \r\n            [\"Descubre la magia de Barcelona\",\"Arquitectura Impresionante\",\"Cultura y Arte en cada rincón\"], \r\n        \"Text\": \r\n            [\"Bienvenido a Barcelona, la joya mediterránea de España que cautiva a viajeros con su mezcla única de arquitectura deslumbrante, cultura vibrante y playas bañadas por el sol. Esta ciudad cosmopolita es una fusión de pasado y presente, donde las callejuelas estrechas del Barrio Gótico y los modernos rascacielos se entrelazan en una danza armoniosa.\",\"Barcelona es famosa por su arquitectura innovadora, encabezada por las obras maestras de Antoni Gaudí. La Sagrada Familia, una catedral en constante evolución, te dejará boquiabierto con sus intrincados detalles y su majestuosidad sin igual. Pasea por el Parque Güell y siente cómo te envuelve la creatividad de Gaudí en cada esquina.\", \"Sumérgete en la rica cultura catalana explorando los museos de renombre mundial como el Museo Picasso y el Museo Nacional de Arte de Cataluña. Las calles están impregnadas de arte callejero vibrante y el ambiente artístico es palpable en cada esquina.\"]\r\n    }', '[\"barcelona.jpg\", \"barcelona1.jpg\", \"barcelona2.jpg\"]', 90.60),
(18, 'Budapest', '{\r\n        \"Header\" :\r\n         [\"Descubre la magia de Budapest\",\"Arquitectura Impresionante\",\"Cultura y Arte en cada rincón\"],\r\n          \"Text\": [\"Bienvenido a Budapest, la joya mediterránea de España que cautiva a viajeros con su mezcla única de arquitectura deslumbrante, cultura vibrante y playas bañadas por el sol. Esta ciudad cosmopolita es una fusión de pasado y presente, donde las callejuelas estrechas del Barrio Gótico y los modernos rascacielos se entrelazan en una danza armoniosa.\",\"Budapest es famosa por su arquitectura innovadora, encabezada por las obras maestras de Antoni Gaudí. La Sagrada Familia, una catedral en constante evolución, te dejará boquiabierto con sus intrincados detalles y su majestuosidad sin igual. Pasea por el Parque Güell y siente cómo te envuelve la creatividad de Gaudí en cada esquina.\", \"Sumérgete en la rica cultura catalana explorando los museos de renombre mundial como el Museo Picasso y el Museo Nacional de Arte de Cataluña. Las calles están impregnadas de arte callejero vibrante y el ambiente artístico es palpable en cada esquina.\"]\r\n    }', '[\"budapest.jpg\", \"budapest1.jpg\", \"budapest2.jpg\"]', 105.79),
(19, 'Londres', '{\r\n        \"Header\" :\r\n         [\"Descubre la Esencia de Londres\",\"Patrimonio Arquitectónico Emblemático\",\"La Diversidad que Define la Ciudad\"],\r\n          \"Text\": [\"Bienvenido a Londres, la capital del Reino Unido y una de las ciudades más fascinantes del mundo. Esta metrópolis multicultural te seducirá con su rica historia, impresionante arquitectura y una energía vibrante que la convierte en un lugar único.\",\"Londres es un crisol de estilos arquitectónicos que van desde la majestuosidad de la Torre de Londres hasta la modernidad de la Torre Shard. Pasea por el Palacio de Buckingham y maravíllate con su elegancia real, o adéntrate en el pasado en el imponente Museo Británico. La silueta de la ciudad está marcada por la fusión de lo antiguo y lo contemporáneo.\", \"Londres es un crisol de culturas y etnias que se refleja en su cocina, su música y su ambiente. Desde los mercados callejeros de Camden hasta los restaurantes de renombre internacional en Covent Garden, la oferta gastronómica es tan variada como los propios londinenses. Sumérgete en la rica mezcla de influencias que hacen de esta ciudad un lugar verdaderamente cosmopolita.\"]\r\n    }', '[\"londres.jpg\", \"londres1.jpg\", \"londres2.jpg\"]', 97.65),
(20, 'Ibiza', '{\r\n        \"Header\" :\r\n         [\"Explora el Encanto de Ibiza\",\"Playas Paradisíacas y Atardeceres Inolvidables\",\"Vida Nocturna en Constante Ebullición\"],\r\n          \"Text\": [\"¡Bienvenido a Ibiza, la isla balear que te invita a vivir una experiencia única en el Mediterráneo! Con su mezcla de playas idílicas, vida nocturna vibrante y paisajes naturales impresionantes, Ibiza es un destino que cautiva a todos los que la visitan.\",\"Ibiza es famosa por sus playas de aguas cristalinas y arenas blancas. Desde la animada playa de Bora Bora hasta las calas tranquilas como Cala Conta, cada rincón de la costa te invita a relajarte y disfrutar del sol mediterráneo. No te pierdas los mágicos atardeceres en lugares como Café del Mar, donde el cielo se tiñe de tonos cálidos y la música crea una atmósfera única.\", \"Ibiza es conocida como la capital mundial de la música electrónica y su vida nocturna es legendaria. Los clubes como Pacha, Amnesia y Ushuaïa atraen a DJs de renombre internacional y crean una experiencia única en la pista de baile. Las fiestas en la playa y los eventos exclusivos te sumergen en un ambiente de energía contagiosa que hace que la noche se convierta en una experiencia inolvidable.\"]\r\n    }', '[\"ibiza.jpg\", \"ibiza1.jpg\", \"ibiza2.jpg\"]', 65.99),
(21, 'Milán', '{\r\n        \"Header\" :\r\n         [\"Descubre el Encanto de Milán\",\"Diseño y Moda en Cada Rincón\",\"Gastronomía y Experiencias Culinarias\"],\r\n          \"Text\": [\"¡Bienvenido a Milán, la capital de la moda y el diseño en Italia! Esta ciudad cosmopolita te cautivará con su combinación de historia impresionante, alta cultura y una vibrante escena contemporánea.\",\"Milán es conocida en todo el mundo como el epicentro de la moda y el diseño. Desde las boutiques de alta costura en Quadrilatero della Moda hasta los innovadores espacios de diseño en Zona Tortona, la ciudad respira creatividad y estilo. Explora el Museo del Diseño Triennale y descubre la evolución del diseño italiano a lo largo de los años.\", \"La cocina milanesa es una delicia para los amantes de la buena comida. Prueba el famoso risotto alla milanese, disfruta de un auténtico cotoletta alla milanese o date un capricho con un cannoli relleno de crema pastelera. Los mercados locales como el Mercado de la Vía Fauche ofrecen una amplia variedad de productos frescos y delicias culinarias.\"]\r\n    }', '[\"milan.jpg\", \"milan1.jpg\", \"milan2.jpg\"]', 108.99),
(22, 'París', '{\r\n        \"Header\" :\r\n         [\"Piérdete por las calles de París\",\"Iconos Culturales y Arquitectura Emblemática\",\"Jardines y Espacios Verdes Encantadores\"],\r\n          \"Text\": [\"¡Bienvenido a París, la Ciudad de la Luz y la capital del amor! Esta ciudad icónica te seducirá con su rica historia, arte impresionante y una elegancia atemporal que la convierte en un destino verdaderamente inolvidable.\",\"París es el hogar de algunos de los monumentos más reconocidos en el mundo. Desde la majestuosidad de la Torre Eiffel hasta la imponente Catedral de Notre-Dame, cada rincón de la ciudad respira historia y esplendor arquitectónico. Pasea por los encantadores bulevares parisinos y descubre la perfecta combinación de lo antiguo y lo moderno.\", \"París también es conocida por sus hermosos jardines y parques, como los Jardines de Luxemburgo y el Parque de Buttes-Chaumont. Estos oasis urbanos ofrecen un refugio de tranquilidad en medio de la ciudad, perfectos para relajarse y disfrutar de la naturaleza.\"]\r\n    }', '[\"paris.jpg\", \"paris1.jpg\", \"paris2.jpg\"]', 132.75);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id` int(11) NOT NULL,
  `destino_id` int(11) DEFAULT NULL,
  `nombre_cliente` varchar(255) NOT NULL,
  `primer_apll` varchar(255) NOT NULL,
  `segundo_apll` varchar(255) NOT NULL,
  `correo_cliente` varchar(255) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE `Usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `contraseña` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `destino_id` (`destino_id`),
  ADD KEY `constraint_user` (`id_usuario`);

--
-- Indices de la tabla `destinos`
--
ALTER TABLE `destinos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `destino_id` (`destino_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `CONSTRAINT_EMAIL` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `destinos`
--
ALTER TABLE `destinos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`destino_id`) REFERENCES `destinos` (`id`),
  ADD CONSTRAINT `constraint_user` FOREIGN KEY (`id_usuario`) REFERENCES `Usuarios` (`id`);

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`destino_id`) REFERENCES `destinos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
