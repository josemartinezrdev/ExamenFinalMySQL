INSERT INTO gama_producto (gama, descripcion_texto, descripcion_html, imagen) VALUES
("Ornamentales", "Descripción de Ornamentales", "<p>Descripción de Ornamentales</p>", "imagen1.jpg"),
("Gama2", "Descripción de Gama2", "<p>Descripción de Gama2</p>", "imagen2.jpg"),
("Gama3", "Descripción de Gama3", "<p>Descripción de Gama3</p>", "imagen3.jpg"),
("Gama4", "Descripción de Gama4", "<p>Descripción de Gama4</p>", "imagen4.jpg"),
("Gama5", "Descripción de Gama5", "<p>Descripción de Gama5</p>", "imagen5.jpg"),
("Gama6", "Descripción de Gama6", "<p>Descripción de Gama6</p>", "imagen6.jpg");

INSERT INTO oficina (codigo_oficina, ciudad, pais, region, codigo_postal, telefono, linea_direccion1, linea_direccion2) VALUES
("OF1", "Madrid", "España", "Europa", "28001", "123456789", "Calle Mayor 1", "Planta 1"),
("OF2", "Fuenlabrada", "España", "Europa", "08001", "987654321", "Calle Menor 2", "Planta 2"),
("OF3", "París", "Francia", "Europa", "75001", "234567890", "Rue Grande 3", "Planta 3"),
("OF4", "Londres", "Reino Unido", "Europa", "E1 6AN", "345678901", "High Street 4", "Planta 4"),
("OF5", "Fuenlabrada", "Alemania", "Europa", "10115", "456789012", "Hauptstraße 5", "Planta 5"),
("OF6", "Roma", "Italia", "Europa", "00184", "567890123", "Via Principale 6", "Planta 6");

INSERT INTO empleado (codigo_empleado, nombre, apellido1, apellido2, extension, email, codigo_jefe, puesto, codigo_oficina) VALUES
(11, "Juan", "Pérez", "García", "EXT1", "juan.perez@example.com", NULL, "Gerente", "OF1"),
(2, "Ana", "López", "Martínez", "EXT2", "ana.lopez@example.com", 2, "Subgerente", "OF1"),
(30, "Luis", "Gómez", "Sánchez", "EXT3", "luis.gomez@example.com", 3, "Asistente", "OF1"),
(4, "Marta", "Díaz", "Hernández", "EXT4", "marta.diaz@example.com", 1, "Recepcionista", "OF2"),
(5, "Carlos", "Fernández", "Ruiz", "EXT5", "carlos.fernandez@example.com", 1, "Contador", "OF2"),
(6, "Lucía", "Martín", "Pérez", "EXT6", "lucia.martin@example.com", 7, "Vendedor", NULL);

INSERT INTO producto (codigo_producto, nombre, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor, gama) VALUES
("P1", "Producto1", "10x10x10", "Proveedor1", "Descripción de Producto1", 100, 20.00, 15.00, "Ornamentales"),
("P2", "Producto2", "20x20x20", "Proveedor2", "Descripción de Producto2", 200, 30.00, 25.00, "Gama2"),
("P3", "Producto3", "30x30x30", "Proveedor3", "Descripción de Producto3", 300, 40.00, 35.00, "Gama3"),
("P4", "Producto4", "40x40x40", "Proveedor4", "Descripción de Producto4", 400, 50.00, 45.00, "Gama4"),
("P5", "Producto5", "50x50x50", "Proveedor5", "Descripción de Producto5", 500, 60.00, 55.00, "Gama5"),
("P6", "Producto6", "60x60x60", "Proveedor6", "Descripción de Producto6", 600, 70.00, 65.00, "Gama6"),
("P7", "Producto7", "10x20x50", "Proveedor7", "Descripción de Producto7", 700, 80.00, 50.00, "Gama2");

INSERT INTO cliente (codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, limite_credito, codigo_empleado) VALUES
(1, "Cliente1", "Contacto1", "Apellido1", "123456789", "987654321", "Dirección1", "Dirección2", "Madrid", "Región1", "España", "28001", 1000.00, 11),
(2, "Cliente2", "Contacto2", "Apellido2", "234567890", "876543210", "Dirección3", "Dirección4", "Barcelona", "Región2", "España", "08001", 2000.00, NULL),
(3, "Cliente3", "Contacto3", "Apellido3", "345678901", "765432109", "Dirección5", "Dirección6", "París", "Región3", "Francia", "75001", 3000.00, 30),
(4, "Cliente4", "Contacto4", "Apellido4", "456789012", "654321098", "Dirección7", "Dirección8", "Londres", "Región4", "Reino Unido", "E1 6AN", 4000.00, 4),
(5, "Cliente5", "Contacto5", "Apellido5", "567890123", "543210987", "Dirección9", "Dirección10", "Berlín", "Región5", "Alemania", "10115", 5000.00, 5),
(6, "Cliente6", "Contacto6", "Apellido6", "678901234", "432109876", "Dirección11", "Dirección12", "Roma", "Región6", "Italia", "00184", 6000.00, 6);

INSERT INTO pedido (codigo_pedido, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, codigo_cliente) VALUES
(1, "2024-01-01", "2024-01-10", "2024-01-12", "Entregado", "Comentario1", 1),
(3, "2024-03-01", "2024-03-10", "2024-03-10", "En proceso", "Comentario3", 3),
(5, "2024-05-01", "2024-05-10", "2024-05-05", "En proceso", "Comentario5", 5),
(6, "2009-06-01", "2024-06-10", "2024-06-10", "Rechazado", "Comentario6", 6);

INSERT INTO pago (id_transaccion, forma_pago, fecha_pago, total, codigo_cliente) VALUES
("T1", "Tarjeta de Crédito", "2019-01-11", 100.00, 1),
("T4", "Efectivo", "2019-04-11", 400.00, 4),
("T5", "PayPal", "2024-05-11", 500.00, 5);

INSERT INTO detalle_pedido (codigo_pedido, codigo_producto, cantidad, precio_unidad, numero_linea) VALUES
(1, "P1", 10, 20.00, 1),
(3, "P2", 20, 30.00, 1),
(3, "P3", 30, 40.00, 1),
(6, "P4", 40, 50.00, 1),
(5, "P5", 50, 60.00, 1),
(6, "P6", 60, 70.00, 1);

