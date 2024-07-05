-- 1

SELECT
    c.nombre_cliente,
    e.nombre AS nombre_empleado,
    e.apellido1 AS apellido_uno_empl,
    e.apellido2 AS apellido_dos_empl

FROM cliente c

INNER JOIN empleado e ON e.codigo_empleado = c.codigo_empleado;

-- 2

SELECT
    c.nombre_cliente,
    pago.id_transaccion,
    e.nombre AS nombre_empleado,
    e.apellido1 AS apellido_uno_empl,
    e.apellido2 AS apellido_dos_empl

FROM cliente c
INNER JOIN pago ON c.codigo_cliente = pago.codigo_cliente
INNER JOIN empleado e ON e.codigo_empleado = c.codigo_empleado;

-- 3

SELECT
    c.nombre_cliente,
    pago.id_transaccion,
    e.nombre AS nombre_empleado,
    e.apellido1 AS apellido_uno_empl,
    e.apellido2 AS apellido_dos_empl

FROM cliente c
LEFT JOIN pago ON c.codigo_cliente = pago.codigo_cliente
INNER JOIN empleado e ON e.codigo_empleado = c.codigo_empleado
WHERE pago.codigo_cliente IS NULL;

-- 4

SELECT
    c.nombre_cliente,
    pago.id_transaccion,
    e.nombre AS nombre_empleado,
    e.apellido1 AS apellido_uno_empl,
    e.apellido2 AS apellido_dos_empl,
    o.ciudad AS ciudad_oficina

FROM cliente c
INNER JOIN pago ON c.codigo_cliente = pago.codigo_cliente
INNER JOIN empleado e ON e.codigo_empleado = c.codigo_empleado
INNER JOIN oficina o ON e.codigo_oficina = o.codigo_oficina;

-- 5

SELECT
    c.nombre_cliente,
    e.nombre AS nombre_empleado,
    e.apellido1 AS apellido_uno_empl,
    e.apellido2 AS apellido_dos_empl,
    o.ciudad AS ciudad_oficina

FROM cliente c
LEFT JOIN pago ON c.codigo_cliente = pago.codigo_cliente
INNER JOIN empleado e ON e.codigo_empleado = c.codigo_empleado
INNER JOIN oficina o ON e.codigo_oficina = o.codigo_oficina
WHERE pago.codigo_cliente IS NULL;

-- 6

SELECT
    o.codigo_oficina,
    o.pais,
    o.ciudad,
    o.region,
    o.linea_direccion1,
    o.linea_direccion2,
    c.nombre_cliente

FROM cliente c
INNER JOIN pago ON c.codigo_cliente = pago.codigo_cliente
INNER JOIN empleado e ON e.codigo_empleado = c.codigo_empleado
INNER JOIN oficina o ON e.codigo_oficina = o.codigo_oficina
WHERE o.ciudad IN ("Fuenlabrada");

-- 7

SELECT
    c.nombre_cliente,
    e.nombre AS nombre_empleado,
    e.apellido1 AS apellido_uno_empl,
    e.apellido2 AS apellido_dos_empl,
    o.ciudad AS ciudad_oficina

FROM cliente c
INNER JOIN empleado e ON e.codigo_empleado = c.codigo_empleado
INNER JOIN oficina o ON e.codigo_oficina = o.codigo_oficina;

-- 8
-- 9

-- 10

SELECT codigo_pedido, fecha_esperada, fecha_entrega, c.nombre_cliente
FROM pedido
INNER JOIN cliente c ON c.codigo_cliente = pedido.codigo_cliente
WHERE fecha_entrega < fecha_esperada;

-- 11

SELECT gp.gama, c.nombre_cliente
FROM cliente c
INNER JOIN pedido p ON p.codigo_cliente = c.codigo_cliente
INNER JOIN detalle_pedido dp ON dp.codigo_pedido = p.codigo_pedido
INNER JOIN producto prod ON prod.codigo_producto = dp.codigo_producto
INNER JOIN  gama_producto gp ON gp.gama = prod.gama;

-- CONSULTAS MULTITABLA COMPO EXTERNA

-- 1

SELECT
    c.nombre_cliente
FROM cliente c
LEFT JOIN pago ON c.codigo_cliente = pago.codigo_cliente
WHERE pago.codigo_cliente IS NULL;

-- 2

SELECT
    c.nombre_cliente
FROM cliente c
LEFT JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
WHERE p.codigo_cliente IS NULL;

-- 3

SELECT
    c.nombre_cliente
FROM cliente c
LEFT JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
LEFT JOIN pago pag ON c.codigo_cliente = pag.codigo_cliente


WHERE (p.codigo_cliente IS NULL) AND (pag.codigo_cliente IS NULL);

-- 4

SELECT e.nombre AS nombre_empleado
FROM empleado e
LEFT JOIN oficina ofi ON e.codigo_oficina = ofi.codigo_oficina
WHERE ofi.codigo_oficina IS NULL;

-- 5

SELECT e.nombre AS nombre_empleado
FROM cliente c
LEFT JOIN empleado e ON c.codigo_empleado = e.codigo_empleado
WHERE e.codigo_empleado IS NULL;

-- 6

SELECT
    e.nombre AS nombre_empleado,
    ofi.codigo_oficina,
    ofi.codigo_postal,
    ofi.linea_direccion1,
    ofi.linea_direccion2

FROM cliente c
LEFT JOIN empleado e ON c.codigo_empleado = e.codigo_empleado
INNER JOIN oficina ofi ON e.codigo_oficina = ofi.codigo_oficina
WHERE e.codigo_empleado IS NULL;

-- 7

SELECT e.nombre AS nombre_empleado
FROM empleado e
LEFT JOIN oficina ofi ON e.codigo_oficina = ofi.codigo_oficina
LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado
WHERE (ofi.codigo_oficina IS NULL) AND (c.codigo_empleado IS NULL);

-- 8

SELECT *
FROM pedido ped
LEFT JOIN detalle_pedido dp ON ped.codigo_pedido = dp.codigo_pedido
WHERE dp.codigo_pedido IS NULL;