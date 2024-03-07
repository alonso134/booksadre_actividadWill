-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-03-2024 a las 02:50:38
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `booksadre`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarAdministrador` (IN `p_id_administrador` INT, IN `p_nombre_administrador` VARCHAR(50), IN `p_apellido_administrador` VARCHAR(50), IN `p_correo_administrador` VARCHAR(100), IN `p_clave_administrador` VARCHAR(100))   BEGIN
  INSERT INTO administrador (id_administrador, nombre_administrador, apellido_administrador, correo_administrador, clave_administrador)
  VALUES (p_id_administrador, p_nombre_administrador, p_apellido_administrador, p_correo_administrador, p_clave_administrador);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarCategoria` (IN `p_id_categoria` INT, IN `p_nombre_categoria` VARCHAR(50), IN `p_descripcion_categoria` VARCHAR(250), IN `p_imagen_categoria` VARCHAR(25))   BEGIN
  INSERT INTO categoria (id_categoria, nombre_categoria, descripcion_categoria, imagen_categoria)
  VALUES (p_id_categoria, p_nombre_categoria, p_descripcion_categoria, p_imagen_categoria);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarCliente` (IN `p_id_cliente` INT, IN `p_nombre_cliente` VARCHAR(50), IN `p_apellido_cliente` VARCHAR(50), IN `p_genero_cliente` ENUM('masculino','femenino','otro'), IN `p_correo_cliente` VARCHAR(100), IN `p_telefono_cliente` VARCHAR(9), IN `p_fecha_nacimiento` DATE, IN `p_pais_cliente` VARCHAR(250), IN `p_clave_cliente` VARCHAR(100), IN `p_estado_cliente` TINYINT, IN `p_fecha_registro` DATE)   BEGIN
  INSERT INTO cliente (id_cliente, nombre_cliente, apellido_cliente, genero_cliente, correo_cliente, telefono_cliente, fecha_nacimiento, pais_cliente, clave_cliente, estado_cliente, fecha_registro)
  VALUES (p_id_cliente, p_nombre_cliente, p_apellido_cliente, p_genero_cliente, p_correo_cliente, p_telefono_cliente, p_fecha_nacimiento, p_pais_cliente, p_clave_cliente, p_estado_cliente, p_fecha_registro);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarDetallePedido` (IN `p_id_detalle` INT, IN `p_id_pedido` INT, IN `p_id_producto` INT, IN `p_cantidad_producto` INT, IN `p_precio_producto` DECIMAL(5,2), IN `p_subtotal` DECIMAL(5,2))   BEGIN
  INSERT INTO detalle_pedido (id_detalle, id_pedido, id_producto, cantidad_producto, precio_producto, subtotal)
  VALUES (p_id_detalle, p_id_pedido, p_id_producto, p_cantidad_producto, p_precio_producto, p_subtotal);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPedido` (IN `p_id_pedido` INT, IN `p_id_cliente` INT, IN `p_estado_pedido` ENUM('pendiente','en_proceso','entregado'), IN `p_fecha_registro` DATETIME, IN `p_direccion_pedido` VARCHAR(250))   BEGIN
  INSERT INTO pedido (id_pedido, id_cliente, estado_pedido, fecha_registro, direccion_pedido)
  VALUES (p_id_pedido, p_id_cliente, p_estado_pedido, p_fecha_registro, p_direccion_pedido);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarProducto` (IN `p_id_producto` INT, IN `p_id_categoria` INT, IN `p_nombre_producto` VARCHAR(50), IN `p_descripcion_producto` VARCHAR(250), IN `p_precio_producto` DECIMAL(5,2), IN `p_imagen_producto` VARCHAR(25), IN `p_estado_producto` TINYINT, IN `p_id_administrador` INT, IN `p_existencias_producto` INT, IN `p_fecha_registro` DATE)   BEGIN
  INSERT INTO producto (id_producto, id_categoria, nombre_producto, descripcion_producto, precio_producto, imagen_producto, estado_producto, id_administrador, existencias_producto, fecha_registro)
  VALUES (p_id_producto, p_id_categoria, p_nombre_producto, p_descripcion_producto, p_precio_producto, p_imagen_producto, p_estado_producto, p_id_administrador, p_existencias_producto, p_fecha_registro);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarResena` (IN `p_id_resena` INT, IN `p_id_detalle` INT, IN `p_calificacion_producto` INT, IN `p_comentario_producto` VARCHAR(250), IN `p_fecha_valoracion` DATE, IN `p_estado_comentario` TINYINT)   BEGIN
  INSERT INTO reseña (id_resena, id_detalle, calificacion_producto, comentario_producto, fecha_valoracion, estado_comentario)
  VALUES (p_id_resena, p_id_detalle, p_calificacion_producto, p_comentario_producto, p_fecha_valoracion, p_estado_comentario);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id_administrador` int(11) NOT NULL,
  `nombre_administrador` varchar(50) DEFAULT NULL,
  `apellido_administrador` varchar(50) DEFAULT NULL,
  `correo_administrador` varchar(100) DEFAULT NULL,
  `clave_administrador` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id_administrador`, `nombre_administrador`, `apellido_administrador`, `correo_administrador`, `clave_administrador`) VALUES
(1, 'Ana', 'García', 'ana.garcia@example.com', 'claveana'),
(2, 'Luis', 'Martínez', 'luis.martinez@example.com', 'claveluis'),
(3, 'María', 'Rodríguez', 'maria.rodriguez@example.com', 'clavemaria'),
(4, 'Carlos', 'Sánchez', 'carlos.sanchez@example.com', 'clavecarlos'),
(5, 'Laura', 'Gómez', 'laura.gomez@example.com', 'clavelaura'),
(6, 'Isabel', 'Hernández', 'isabel.hernandez@example.com', 'claveisabel'),
(7, 'Alejandro', 'Pérez', 'alejandro.perez@example.com', 'clavealejandro'),
(8, 'Carmen', 'López', 'carmen.lopez@example.com', 'carmenclave'),
(9, 'Javier', 'Ruiz', 'javier.ruiz@example.com', 'clavejavier'),
(10, 'Patricia', 'Díaz', 'patricia.diaz@example.com', 'clavepatricia'),
(11, 'Sergio', 'González', 'sergio.gonzalez@example.com', 'clavesergio'),
(12, 'Raquel', 'Molina', 'raquel.molina@example.com', 'claveraquel'),
(13, 'Andrés', 'Cabrera', 'andres.cabrera@example.com', 'claveandres'),
(14, 'Silvia', 'Ortega', 'silvia.ortega@example.com', 'clavesilvia'),
(15, 'Francisco', 'Reyes', 'francisco.reyes@example.com', 'clavefrancisco'),
(16, 'Elena', 'Jiménez', 'elena.jimenez@example.com', 'claveelena'),
(17, 'Roberto', 'Herrera', 'roberto.herrera@example.com', 'claveroberto'),
(18, 'Natalia', 'Soto', 'natalia.soto@example.com', 'clavenatalia'),
(19, 'Juan', 'Vargas', 'juan.vargas@example.com', 'clavejuan'),
(20, 'Rosa', 'Ramírez', 'rosa.ramirez@example.com', 'claverosa'),
(21, 'Gabriel', 'Luna', 'gabriel.luna@example.com', 'clavegabriel'),
(22, 'Victoria', 'Martínez', 'victoria.martinez@example.com', 'clavevictoria'),
(23, 'Hugo', 'Gómez', 'hugo.gomez@example.com', 'clavehugo'),
(24, 'Lucía', 'Díaz', 'lucia.diaz@example.com', 'clavelucia'),
(25, 'Diego', 'Rojas', 'diego.rojas@example.com', 'clavediego');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(50) DEFAULT NULL,
  `descripcion_categoria` varchar(250) DEFAULT NULL,
  `imagen_categoria` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre_categoria`, `descripcion_categoria`, `imagen_categoria`) VALUES
