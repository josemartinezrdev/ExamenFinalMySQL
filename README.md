# Integrantes

- Elizabeth Perez Valderrama.
- Jose David Martinez Rincon.

# Consultas sobre una tabla

1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

```sql
SELECT codigo_oficina, ciudad
FROM oficina;
```

2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

   ```sql
   SELECT ciudad, telefono
   FROM oficina
   WHERE pais LIKE "España";
   ```

   3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo
     jefe tiene un código de jefe igual a 7.

     ```sql
     SELECT nombre, apellido1, apellido2 email
     FROM empleado
     WHERE codigo_jefe = 7;
     ```

     

   4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la
     empresa.

     ```
     
     ```

     

   5. Devuelve un listado con el nombre, apellidos y puesto de aquellos
     empleados que no sean representantes de ventas.

   ```sql
   SELECT nombre, apellido1, apellido2, puesto
   FROM empleado
   WHERE puesto NOT IN ("representante de ventas");
   ```

   3. Devuelve un listado con el nombre de los todos los clientes españoles.

      ```sql
      SELECT nombre_cliente, pais
      FROM cliente
      WHERE pais = "España";
      ```

      

   4. Devuelve un listado con los distintos estados por los que puede pasar un
     pedido.

     ```sql
     SELECT estado
     FROM pedido;
     ```

     

   5. Devuelve un listado con el código de cliente de aquellos clientes que
     realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar
     aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
     • Utilizando la función YEAR de MySQL.
     • Utilizando la función DATE_FORMAT de MySQL.
     • Sin utilizar ninguna de las funciones anteriores.

     ```sql
     SELECT DISTINCT codigo_cliente
     FROM pago
     WHERE fecha_pago LIKE "2008%";
     ```

     

   6. Devuelve un listado con el código de pedido, código de cliente, fecha
     esperada y fecha de entrega de los pedidos que no han sido entregados a
     tiempo.

     ```sql
     SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
     FROM pedido
     WHERE fecha_entrega IN NOT fecha_esperada;
     
     ```

     

   7. Devuelve un listado con el código de pedido, código de cliente, fecha
      esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al
      menos dos días antes de la fecha esperada.
      • Utilizando la función ADDDATE de MySQL.
      • Utilizando la función DATEDIFF de MySQL.
      • ¿Sería posible resolver esta consulta utilizando el operador de suma + o
      resta -?

      ```sql
      SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
      FROM pedido
      WHERE fecha_entrega <= (fecha_esperada - INTERVAL 2 DAY);
      
      ```

      

   8. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.

      ```sql
      SELECT codigo_pedido
      FROM pedido
      WHERE estado LIKE "rechazado"
      AND fecha_pedido LIKE "2009%";
      ```

      

   9. Devuelve un listado de todos los pedidos que han sido entregados en el
      mes de enero de cualquier año.

      ```sql
      SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
      FROM pedido
      WHERE fecha_entrega LIKE "%01%";
      ```

      

   10. Devuelve un listado con todos los pagos que se realizaron en el
       año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

       ```sql
       SELECT id_transaccion,
           forma_pago,
           fecha_pago,
           total,
           codigo_cliente
       FROM pago
       WHERE fecha_pago LIKE "2018%"
       AND forma_pago LIKE "Paypal"
       ORDER BY total ASC;
          
       
       ```

       

   11. Devuelve un listado con todas las formas de pago que aparecen en la
       tabla pago. Tenga en cuenta que no deben aparecer formas de pago
       repetidas.

       ```sql
       SELECT DISTINCT forma_pago
       FROM pago;
       ```

       

   12. Devuelve un listado con todos los productos que pertenecen a la
       gama Ornamentales y que tienen más de 100 unidades en stock. El listado
       deberá estar ordenado por su precio de venta, mostrando en primer lugar
       los de mayor precio.

       ```sql
       SELECT p.codigo_producto, p.nombre, p.cantidad_en_stock, p.precio_venta, g.gama
       FROM producto p, gama_producto g
       WHERE g.gama LIKE "Ornamentales"
       ORDER BY p.precio_venta ASC;
       ```

       

   13. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y
       cuyo representante de ventas tenga el código de empleado 11 o 30.

       ```sql
       SELECT
           c.nombre_cliente,
           e.nombre AS nombre_empleado,
           e.apellido1 AS apellido_uno_empl,
           e.apellido2 AS apellido_dos_empl
       
       FROM cliente c
       
       INNER JOIN empleado e ON e.codigo_empleado = c.codigo_empleado
       WHERE c.ciudad LIKE "Madrid"
       AND (e.codigo_empleado = 11 OR 30);
       ```

       

   # Consultas multitabla (Composición interna)

   Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2. Las consultas con
   sintaxis de SQL2 se deben resolver con INNER JOIN y NATURAL JOIN.

   1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su
     representante de ventas.

     ```sql
     SELECT
       c.nombre_cliente,
       e.nombre AS nombre_empleado,
       e.apellido1 AS apellido_uno_empl,
       e.apellido2 AS apellido_dos_empl
     FROM cliente c
     INNER JOIN empleado e ON e.codigo_empleado = c.codigo_empleado;
     ```

     

   2. Muestra el nombre de los clientes que hayan realizado pagos junto con el
     nombre de sus representantes de ventas.

     ```sql
     SELECT
         c.nombre_cliente,
         pago.id_transaccion,
         e.nombre AS nombre_empleado,
         e.apellido1 AS apellido_uno_empl,
         e.apellido2 AS apellido_dos_empl
     
     FROM cliente c
     INNER JOIN pago ON c.codigo_cliente = pago.codigo_cliente
     INNER JOIN empleado e ON e.codigo_empleado = c.codigo_empleado;
     ```

     

   3. Muestra el nombre de los clientes que no hayan realizado pagos junto con
     el nombre de sus representantes de ventas.

     ```sql
     
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
     ```

     sq

   4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus
     representantes junto con la ciudad de la oficina a la que pertenece el
     representante.

     ```sql
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
     ```

     

   5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre
     de sus representantes junto con la ciudad de la oficina a la que pertenece el
     representante.

     ```sql
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
     ```

     

   6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

      ```sql
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
      ```

      

   7. Devuelve el nombre de los clientes y el nombre de sus representantes junto
     con la ciudad de la oficina a la que pertenece el representante.

     ```sql
     SELECT e.nombre AS nombre_empleado
     FROM empleado e
     LEFT JOIN oficina ofi ON e.codigo_oficina = ofi.codigo_oficina
     LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado
     WHERE (ofi.codigo_oficina IS NULL) AND (c.codigo_empleado IS NULL);
     ```

     

   8. Devuelve un listado con el nombre de los empleados junto con el nombre
     de sus jefes.

   9. Devuelve un listado que muestre el nombre de cada empleados, el nombre
     de su jefe y el nombre del jefe de sus jefe.

   10. Devuelve el nombre de los clientes a los que no se les ha entregado a
       tiempo un pedido.

       ```sql
       SELECT codigo_pedido, fecha_esperada, fecha_entrega, c.nombre_cliente
       FROM pedido
       INNER JOIN cliente c ON c.codigo_cliente = pedido.codigo_cliente
       WHERE fecha_entrega < fecha_esperada;
       ```

       

   11. Devuelve un listado de las diferentes gamas de producto que ha comprado
       cada cliente.

       ```sql
       SELECT gp.gama, c.nombre_cliente
       FROM cliente c
       INNER JOIN pedido p ON p.codigo_cliente = c.codigo_cliente
       INNER JOIN detalle_pedido dp ON dp.codigo_pedido = p.codigo_pedido
       INNER JOIN producto prod ON prod.codigo_producto = dp.codigo_producto
       INNER JOIN  gama_producto gp ON gp.gama = prod.gama;
       ```

       

       # Consultas multitabla (Composición externa)

       Resuelva todas las consultas utilizando las cláusulas LEFT JOIN, RIGHT JOIN, NATURAL
       LEFT JOIN y NATURAL RIGHT JOIN.

   12. Devuelve un listado que muestre solamente los clientes que no han
      realizado ningún pago.

      ```sql
      SELECT
          c.nombre_cliente
      FROM cliente c
      LEFT JOIN pago ON c.codigo_cliente = pago.codigo_cliente
      WHERE pago.codigo_cliente IS NULL;
      
      ```

      

   13. Devuelve un listado que muestre solamente los clientes que no han
      realizado ningún pedido.

      ```sql
      SELECT
          c.nombre_cliente
      FROM cliente c
      LEFT JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
      WHERE p.codigo_cliente IS NULL;
      ```

      

   14. Devuelve un listado que muestre los clientes que no han realizado ningún
      pago y los que no han realizado ningún pedido.

      ```sql
      
      SELECT
          c.nombre_cliente
      FROM cliente c
      LEFT JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
      LEFT JOIN pago pag ON c.codigo_cliente = pag.codigo_cliente
      
      
      WHERE (p.codigo_cliente IS NULL) AND (pag.codigo_cliente IS NULL);
      ```

      

   15. Devuelve un listado que muestre solamente los empleados que no tienen
      una oficina asociada.

      ```sql
      SELECT e.nombre AS nombre_empleado
      FROM empleado e
      LEFT JOIN oficina ofi ON e.codigo_oficina = ofi.codigo_oficina
      WHERE ofi.codigo_oficina IS NULL;
      ```

      

   16. Devuelve un listado que muestre solamente los empleados que no tienen un
      cliente asociado.

      ```sql
      SELECT e.nombre AS nombre_empleado
      FROM cliente c
      LEFT JOIN empleado e ON c.codigo_empleado = e.codigo_empleado
      WHERE e.codigo_empleado IS NULL;
      ```

      

   17. Devuelve un listado que muestre solamente los empleados que no tienen un
      cliente asociado junto con los datos de la oficina donde trabajan.

      ```sql
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
      ```

      

   18. Devuelve un listado que muestre los empleados que no tienen una oficina
      asociada y los que no tienen un cliente asociado.

      ```sql
      SELECT e.nombre AS nombre_empleado
      FROM empleado e
      LEFT JOIN oficina ofi ON e.codigo_oficina = ofi.codigo_oficina
      LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado
      WHERE (ofi.codigo_oficina IS NULL) AND (c.codigo_empleado IS NULL);
      ```

      

   19. Devuelve un listado de los productos que nunca han aparecido en un
      pedido.

      ```
      SELECT *
      FROM pedido ped
      LEFT JOIN detalle_pedido dp ON ped.codigo_pedido = dp.codigo_pedido
      WHERE dp.codigo_pedido IS NULL;
      ```

      

   20. Devuelve un listado de los productos que nunca han aparecido en un
      pedido. El resultado debe mostrar el nombre, la descripción y la imagen del
      producto.

   21. Devuelve las oficinas donde no trabajan ninguno de los empleados que
       hayan sido los representantes de ventas de algún cliente que haya realizado
       la compra de algún producto de la gama Frutales.

   22. Devuelve un listado con los clientes que han realizado algún pedido pero no
       han realizado ningún pago.

   23. Devuelve un listado con los datos de los empleados que no tienen clientes
       asociados y el nombre de su jefe asociado.

       # Consultas resumen

   24. ¿Cuántos empleados hay en la compañía?

       ```sql
       SELECT COUNT(codigo_empleado)
       FROM empleado;
       ```

       

   25. ¿Cuántos clientes tiene cada país?

       ```sql
       SELECT COUNT(codigo_cliente), pais
       FROM cliente
       GROUP BY pais;
       ```

   26. ¿Cuál fue el pago medio en 2009?

       ```sql
       SELECT AVG(total)
       FROM pago
       WHERE fecha_pago LIKE "2009%";
       ```

       

   27. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma
      descendente por el número de pedidos.

      ```sql
      SELECT COUNT(codigo_pedido) AS total_pedidos, estado
      FROM pedido
      GROUP BY estado
      ORDER BY total_pedidos;
      ```

      

   28. Calcula el precio de venta del producto más caro y más barato en una
      misma consulta.

      ```sql
      SELECT MAX(precio_venta) AS maximo_precio, MIN(precio_venta)  AS minimo_precio
      FROM producto;
      ```

      

   29. Calcula el número de clientes que tiene la empresa.

       ```sql
       SELECT COUNT(codigo_cliente)
       FROM cliente;
       ```

       

   30. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?

       ```sql
       SELECT COUNT(codigo_cliente)
       FROM cliente
       WHERE ciudad LIKE "Madrid";
       ```

       

   31. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan
      por M?

      ```sql
      SELECT COUNT(codigo_cliente), ciudad
      FROM cliente
      WHERE ciudad LIKE "M%"
      GROUP BY ciudad;
      ```

      

   32. Devuelve el nombre de los representantes de ventas y el número de clientes
      al que atiende cada uno.

      ```sql
      SELECT COUNT(c.codigo_cliente) AS numero_clientes, e.nombre AS nombre_empleado
      FROM cliente c 
      JOIN empleado e ON c.codigo_empleado = e.codigo_empleado
      GROUP BY e.nombre;
      ```

      

   33. Calcula el número de clientes que no tiene asignado representante de
       ventas.

   34. Calcula la fecha del primer y último pago realizado por cada uno de los
       clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.
      ```sql
         SELECT 
       c.nombre_cliente,
       c.nombre_contacto,
       c.apellido_contacto,
       MIN(p.fecha_pago) AS fecha_primer_pago,
       MAX(p.fecha_pago) AS fecha_ultimo_pago
      FROM 
          cliente c
      JOIN 
          pago p ON c.codigo_cliente = p.codigo_cliente
      GROUP BY 
          c.codigo_cliente,
          c.nombre_cliente,
          c.nombre_contacto,
          c.apellido_contacto
      ORDER BY 
          c.nombre_cliente, 
          c.apellido_contacto;
      ```

   36. Calcula el número de productos diferentes que hay en cada uno de los
       pedidos.

   37. Calcula la suma de la cantidad total de todos los productos que aparecen en
       cada uno de los pedidos.

   38. Devuelve un listado de los 20 productos más vendidos y el número total de
       unidades que se han vendido de cada uno. El listado deberá estar ordenado
       por el número total de unidades vendidas.

   39. La facturación que ha tenido la empresa en toda la historia, indicando la
       base imponible, el IVA y el total facturado. La base imponible se calcula
       sumando el coste del producto por el número de unidades vendidas de la
       tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la
       suma de los dos campos anteriores.

   40. La misma información que en la pregunta anterior, pero agrupada por
       código de producto.

   41. La misma información que en la pregunta anterior, pero agrupada por
       código de producto filtrada por los códigos que empiecen por OR.

   42. Lista las ventas totales de los productos que hayan facturado más de 3000
       euros. Se mostrará el nombre, unidades vendidas, total facturado y total
       facturado con impuestos (21% IVA).

   43. Muestre la suma total de todos los pagos que se realizaron para cada uno
       de los años que aparecen en la tabla pagos.

   # Consultas variadas

   1. Devuelve el listado de clientes indicando el nombre del cliente y cuántos
     pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no
     han realizado ningún pedido.
   2. 
   3. Devuelve un listado con los nombres de los clientes y el total pagado por
     cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han
     realizado ningún pago.
   4. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008
     ordenados alfabéticamente de menor a mayor.
   5. Devuelve el nombre del cliente, el nombre y primer apellido de su
     representante de ventas y el número de teléfono de la oficina del

   representante de ventas, de aquellos clientes que no hayan realizado ningún
   pago.
   5. Devuelve el listado de clientes donde aparezca el nombre del cliente, el
   nombre y primer apellido de su representante de ventas y la ciudad donde
   está su oficina.
   6. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos
   empleados que no sean representante de ventas de ningún cliente.
   7. Devuelve un listado indicando todas las ciudades donde hay oficinas y el
   número de empleados
