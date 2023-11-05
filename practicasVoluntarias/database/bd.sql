-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 05-11-2023 a las 20:18:04
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
  `destino_id` int(11) DEFAULT NULL,
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
(1, 'Barcelona', '{\"Header\": [\"Descubre la magia de Barcelona\",\"Arquitectura Impresionante\",\"Cultura y Arte en cada rincón\"], \"Text\": [\"Bienvenido a Barcelona, la joya mediterránea de España que cautiva a viajeros con su mezcla única de arquitectura deslumbrante, cultura vibrante y playas bañadas por el sol. Esta ciudad cosmopolita es una fusión de pasado y presente, donde las callejuelas estrechas del Barrio Gótico y los modernos rascacielos se entrelazan en una danza armoniosa.\",\"Barcelona es famosa por su arquitectura innovadora, encabezada por las obras maestras de Antoni Gaudí. La Sagrada Familia, una catedral en constante evolución, te dejará boquiabierto con sus intrincados detalles y su majestuosidad sin igual. Pasea por el Parque Güell y siente cómo te envuelve la creatividad de Gaudí en cada esquina.\", \"Sumérgete en la rica cultura catalana explorando los museos de renombre mundial como el Museo Picasso y el Museo Nacional de Arte de Cataluña. Las calles están impregnadas de arte callejero vibrante y el ambiente artístico es palpable en cada esquina.\"]}', '[\"barcelona.jpg\", \"barcelona1.jpg\", \"barcelona2.jpg\"]', 90.60),
(3, 'Budapest', '{\"Header\" : [\"Descubre la magia de Budapest arcelona\",\"Arquitectura Impresionante\",\"Cultura y Arte en cada rincón\"], \"Text\": [\"Bienvenido a Budapest, la joya mediterránea de España que cautiva a viajeros con su mezcla única de arquitectura deslumbrante, cultura vibrante y playas bañadas por el sol. Esta ciudad cosmopolita es una fusión de pasado y presente, donde las callejuelas estrechas del Barrio Gótico y los modernos rascacielos se entrelazan en una danza armoniosa.\",\"Budapest es famosa por su arquitectura innovadora, encabezada por las obras maestras de Antoni Gaudí. La Sagrada Familia, una catedral en constante evolución, te dejará boquiabierto con sus intrincados detalles y su majestuosidad sin igual. Pasea por el Parque Güell y siente cómo te envuelve la creatividad de Gaudí en cada esquina.\", \"Sumérgete en la rica cultura catalana explorando los museos de renombre mundial como el Museo Picasso y el Museo Nacional de Arte de Cataluña. Las calles están impregnadas de arte callejero vibrante y el ambiente artístico es palpable en cada esquina.\"]}', '[\"budapest.jpg\", \"budapest1.jpg\", \"budapest2.jpg\"]', 105.79);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id` int(11) NOT NULL,
  `destino_id` int(11) DEFAULT NULL,
  `nombre_cliente` varchar(255) NOT NULL,
  `correo_cliente` varchar(255) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `destino_id` (`destino_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`destino_id`) REFERENCES `destinos` (`id`);

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`destino_id`) REFERENCES `destinos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