(1, 'Cuadernos', 'Cuadernos para apuntes y tareas escolares', 'cuadernos.jpg'),
(2, 'Lápices', 'Lápices de colores y lápices HB para escribir', 'lapices.jpg'),
(3, 'Mochilas', 'Mochilas resistentes y espaciosas para transportar libros y materiales escolares', 'mochilas.jpg'),
(4, 'Calculadoras ', 'Calculadoras científicas para ciencias', 'calculadoras.jpg'),
(5, 'Estuches', 'Estuches para organizar lápices, bolígrafos y otros útiles', 'estuches.jpg'),
(6, 'Gomas de borrar', 'Gomas de borrar de diferentes tipos y tamaños', 'gomas.jpg'),
(7, 'Reglas y escuadras', 'Reglas y escuadras para medir y trazar líneas', 'reglas.jpg'),
(8, 'Cajas de lápices de colores', 'Cajas con lápices de colores de calidad', 'lapicescolores.jpg'),
(9, 'Papel y blocs', 'Papel y blocs de notas para escribir y dibujar', 'papel.jpg'),
(10, 'Bolígrafos', 'Bolígrafos de tinta gel y tinta líquida', 'boligrafos.jpg'),
(11, 'Borradores', 'Borradores para lápices y bolígrafos', 'borradores.jpg'),
(12, 'Carpetas y archivadores', 'Carpetas y archivadores para organizar documentos', 'carpetas.jpg'),
(13, 'Notas adhesivas', 'Notas adhesivas y marcapáginas para resaltar información', 'notasadhesivas.jpg'),
(14, 'Tijeras', 'Tijeras para cortar papel y materiales ligeros', 'tijeras.jpg'),
(15, 'Pegamento', 'Pegamento en barra y líquido para proyectos escolares', 'pegamento.jpg'),
(16, 'Lápices mecánicos', 'Lápices mecánicos para escribir y dibujar con precisión', 'lapicesmecanicos.jpg'),
(17, 'Sellos y almohadillas de tinta', 'Sellos y almohadillas de tinta para marcar documentos', 'sellos.jpg'),
(18, 'Cintas adhesivas', 'Cintas adhesivas para unir y reparar documentos', 'cintasadhesivas.jpg'),
(19, 'Pinceles y acuarelas', 'Pinceles y acuarelas para actividades artísticas', 'pinceles.jpg'),
(20, 'Agendas y planners', 'Agendas y planners para organizar tareas y fechas importantes', 'agendas.jpg'),
(21, 'Lápices mecánicos', 'Lápices mecánicos para escribir y dibujar con precisión', 'lapicesmecanicos.jpg'),
(22, 'Archivadores de documentos', 'Archivadores de documentos para mantener el espacio organizado', 'archivadores.jpg'),
(23, 'Portaminas', 'Portaminas para escritura y dibujo técnico', 'portaminas.jpg'),
(24, 'Calculadoras básicas', 'Calculadoras básicas para tareas escolares', 'calculadorasbasicas.jpg'),
(25, 'Libros de referencia', 'Libros de consulta y referencia para diferentes materias', 'librosreferencia.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre_cliente` varchar(50) DEFAULT NULL,
  `apellido_cliente` varchar(50) DEFAULT NULL,
  `genero_cliente` enum('masculino','femenino','otro') DEFAULT NULL,
  `correo_cliente` varchar(100) DEFAULT NULL,
  `telefono_cliente` varchar(9) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `pais_cliente` varchar(250) DEFAULT NULL,
  `clave_cliente` varchar(100) DEFAULT NULL,
  `estado_cliente` tinyint(1) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre_cliente`, `apellido_cliente`, `genero_cliente`, `correo_cliente`, `telefono_cliente`, `fecha_nacimiento`, `pais_cliente`, `clave_cliente`, `estado_cliente`, `fecha_registro`) VALUES
(1, 'Ana', 'López', 'femenino', 'ana.lopez@email.com', '555123456', '1985-07-15', 'México', 'claveana', 1, '2024-01-01'),
(2, 'Carlos', 'Gómez', 'masculino', 'carlos.gomez@email.com', '555987654', '1992-03-22', 'España', 'clavecarlos', 1, '2024-02-01'),
(3, 'Sandra', 'Martínez', 'femenino', 'sandra.martinez@email.com', '555333444', '1990-09-05', 'Colombia', 'clavesandra', 1, '2024-03-02'),
(4, 'Diego', 'Ramírez', 'masculino', 'diego.ramirez@email.com', '555666777', '1987-12-18', 'Chile', 'clavediego', 1, '2024-03-03'),
(5, 'Isabel', 'Hernández', 'femenino', 'isabel.hernandez@email.com', '555444555', '1995-04-30', 'Perú', 'claveisabel', 1, '2024-03-04'),
(6, 'Javier', 'Gutiérrez', 'masculino', 'javier.gutierrez@email.com', '555777888', '1980-06-25', 'Uruguay', 'clavejavier', 1, '2024-03-05'),
(7, 'Valeria', 'López', 'femenino', 'valeria.lopez@email.com', '555111222', '1993-08-12', 'Venezuela', 'clavevaleria', 1, '2024-03-06'),
(8, 'Martín', 'Pérez', 'masculino', 'martin.perez@email.com', '555999000', '1984-02-08', 'Ecuador', 'clavemartin', 1, '2024-03-07'),
(9, 'Natalia', 'Sánchez', 'femenino', 'natalia.sanchez@email.com', '555222333', '1997-01-20', 'Paraguay', 'clavenatalia', 1, '2024-03-08'),
(10, 'Alejandro', 'Suárez', 'masculino', 'alejandro.suarez@email.com', '555555000', '1989-07-04', 'Bolivia', 'clavealejandro', 1, '2024-03-09'),
(11, 'María', 'Ortega', 'femenino', 'maria.ortega@email.com', '555888999', '1998-11-15', 'Panamá', 'clavemaria', 1, '2024-03-10'),
(12, 'Andrés', 'Jiménez', 'masculino', 'andres.jimenez@email.com', '555666555', '1982-04-22', 'Costa Rica', 'claveandres', 1, '2024-03-11'),
(13, 'Laura', 'García', 'femenino', 'laura.garcia@email.com', '555222111', '1994-06-08', 'Guatemala', 'clavelaura', 1, '2024-03-12'),
(14, 'Miguel', 'Mendoza', 'masculino', 'miguel.mendoza@email.com', '555444333', '1986-10-01', 'El Salvador', 'clavemiguel', 1, '2024-03-13'),
(15, 'Paola', 'Castro', 'femenino', 'paola.castro@email.com', '555777666', '1996-03-17', 'Honduras', 'clavepaola', 1, '2024-03-14'),
(16, 'Juan', 'Reyes', 'masculino', 'juan.reyes@email.com', '555000111', '1981-08-28', 'Nicaragua', 'clavejuan', 1, '2024-03-15'),
(17, 'Catalina', 'Herrera', 'femenino', 'catalina.herrera@email.com', '555333222', '1999-02-03', 'Puerto Rico', 'catalinah', 1, '2024-03-16'),
(18, 'Gabriel', 'Vargas', 'masculino', 'gabriel.vargas@email.com', '555666999', '1983-12-11', 'República Dominicana', 'clavegabriel', 1, '2024-03-17'),
(19, 'Isabella', 'Fuentes', 'femenino', 'isabella.fuentes@email.com', '555444000', '1992-05-19', 'Cuba', 'claveisabella', 1, '2024-03-18'),
(20, 'Santiago', 'Molina', 'masculino', 'santiago.molina@email.com', '555777111', '1987-01-26', 'Jamaica', 'clavesantiago', 1, '2024-03-19'),
(21, 'Valentina', 'Guzmán', 'femenino', 'valentina.guzman@email.com', '555222777', '1994-09-09', 'Trinidad y Tobago', 'clavevalentina', 1, '2024-03-20'),
(22, 'Emilio', 'Arias', 'masculino', 'emilio.arias@email.com', '555999444', '1988-04-14', 'Haití', 'claveemilio', 1, '2024-03-21'),
(23, 'Camila', 'Santos', 'femenino', 'camila.santos@email.com', '555666111', '1997-06-21', 'Barbados', 'clavecamila', 1, '2024-03-22'),
(24, 'Daniel', 'Rojas', 'masculino', 'daniel.rojas@email.com', '555333888', '1985-11-27', 'Granada', 'clavedaniel', 1, '2024-03-23'),
(25, 'Laura', 'Fernández', 'femenino', 'laura.fernandez@email.com', '555555555', '1988-11-10', 'Argentina', 'clavelaura', 1, '2024-03-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id_detalle` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad_producto` int(11) DEFAULT NULL,
  `precio_producto` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Disparadores `detalle_pedido`
--
DELIMITER $$
CREATE TRIGGER `after_insert_pedido` AFTER INSERT ON `detalle_pedido` FOR EACH ROW BEGIN
    DECLARE producto_existencias INT;

    -- Obtener las existencias actuales del producto
    SELECT existencias INTO producto_existencias
    FROM productos
    WHERE id_producto = NEW.id_producto;

    -- Actualizar las existencias restando la cantidad comprada
    UPDATE productos
    SET existencias_producto = existencias_producto - NEW.cantidad_producto
    WHERE producto_id = NEW.id_producto;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `estado_pedido` enum('pendiente','en_proceso','entregado') DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `direccion_pedido` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `id_cliente`, `estado_pedido`, `fecha_registro`, `direccion_pedido`) VALUES
(1, 1, 'entregado', '2024-01-10 14:30:00', 'Av. Corrientes 123, Buenos Aires, Argentina'),
(2, 2, 'pendiente', '2024-02-15 12:45:00', 'Ocean Drive, Bridgetown, Barbados'),
(3, 3, 'en_proceso', '2024-03-20 10:00:00', 'Calle Murillo 456, La Paz, Bolivia'),
(4, 4, 'entregado', '2024-04-25 16:20:00', 'Av. Providencia 789, Santiago, Chile'),
(5, 5, 'pendiente', '2024-05-30 08:15:00', 'Carrera 7 # 45-67, Bogotá, Colombia'),
(6, 6, 'entregado', '2024-06-05 13:00:00', 'Avenida Central, San José, Costa Rica'),
(7, 7, 'pendiente', '2024-07-10 11:30:00', 'Calle Obispo, La Habana, Cuba'),
(8, 8, 'en_proceso', '2024-08-15 09:45:00', 'Av. Amazonas N23-56, Quito, Ecuador'),
(9, 9, 'entregado', '2024-09-20 15:15:00', 'Boulevard de los Héroes, San Salvador, El Salvador'),
(10, 10, 'pendiente', '2024-10-25 14:00:00', 'Calle Gran Vía, Madrid, España'),
(11, 11, 'entregado', '2024-11-30 16:30:00', 'Grand Anse Beach, St. George\'s, Granada'),
(12, 12, 'pendiente', '2024-12-15 10:45:00', 'Avenida Reforma 6-45, Ciudad de Guatemala, Guatemala'),
(13, 13, 'en_proceso', '2025-01-20 08:00:00', 'Rue Capois, Puerto Príncipe, Haití'),
(14, 14, 'entregado', '2025-02-25 12:20:00', 'Boulevard Suyapa, Tegucigalpa, Honduras'),
(15, 15, 'pendiente', '2025-03-30 14:15:00', 'Kingston Waterfront, Kingston, Jamaica'),
(16, 16, 'en_proceso', '2025-04-30 09:30:00', 'Paseo de la Reforma 123, Ciudad de México, México'),
(17, 17, 'entregado', '2025-05-30 15:00:00', 'Plaza de la Revolución, Managua, Nicaragua'),
(18, 18, 'pendiente', '2025-06-30 11:45:00', 'Avenida Balboa, Ciudad de Panamá, Panamá'),
(19, 19, 'en_proceso', '2025-07-30 13:30:00', 'Palma 468, Asunción, Paraguay'),
(20, 20, 'entregado', '2025-08-30 14:45:00', 'Plaza Mayor, Lima, Perú'),
(21, 21, 'pendiente', '2025-09-30 16:00:00', 'Old San Juan, San Juan, Puerto Rico'),
(22, 22, 'en_proceso', '2025-10-30 10:30:00', 'Zona Colonial, Santo Domingo, República Dominicana'),
(23, 23, 'entregado', '2025-11-30 12:15:00', 'Maracas Bay, Puerto España, Trinidad y Tobago'),
(24, 24, 'pendiente', '2025-12-30 14:30:00', 'Rambla de Montevideo, Montevideo, Uruguay'),
(25, 25, 'en_proceso', '2026-01-30 09:00:00', 'Av. Urdaneta, Caracas, Venezuela');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `nombre_producto` varchar(50) DEFAULT NULL,
  `descripcion_producto` varchar(250) DEFAULT NULL,
  `precio_producto` decimal(10,2) DEFAULT NULL,
  `imagen_producto` varchar(25) DEFAULT NULL,
  `estado_producto` tinyint(1) DEFAULT NULL,
  `id_administrador` int(11) DEFAULT NULL,
  `existencias_producto` int(11) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `id_categoria`, `nombre_producto`, `descripcion_producto`, `precio_producto`, `imagen_producto`, `estado_producto`, `id_administrador`, `existencias_producto`, `fecha_registro`) VALUES
(1, 1, 'Cuaderno espiral A4', 'Cuaderno de hojas blancas, tamaño A4', 4.99, 'cuaderno_espiral_a4.jpg', 1, 1, 100, '2024-01-01'),
(2, 1, 'Cuaderno rayado A5', 'Cuaderno de hojas rayadas, tamaño A5', 3.99, 'cuaderno_rayado_a5.jpg', 1, 2, 150, '2024-01-02'),
(3, 2, 'Lápiz HB', 'Lápiz con dureza HB para escritura general', 0.49, 'lapiz_hb.jpg', 1, 1, 500, '2024-02-01'),
(4, 2, 'Lápices de colores (12 colores)', 'Caja de 12 lápices de colores', 3.99, 'lapices_colores_12.jpg', 1, 1, 200, '2024-02-02'),
(5, 3, 'Mochila ejecutiva', 'Mochila elegante para uso ejecutivo', 39.99, 'mochila_ejecutiva.jpg', 1, 1, 60, '2024-03-03'),
(6, 3, 'Mochila con ruedas', 'Mochila con sistema de ruedas para fácil transporte', 49.99, 'mochila_ruedas.jpg', 1, 1, 40, '2024-03-04'),
(7, 4, 'Calculadora científica Casio FX-991EX', 'Calculadora científica avanzada', 24.99, 'calculadora_cientifica_ca', 1, 1, 50, '2024-04-01'),
(8, 4, 'Calculadora básica', 'Calculadora simple para tareas cotidianas', 9.99, 'calculadora_basica.jpg', 1, 1, 100, '2024-04-02'),
(9, 5, 'Estuche con compartimentos', 'Estuche para organizar lápices y bolígrafos', 7.99, 'estuche_compartimentos.jp', 1, 1, 150, '2024-05-01'),
(10, 5, 'Estuche de tela', 'Estuche ligero y fácil de llevar', 5.99, 'estuche_tela.jpg', 1, 1, 200, '2024-05-02'),
(11, 1, 'Cuaderno de espiral con tapa dura', 'Cuaderno de espiral con tapa dura, ideal para tomar apuntes', 7.99, 'cuaderno_espiral_tapa_dur', 1, 1, 80, '2024-01-03'),
(12, 1, 'Cuaderno de dibujo artístico', 'Cuaderno con papel de calidad para dibujar y crear arte', 9.99, 'cuaderno_dibujo_artistico', 1, 1, 60, '2024-01-04'),
(13, 2, 'Lápiz mecánico 0.7mm', 'Lápiz mecánico con punta de 0.7mm para escritura precisa', 1.49, 'lapiz_mecanico_07mm.jpg', 1, 1, 200, '2024-02-03'),
(14, 2, 'Lápices de colores profesionales (24 colores)', 'Caja de 24 lápices de colores de alta calidad', 12.99, 'lapices_colores_profesion', 1, 1, 120, '2024-02-04'),
(15, 3, 'Mochila resistente al agua', 'Mochila con material resistente al agua para días lluviosos', 34.99, 'mochila_resistente_agua.j', 1, 1, 70, '2024-03-05'),
(16, 3, 'Mochila para portátil', 'Mochila con compartimento acolchado para portátil', 29.99, 'mochila_portatil.jpg', 1, 1, 90, '2024-03-06'),
(17, 4, 'Calculadora programable HP Prime', 'Calculadora programable para estudiantes avanzados', 129.99, 'calculadora_programable_h', 1, 1, 30, '2024-04-05'),
(18, 4, 'Calculadora científica Casio FX-115ES Plus', 'Calculadora científica con funciones avanzadas', 19.99, 'calculadora_cientifica_ca', 1, 1, 80, '2024-04-06'),
(19, 5, 'Estuche doble compartimento', 'Estuche con dos compartimentos para mayor organización', 9.99, 'estuche_doble_compartimen', 1, 1, 100, '2024-05-05'),
(20, 5, 'Estuche de silicona', 'Estuche flexible de silicona para lápices y bolígrafos', 5.99, 'estuche_silicona.jpg', 1, 1, 150, '2024-05-06'),
(21, 1, 'Cuaderno de espiral con tapa blanda', 'Cuaderno de espiral con tapa blanda y hojas rayadas', 5.99, 'cuaderno_espiral_tapa_bla', 1, 1, 120, '2024-01-05'),
(22, 1, 'Cuaderno de composición', 'Cuaderno de composición con hojas cuadriculadas', 6.99, 'cuaderno_composicion.jpg', 1, 1, 80, '2024-01-06'),
(23, 2, 'Lápiz de carpintero', 'Lápiz de carpintero hexagonal con punta resistente', 2.49, 'lapiz_carpintero.jpg', 1, 1, 150, '2024-02-05'),
(24, 2, 'Lápices de colores acuarelables', 'Caja de 24 lápices acuarelables para arte y dibujo', 15.99, 'lapices_colores_acuarelab', 1, 1, 100, '2024-02-06'),
(25, 3, 'Mochila con USB', 'Mochila con puerto USB para cargar dispositivos electrónicos', 39.99, 'mochila_usb.jpg', 1, 1, 90, '2024-03-08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reseña`
--

CREATE TABLE `reseña` (
  `id_resena` int(11) NOT NULL,
  `id_detalle` int(11) NOT NULL,
  `calificacion_producto` int(11) DEFAULT NULL,
  `comentario_producto` varchar(250) DEFAULT NULL,
  `fecha_valoracion` date NOT NULL,
  `estado_comentario` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_administrador`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_producto` (`id_producto`) USING BTREE;

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_administrador` (`id_administrador`);

--
-- Indices de la tabla `reseña`
--
ALTER TABLE `reseña`
  ADD PRIMARY KEY (`id_resena`),
  ADD KEY `id_detalle` (`id_detalle`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_administrador`) REFERENCES `administrador` (`id_administrador`);

--
-- Filtros para la tabla `reseña`
--
ALTER TABLE `reseña`
  ADD CONSTRAINT `reseña_ibfk_1` FOREIGN KEY (`id_detalle`) REFERENCES `detalle_pedido` (`id_detalle`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
