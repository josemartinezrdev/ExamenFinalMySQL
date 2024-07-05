CREATE DATABASE garden;

USE garden;

CREATE TABLE gama_producto(
    gama VARCHAR(50),
    descripcion_texto TEXT,
    descripcion_html TEXT,
    imagen VARCHAR(256),
    CONSTRAINT pk_gama PRIMARY KEY (gama)
);

CREATE TABLE oficina(
    codigo_oficina VARCHAR(10),
    ciudad VARCHAR(30),
    pais VARCHAR(50),
    region VARCHAR(50),
    codigo_postal VARCHAR(10),
    telefono VARCHAR(20),
    linea_direccion1 VARCHAR(50),
    linea_direccion2 VARCHAR(50),

    CONSTRAINT pk_codigo_oficina PRIMARY KEY (codigo_oficina)
);

CREATE TABLE empleado (
    codigo_empleado INT(11),
    nombre VARCHAR(50),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    extension VARCHAR(10),
    email VARCHAR(100),
    codigo_jefe INT(11),
    puesto VARCHAR(50),

    codigo_oficina VARCHAR(10),

    CONSTRAINT pk_codigo_empleado PRIMARY KEY (codigo_empleado),
    CONSTRAINT fk_empleado_oficina FOREIGN KEY (codigo_oficina) REFERENCES oficina (codigo_oficina)
);

CREATE TABLE producto (
    codigo_producto VARCHAR(15),
    nombre VARCHAR(50),
    dimensiones VARCHAR(25),
    proveedor VARCHAR(25),
    descripcion TEXT,
    cantidad_en_stock SMALLINT(6),
    precio_venta DECIMAL(15,2),
    precio_proveedor DECIMAL(15,2),
    gama VARCHAR(50),
    CONSTRAINT pk_codigo_producto PRIMARY KEY (codigo_producto),
    CONSTRAINT fk_producto_gama_producto FOREIGN KEY (gama) REFERENCES gama_producto (gama)
);

CREATE TABLE cliente (
    codigo_cliente INT(11),
    nombre_cliente VARCHAR(50),
    nombre_contacto VARCHAR(30),
    apellido_contacto VARCHAR(30),
    telefono VARCHAR(15),
    fax VARCHAR(15),
    linea_direccion1 VARCHAR(50),
    linea_direccion2 VARCHAR(50),
    ciudad VARCHAR(50),
    region VARCHAR(50),
    pais VARCHAR(50),
    codigo_postal VARCHAR(10),
    limite_credito DECIMAL(15, 2),

    codigo_empleado INT(11),

    CONSTRAINT pk_codigo_cliente PRIMARY KEY (codigo_cliente),
    CONSTRAINT fk_cliente_empleado FOREIGN KEY (codigo_empleado) REFERENCES empleado (codigo_empleado)

);

CREATE TABLE pedido(
	codigo_pedido INT(11),
    fecha_pedido DATE,
    fecha_esperada DATE,
    fecha_entrega DATE,
    estado VARCHAR(15),
    comentarios TEXT,
    codigo_cliente INT(11),

    CONSTRAINT pk_codigo_pedido PRIMARY KEY (codigo_pedido),
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo_cliente)
);

CREATE TABLE pago (
    id_transaccion VARCHAR(50),
    forma_pago VARCHAR(40),
    fecha_pago DATE,
    total DECIMAL(15, 2),

    codigo_cliente INT(11),

    CONSTRAINT pk_id_transaccion PRIMARY KEY (id_transaccion),
    CONSTRAINT fk_pago_cliente FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo_cliente)

);

CREATE TABLE detalle_pedido(
    codigo_pedido INT(11),
    codigo_producto VARCHAR(15),
    cantidad INT(11),
    precio_unidad DECIMAL(15,2),
    numero_linea SMALLINT(6),
    
    CONSTRAINT fk_detalle_pedido_pedido FOREIGN KEY (codigo_pedido) REFERENCES pedido (codigo_pedido),
    CONSTRAINT fk_detalle_pedido_producto FOREIGN KEY (codigo_producto) REFERENCES producto (codigo_producto)
);