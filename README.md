# Comandos DML Manipulación de datos con MySQL

### Preparando el ambiente

Aquí puedes descargar los archivos que necesitarás para iniciar con tu entrenamiento.

[Descargue los archivos en Github](https://github.com/alura-es-cursos/1831-comandos-dml-manipulacion-de-datos-con-mysql/tree/main "Descargue los archivos en Github") o haga clic [aquí](https://github.com/alura-es-cursos/1831-comandos-dml-manipulacion-de-datos-con-mysql/archive/refs/heads/main.zip "aquí") para descargarlos directamente.

### Haga lo que hicimos en aula

Llegó la hora de que sigas todos los pasos realizados por mí durante esta aula. En caso de que ya lo hayas hecho, excelente. Si aún no lo hiciste, es importante que ejecutes lo que fue visto en los videos para poder continuar con la siguiente aula.

1. Instala MySQL, conforme al video Instalando MySQL Server, del aula 1 referente al curso Introducción a SQL con MySQL.

2. Abre MySQL Workbench. Usa la conexión LOCALHOST y certifica que el ambiente está funcionando.

### Lo que aprendimos

Lo que aprendimos en esta aula:

- Como modelar una base de datos basados en el negocio de la empresa;
- Revisamos todas las entidades involucradas en una base de datos;
- Aprendimos los tipos de datos que componen una tabla.

### Proyecto del aula anterior

¿Comenzando en esta etapa? Aquí puedes descargar los archivos del proyecto que hemos avanzado hasta el aula anterior.

[Descargue los archivos en Github](¿Comenzando en esta etapa? Aquí puedes descargar los archivos del proyecto que hemos avanzado hasta el aula anterior.  Descargue los archivos en Github o haga clic aquí para descargarlos directamente. "Descargue los archivos en Github") o haga clic aquí para descargarlos directamente.

### Creación de la tabla de clientes

Crea la tabla de clientes con base en el diagrama de entidades de la definición de la base de datos ventas_jugos como se muestra a continuación:

![](https://caelum-online-public.s3.amazonaws.com/1831-php-bdd/02/9.png)

- Crea la tabla de clientes empleando líneas de comando SQL.
- El nombre de la tabla debe ser clientes.
- Observación: El nombre de los campos mencionados está en lenguaje natural. Debemos crear los campos de la siguiente forma:
 - DNI / NOMBRE / DIRECCION / BARRIO / CIUDAD / ESTADO / CP / FECHA_NACIMIENTO / EDAD / SEXO / LIMITE_CREDITO / VOLUMEN_COMPRA / PRIMERA_COMPRA

```SQL
CREATE TABLE clientes (
  DNI varchar(11) NOT NULL,
  NOMBRE varchar(100) DEFAULT NULL,
  DIRECCION varchar(150) DEFAULT NULL,
  BARRIO varchar(50) DEFAULT NULL,
  CIUDAD varchar(50) DEFAULT NULL,
  ESTADO varchar(45) DEFAULT NULL,
  CP varchar(8) DEFAULT NULL,
  FECHA_NACIMIENTO date DEFAULT NULL,
  EDAD int(2) DEFAULT NULL,
  SEXO varchar(1) DEFAULT NULL,
  LIMITE_CREDITO float DEFAULT NULL,
  VOLUMEN_COMPRA float DEFAULT NULL,
  PRIMERA_COMPRA bit(1) DEFAULT NULL,
  PRIMARY KEY (DNI));
```

### Creación de la tabla de facturas

Crea la tabla de facturas con base en el diagrama de entidades de la definición de la base de datos ventas_jugos como se muestra a continuación usando el asistente:

![](https://caelum-online-public.s3.amazonaws.com/1831-php-bdd/02/10.png)

-  El nombre de la tabla debe ser facturas.
-  Observación: El nombre de los campos mencionados está en lenguaje natural. Debemos crear los campos de la siguiente forma:
 - NUMERO / FECHA / DNI / MATRICULA / IMPUESTO

En la base de datos de `ventas_jugos` hay que hacer clic derecho sobre `Table`s:

![](https://caelum-online-public.s3.amazonaws.com/1831-php-bdd/02/11.png)

En el asistente de la creación de tablas digita:

![](https://caelum-online-public.s3.amazonaws.com/1831-php-bdd/02/12.png)

Guarda la tabla como facturas.

### Creando claves externas

Crea, por línea de comando, la clave externa que relaciona a la tabla `facturas `con `items_facturas` a través del campo `NUMERO`.

```SQL
USE ventas_jugos;

CREATE TABLE items_facturas
(NUMERO VARCHAR(5) NOT NULL,
CODIGO VARCHAR(10) NOT NULL,
CANTIDAD INT,
PRECIO FLOAT,
PRIMARY KEY (NUMERO, CODIGO));

ALTER TABLE items_facturas ADD CONSTRAINT FK_FACTURAS
FOREIGN KEY (NUMERO)
REFERENCES facturas(NUMERO);
```

###  Cambiando el nombre de la tabla

La gerencia de la empresa de jugos realizó la solicitud de cambiar los nombres de las tablas colocando el prefijo `tb_` antes de cada nombre.

```SQL
ALTER TABLE factura RENAME tb_factura;
ALTER TABLE cliente RENAME tb_cliente;
ALTER TABLE items_facturas RENAME tb_items_facturas;
```

###  Creando las tablas de productos y de vendedores

Para finalizar la creación de la base de datos, hacen falta dos tablas que son: `tb_producto` y `tb_vendedor`. (No olvides crear las claves externas que vinculan a `tb_producto` con `tb_items_facturas`, a `tb_facturas` con `tb_clientes` y a `tb_facturas` con `tb_vendedor`).

![](https://caelum-online-public.s3.amazonaws.com/1831-php-bdd/02/13.png)

![](https://caelum-online-public.s3.amazonaws.com/1831-php-bdd/02/14.png)

```SQL
USE ventas_jugos;

CREATE TABLE tb_vendedor(
MATRICULA VARCHAR(5) NOT NULL,
NOMBRE VARCHAR(100) NULL,
BARRIO VARCHAR(50) NULL,
COMISION FLOAT NULL,
FECHA_ADMISION DATE NULL,
DE_VACACIONES BIT(1) NULL,
PRIMARY KEY(MATRICULA)
);

CREATE TABLE tb_producto(
CODIGO VARCHAR(10) NOT NULL,
DESCRIPCION VARCHAR(100) NULL,
SABOR VARCHAR(50) NULL,
TAMANO VARCHAR(50) NULL,
ENVASE VARCHAR(50) NULL,
PRECIO_LISTA FLOAT NULL,
PRIMARY KEY (CODIGO)
);

ALTER TABLE tb_facturas ADD CONSTRAINT FK_CLIENTE
FOREIGN KEY (DNI) REFERENCES tb_cliente(DNI);

ALTER TABLE tb_facturas ADD CONSTRAINT FK_VENDEDOR
FOREIGN KEY (MATRICULA) REFERENCES tb_vendedor(MATRICULA);

ALTER TABLE tb_items_facturas ADD CONSTRAINT FK_PRODUCTO
FOREIGN KEY (CODIGO) REFERENCES tb_producto(CODIGO);
```
### Haga lo que hicimos en aula

Llegó la hora de que sigas todos los pasos realizados por mí durante esta aula. En caso de que ya lo hayas hecho, excelente. Si aún no lo hiciste, es importante que ejecutes lo que fue visto en los videos para poder continuar con la siguiente aula.

1. Abre MySQL Workbench y crea un nuevo script de comandos SQL.

2. Para crear una base de datos podemos usar el comando CREATE. Digita el siguiente comando para crear una nueva base de datos:

```SQL
CREATE DATABASE ventas_jugos;
```
3. Podemos emplear algunas propiedades para definir el tipo de tabla de caracteres que puede ser usada para almacenar los datos en la base. Digita el siguiente comando para crear una base que utilice la tabla de caracteres **UTF32**, Si hay dudas si existe o no la base de datos, podemos usar el comando `IF NOT EXISTS.`:

```SQL
CREATE SCHEMA IF NOT EXISTS ventas_jugos2 DEFAULT CHARSET utf32;
```

4. Podemos eliminar una base de datos existente. Para ello digita el comando:

```SQL
DROP DATABASE ventas_jugos2;
```
5. Doble clic sobre la base de datos ventas_jugos para que la misma quede seleccionada. El nombre de ella debe estar resaltado en negrilla.

6. Crea un nuevo script de SQL y digita el comando:

```SQL
USE ventas_jugos;
```

Este comando forzará la selección de la base de datos `ventas_jugos`.

7. Vamos a crear la primera tabla en nuestra base de datos. Digita ejecuta:

```SQL
CREATE TABLE tb_producto(
CODIGO VARCHAR(10) NOT NULL,
DESCRIPCION VARCHAR(100) NULL,
SABOR VARCHAR(50) NULL,
TAMANO VARCHAR(50) NULL,
ENVASE VARCHAR(50) NULL,
PRECIO_LISTA FLOAT NULL,
PRIMARY KEY (CODIGO)
);
```
8. Vamos a crear la segunda tabla (vendedores). Digita:

```SQL
CREATE TABLE tb_vendedor(
MATRICULA VARCHAR(5) NOT NULL,
NOMBRE VARCHAR(100) NULL,
BARRIO VARCHAR(50) NULL,
COMISION FLOAT NULL,
FECHA_ADMISION DATE NULL,
DE_VACACIONES BIT(1) NULL,
PRIMARY KEY(MATRICULA)
);
```
9. Haz clic con el botón derecho del mouse sobre Table y selecciona la opción Create Table.

![](https://caelum-online-public.s3.amazonaws.com/1831-php-bdd/02/15.png)

10. Tenemos un cuadro de diálogo para crear una tabla a través de un asistente. Digita lo siguiente para crear la tabla de clientes y la tabla de items_facturas:

![](https://caelum-online-public.s3.amazonaws.com/1831-php-bdd/02/17.png)

![](https://caelum-online-public.s3.amazonaws.com/1831-php-bdd/02/16.png)

11. Confirma la creación de las tablas anteriores haciendo clic sobre el botón apply.

12. Vamos a crear una tabla adicional que es la tabla de ventas. Para ello, digita en un nuevo script:

```SQL
USE ventas_jugos;

CREATE TABLE tb_venta(
NUMERO VARCHAR(5) NOT NULL,
FECHA DATE NULL,
DNI VARCHAR(11) NOT NULL,
MATRICULA VARCHAR(5) NOT NULL,
IMPUESTO FLOAT,
PRIMARY KEY(NUMERO)
);
```

13. Podemos crear relaciones entre esta tabla y la tabla de clientes y vendedores. Para ello digita y ejecuta:

```SQL
ALTER TABLE tb_venta ADD CONSTRAINT FK_CLIENTE
FOREIGN KEY (DNI) REFERENCES tb_cliente(DNI);

ALTER TABLE tb_venta ADD CONSTRAINT FK_VENDEDOR
FOREIGN KEY (MATRICULA) REFERENCES tb_vendedor(MATRICULA);
```
14. El nombre de la tabla también puede ser alterado tras la creación de la misma. Digita y ejecuta:

```SQL
USE ventas_jugos;
ALTER TABLE tb_venta RENAME tb_factura;
```

### Lo que aprendimos

Lo que aprendimos en esta aula:

- Aprendimos a crear una base de datos;
- Aprendimos a crear una tabla;
- La posibilidad de crear las tablas por un asistente;
- Vimos cómo crear las relaciones entre las tablas;
- Vimos que el nombre de la tabla también puede ser modificado tras su creación.

### Proyecto del aula anterior

¿Comenzando en esta etapa? Aquí puedes descargar los archivos del proyecto que hemos avanzado hasta el aula anterior.

[Descargue los archivos en Github](https://github.com/alura-es-cursos/1831-comandos-dml-manipulacion-de-datos-con-mysql/blob/aula-3/comandos.sql "Descargue los archivos en Github") o haga clic [aquí](https://github.com/alura-es-cursos/1831-comandos-dml-manipulacion-de-datos-con-mysql/archive/refs/heads/aula-3.zip "aquí") para descargarlos directamente.

### Haga lo que hicimos en aula

Llegó la hora de que sigas todos los pasos realizados por mí durante esta aula. En caso de que ya lo hayas hecho, excelente. Si aún no lo hiciste, es importante que ejecutes lo que fue visto en los videos para poder continuar con la siguiente aula.

1. Abre MySQL Workbench y crea un nuevo script de comandos SQL.

2. Para crear una base de datos podemos usar el comando CREATE. Digita el siguiente comando para crear una nueva base de datos:

```SQL
CREATE DATABASE ventas_jugos;
```
3. Podemos emplear algunas propiedades para definir el tipo de tabla de caracteres que puede ser usada para almacenar los datos en la base. Digita el siguiente comando para crear una base que utilice la tabla de caracteres **UTF32**, Si hay dudas si existe o no la base de datos, podemos usar el comando `IF NOT EXISTS.`:

```SQL
CREATE SCHEMA IF NOT EXISTS ventas_jugos2 DEFAULT CHARSET utf32;
```

4. Podemos eliminar una base de datos existente. Para ello digita el comando:

```SQL
DROP DATABASE ventas_jugos2;
```
5. Doble clic sobre la base de datos ventas_jugos para que la misma quede seleccionada. El nombre de ella debe estar resaltado en negrilla.

6. Crea un nuevo script de SQL y digita el comando:

```SQL
USE ventas_jugos;
```

Este comando forzará la selección de la base de datos `ventas_jugos`.

7. Vamos a crear la primera tabla en nuestra base de datos. Digita ejecuta:

```SQL
CREATE TABLE tb_producto(
CODIGO VARCHAR(10) NOT NULL,
DESCRIPCION VARCHAR(100) NULL,
SABOR VARCHAR(50) NULL,
TAMANO VARCHAR(50) NULL,
ENVASE VARCHAR(50) NULL,
PRECIO_LISTA FLOAT NULL,
PRIMARY KEY (CODIGO)
);
```
8. Vamos a crear la segunda tabla (vendedores). Digita:

```SQL
CREATE TABLE tb_vendedor(
MATRICULA VARCHAR(5) NOT NULL,
NOMBRE VARCHAR(100) NULL,
BARRIO VARCHAR(50) NULL,
COMISION FLOAT NULL,
FECHA_ADMISION DATE NULL,
DE_VACACIONES BIT(1) NULL,
PRIMARY KEY(MATRICULA)
);
```
9. Haz clic con el botón derecho del mouse sobre Table y selecciona la opción Create Table.

![](https://caelum-online-public.s3.amazonaws.com/1831-php-bdd/02/15.png)

10. Tenemos un cuadro de diálogo para crear una tabla a través de un asistente. Digita lo siguiente para crear la tabla de clientes y la tabla de items_facturas:

![](https://caelum-online-public.s3.amazonaws.com/1831-php-bdd/02/17.png)

![](https://caelum-online-public.s3.amazonaws.com/1831-php-bdd/02/16.png)

11. Confirma la creación de las tablas anteriores haciendo clic sobre el botón apply.

12. Vamos a crear una tabla adicional que es la tabla de ventas. Para ello, digita en un nuevo script:

```SQL
USE ventas_jugos;

CREATE TABLE tb_venta(
NUMERO VARCHAR(5) NOT NULL,
FECHA DATE NULL,
DNI VARCHAR(11) NOT NULL,
MATRICULA VARCHAR(5) NOT NULL,
IMPUESTO FLOAT,
PRIMARY KEY(NUMERO)
);
```

13. Podemos crear relaciones entre esta tabla y la tabla de clientes y vendedores. Para ello digita y ejecuta:

```SQL
ALTER TABLE tb_venta ADD CONSTRAINT FK_CLIENTE
FOREIGN KEY (DNI) REFERENCES tb_cliente(DNI);

ALTER TABLE tb_venta ADD CONSTRAINT FK_VENDEDOR
FOREIGN KEY (MATRICULA) REFERENCES tb_vendedor(MATRICULA);
```
14. El nombre de la tabla también puede ser alterado tras la creación de la misma. Digita y ejecuta:

```SQL
USE ventas_jugos;
ALTER TABLE tb_venta RENAME tb_factura;
```

### Lo que aprendimos

Lo que aprendimos en esta aula:

- Aprendimos a crear una base de datos;
- Aprendimos a crear una tabla;
- La posibilidad de crear las tablas por un asistente;
- Vimos cómo crear las relaciones entre las tablas;
- Vimos que el nombre de la tabla también puede ser modificado tras su creación.

### Proyecto del aula anterior

¿Comenzando en esta etapa? Aquí puedes descargar los archivos del proyecto que hemos avanzado hasta el aula anterior.

[Descargue los archivos en Github](https://github.com/alura-es-cursos/1831-comandos-dml-manipulacion-de-datos-con-mysql/blob/aula-3/comandos.sql "Descargue los archivos en Github") o haga clic [aquí](https://github.com/alura-es-cursos/1831-comandos-dml-manipulacion-de-datos-con-mysql/archive/refs/heads/aula-3.zip "aquí") para descargarlos directamente.

### Inclusión de registros en las tablas

Incluye los siguientes registros en la tabla de clientes:

DNI: 9283760794, NOMBRE: Edson Calisaya, DIRECCION: Sta Úrsula Xitla, BARRIO: Barrio del Niño Jesús, CIUDAD: Ciudad de México, ESTADO: EM, CP: 22002002, FECHA DE NACIMIENTO: 1995-01-07, EDAD: 25, SEXO: M, LIMITE DE CREDITO: 150000, VOLUMEN DE COMPRA: 250000, PRIMERA COMPRA: Sí.

DNI: 7771579779, NOMBRE: Marcelo Perez, DIRECCION: F.C. de Cuernavaca 13, BARRIO: Carola, CIUDAD: Ciudad de México, ESTADO: EM, CP: 88202912, FECHA DE NACIMIENTO: 1992-01-25, EDAD: 29, SEXO: M, LIMITE DE CREDITO: 70000, VOLUMEN DE COMPRA: 160000, PRIMERA COMPRA: Sí.

DNI: 5576228758, NOMBRE: Patricia Olivera, DIRECCION: Pachuca 75, BARRIO: Condesa, CIUDAD: Ciudad de México, ESTADO: EM, CP: 88192029, FECHA DE NACIMIENTO: 1995-01-14 , EDAD: 25, SEXO: F, LIMITE DE CREDITO: 70000, VOLUMEN DE COMPRA: 160000, PRIMERA COMPRA: Sí.

```SQL
INSERT INTO TABLA_DE_CLIENTES (DNI, NOMBRE, DIRECCION, BARRIO, CIUDAD, ESTADO, CP, FECHA_NACIMIENTO, EDAD, SEXO, LIMITE_CREDITO, VOLUMEN_COMPRA, PRIMERA_COMPRA) VALUES ('9283760794', 'Edson Calisaya', 'Sta Úrsula Xitla', 'Barrio del Niño Jesús', 'Ciudad de México', 'EM', '22002002', '1995-01-07', 25, 'M', 150000, 250000, 1);
INSERT INTO TABLA_DE_CLIENTES (DNI, NOMBRE, DIRECCION, BARRIO, CIUDAD, ESTADO, CP, FECHA_NACIMIENTO, EDAD, SEXO, LIMITE_CREDITO, VOLUMEN_COMPRA, PRIMERA_COMPRA) VALUES ('7771579779', 'Marcelo Perez', 'F.C. de Cuernavaca 13', 'Carola', 'Ciudad de México', 'EM', '88202912', '1992-01-25', 29, 'M', 120000, 200000, 1);
INSERT INTO TABLA_DE_CLIENTES (DNI, NOMBRE, DIRECCION, BARRIO, CIUDAD, ESTADO, CP, FECHA_NACIMIENTO, EDAD, SEXO, LIMITE_CREDITO, VOLUMEN_COMPRA, PRIMERA_COMPRA) VALUES ('5576228758', 'Patricia Olivera', 'Pachuca 75',  'Condesa', 'Ciudad de México', 'EM', '88192029', '1995-01-14', 25, 'F', 70000, 160000, 1);
```

### Inclusión de registros a partir de otra tabla

Incluye todos los clientes en la tabla `tb_clientes` basado en los registros de la tabla `tabla_de_clientes` de la base `jugos_ventas`.

Observación: Atención al nombre de los campos y recuerda que ya incluimos 3 clientes en nuestra tabla durante el ejercicio anterior.

```SQL
USE ventas_jugos;

INSERT INTO tb_clientes
SELECT DNI, NOMBRE, DIRECCION_1 AS DIRECCION,
BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO 
AS FECHA_NACIMIENTO, EDAD, SEXO, LIMITE_DE_CREDITO
AS LIMITE_CREDITO, VOLUMEN_DE_COMPRA AS VOLUMEN_COMPRA,
PRIMERA_COMPRA FROM jugos_ventas.tabla_de_clientes
WHERE DNI NOT IN (SELECT DNI FROM tb_clientes);
```

### Haga lo que hicimos en aula

Llegó la hora de que sigas todos los pasos realizados por mí durante esta aula. En caso de que ya lo hayas hecho, excelente. Si aún no lo hiciste, es importante que ejecutes lo que fue visto en los videos para poder continuar con la siguiente aula.

1. Vamos a crear un nuevo script SQL en Workbench.

2. Ahora, vamos a insertar un nuevo producto. Digita:

```SQL
USE ventas_jugos;
INSERT INTO tb_producto (CODIGO, DESCRIPCION, SABOR, TAMANO, ENVASE,
PRECIO_LISTA) VALUES ('1040107', 'Light', 'Sandía', '350 ml', 'Lata', 4.56);
```

3. Debemos confirmar si el producto fue incluido en la tabla. Digita y ejecuta:

```SQL
SELECT * FROM tb_producto;
```

4. En el script, podemos incluir un comando INSERT más. Digita y ejecuta:

```SQL
INSERT INTO tb_producto (CODIGO, SABOR, DESCRIPCION, TAMANO, ENVASE,
PRECIO_LISTA) VALUES ('1040108', 'Guanábana', 'Light', '350 ml', 'Lata', 4.00);
```

5. Tambíén podemos, en un mismo comando, incluir más de un registro. Digita y ejecuta:

```SQL
INSERT INTO tb_producto VALUES 
('1040109', 'Light', 'Asaí', '350 ml', 'Lata', 5.60), 
('1040110', 'Light', 'Manzana', '350 ml', 'Lata', 6.00),
('1040111', 'Light', 'Mango', '350 ml', 'Lata', 3.50);
```

6. Descarga el archivo adjunto `RecuperacionAmbiente.rar`.

7. Descompacta el archivo.

8. Selecciona la pestaña **Administration**, en el área Navigator.

9. Selecciona el link **Data Import/Restore**.

10. En la opción **Import From Dump Project Folder** escoge el directorio **DumpJugosVentas**.

11. Haz clic sobre el botón **Start Import**.

12. Verifica en la base `jugos_ventas` se las tablas fueron creadas.

13. Podemos acceder a la base `jugos_ventas` desde `ventas_jugos`. La forma de hacerlo es empleando los siguientes comandos:

```SQL
USE ventas_jugos;
SELECT * FROM jugos_ventas.tabla_de_productos;
```

14. La siguiente consulta, muestra la lista de productos, en la tabla `tabla_de_productos`, de la base `jugos_ventas` los cuales aún no fueron incluidos en tb_productos, de la base `ventas_jugos`:

```SQL
SELECT CODIGO_DEL_PRODUCTO AS CODIGO, NOMBRE_DEL_PRODUCTO AS DESCRIPCION,
SABOR, TAMANO, ENVASE, PRECIO_DE_LISTA AS PRECIO_LISTA 
FROM jugos_ventas.tabla_de_productos
WHERE CODIGO_DEL_PRODUCTO NOT IN (SELECT CODIGO FROM tb_producto);
```

15. Con ayuda del comando INSERT podemos incluir los productos desde la tabla `jugos_ventas.tabla_de_productos` hacia la tabla `ventas_jugos.tb_producto`. Digita y ejecuta:

```SQL
INSERT INTO tb_producto
SELECT CODIGO_DEL_PRODUCTO AS CODIGO, NOMBRE_DEL_PRODUCTO AS DESCRIPCION,
SABOR, TAMANO, ENVASE, PRECIO_DE_LISTA AS PRECIO_LISTA 
FROM jugos_ventas.tabla_de_productos
WHERE CODIGO_DEL_PRODUCTO NOT IN (SELECT CODIGO FROM tb_producto);
```

16. Vamos a confirmar el contenido de tb_producto. Digita y ejecuta:

```SQL
SELECT * FROM tb_producto;
```
![](https://caelum-online-public.s3.amazonaws.com/1831-php-bdd/03/19.png)

17. Ahora, vamos a incluir clientes en la tabla `tb_cliente`. Digita y ejecuta:

```SQL
SELECT * FROM tb_cliente;
```

¿Cuántos clientes hay en la tabla?

18. Al lado derecho de donde aparece la tabla aparece el botón **Form Editor**. Allí tendremos un formulario para editar la tabla de clientes:

![](https://caelum-online-public.s3.amazonaws.com/1831-php-bdd/03/20.png)

19. Incluye un nuevo cliente:

DNI: 1471156710; NOMBRE: Erica Carvajo; DIRECCION: Heriberto Frías 1107; BARRIO: Del Valle; CIUDAD: Ciudad de Mexico; ESTADO: EM; CP: 80012212; FECHA_NACIMIENTO: 1990-03-01; IDADE: 30; SEXO: F; LIMITE_CREDITO: 170000; VOLUME_COMPRA: 24500; PRIMEIRA_COMPRA: 1;

20. Confirma su inclusión haciendo clic sobre apply.

21. Ejecuta la consulta nuevamente. Digita y ejecuta:

```SQL
SELECT * FROM tb_cliente;
```

¿El cliente fue incluido?

22. Vamos a incluir a los clientes usando como fuente nuestra otra base de datos. Digita y ejecuta:

```SQL
INSERT INTO tb_cliente
SELECT DNI, NOMBRE, DIRECCION_1 AS DIRECCION,
BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO 
AS FECHA_NACIMIENTO, EDAD, SEXO, LIMITE_DE_CREDITO
AS LIMITE_CREDITO, VOLUMEN_DE_COMPRA AS VOLUMEN_COMPRA,
PRIMERA_COMPRA FROM jugos_ventas.tabla_de_clientes
WHERE DNI NOT IN (SELECT DNI FROM tb_cliente);
```

23. Verfica el contenido de tb_cliente:

```SQL
SELECT * FROM tb_cliente;
```

![](https://caelum-online-public.s3.amazonaws.com/1831-php-bdd/03/21.png)

24. Vamos a mostrar ahora como incluir datos en la tabla `tb_vendedor` através de archivos externos. En los archivos que descargaste al preparar el ambiente, aparece dentro de la carpeta RecuperacionAmbiente un archivo llamado `vendedores.csv`.

25. Haz clic con el botón derecho del mouse sobre la tabla `tb_vendedor` y escoge la opción **Table Data Import Wizard**.

![](https://caelum-online-public.s3.amazonaws.com/1831-php-bdd/03/22.png)

26. En File Path selecciona el archivo vendedores.csv.

27. Mantenga los datos por defecto.

28. Pueden existir problemas entre computadores y entre los archivos descargados. Debes ver la combinación correta entre el formato del archivo (Que puede ser modificado en el NOTEPAD clásico) y en el cuadro de diálogo de importación de datos.

![](https://caelum-online-public.s3.amazonaws.com/1831-php-bdd/03/8.png)

29. Desmarca la opción VACACIONES:

30. Clic en Next varias veces hasta que los datos sean incluidos en `tb_vendedor`.

31. Verifica el contenido de la tabla `tb_vendedor`:

```SQL
SELECT * FROM tb_vendedor;
```
¿Cuántos vendedores quedaron registrados en la tabla?

### Lo que aprendimos

Lo que aprendimos en esta aula:

- Aprendimos a incluir datos en una tabla, a través de comandos;
- Vimos la inclusión de varios registros en un único comando;
- Fue mostrado cómo incluir datos en la tabla a través de un asistente;
- Mostramos cómo incluir datos usando un archivo externo.

### Proyecto del aula anterior

¿Comenzando en esta etapa? Aquí puedes descargar los archivos del proyecto que hemos avanzado hasta el aula anterior.

[Descargue los archivos en Github](https://github.com/alura-es-cursos/1831-comandos-dml-manipulacion-de-datos-con-mysql/blob/aula-4/comandos.sql "Descargue los archivos en Github") o haga clic [aquí](https://github.com/alura-es-cursos/1831-comandos-dml-manipulacion-de-datos-con-mysql/archive/refs/heads/aula-4.zip "aquí") para descargarlos directamente.

### Alterando datos en la tabla de clientes

Actualiza la dirección del cliente con el DNI 5840119709 Colocando como nueva dirección Jorge Emilio 23, barrio San Antonio, ciudad Guadalajara, Estado de Jalisco y el CP 44700000.

```SQL
UPDATE tb_clientes SET 
DIRECCION = 'Jorge Emilio 23',
BARRIO = 'San Antonio',
CIUDAD = 'Guadalajara',
ESTADO = 'JC',
CEP = '44700000'
WHERE DNI = '5840119709'
```

### Modificando el volumen de compra

Podemos observar que los vendedores se encuentran en barrios asociados a ellos. Vamos a aumentar en 30% el volumen de compra de los clientes que tienen, en sus direcciones, barrios donde los vendedores cuentan con oficinas.

Tip: Vamos a usar un UPDATE con FROM apoyándonos con el siguiente INNER JOIN:

```SQL
SELECT A.DNI FROM tb_clientes A
INNER JOIN tb_vendedor B
ON A.BARRIO = B.BARRIO
```

```SQL
UPDATE tb_clientes A 
INNER JOIN 
tb_vendedor B
ON A.BARRIO = B.BARRIO
SET A.VOLUMEN_COMPRA = A.VOLUMEN_COMPRA * 1.3
```

### Excluyendo facturas

Vamos a excluir las facturas (Apenas el encabezado) cuyos clientes tengan menos de 18 años.

Tip: Usaremos la siguiente consulta:

```SQL
SELECT A.DNI FROM tb_clientes A
INNER JOIN tb_vendedor B
ON A.BARRIO = B.BARRIO
```

Puedes usar una sintaxis semejante a la usada en UPDATE con FROM.

```SQL
DELETE A FROM tb_facturas A
INNER JOIN 
tb_clientes B 
ON A.DNI = B.DNI
WHERE B.EDAD < 18;
```

### Haga lo que hicimos en aula

Llegó la hora de que sigas todos los pasos realizados por mí durante esta aula. En caso de que ya lo hayas hecho, excelente. Si aún no lo hiciste, es importante que ejecutes lo que fue visto en los videos para poder continuar con la siguiente aula.

1. Vamos a verificar la tabla `tb_producto`.

```SQL
SELECT * FROM tb_producto;
```

2. Vamos a alterar el precio de lista de uno de los productos:

```SQL
UPDATE tb_producto SET PRECIO_LISTA= 5 WHERE CODIGO = '1000889';
```

3. Podemos alterar los datos de la tabla en forma de lote. Digita y ejecuta:

```SQL
UPDATE tb_producto SET DESCRIPCION= 'Sabor de la Montaña',
TAMANO= '1 Litro', ENVASE = 'Botella PET' WHERE 
CODIGO = '1000889';
```

4. También podemos alterar algún campo basados en el mismo campo que será alterado. Digita e ejecuta:

```SQL
SELECT * FROM tb_cliente;
UPDATE tb_cliente SET VOLUMEN_COMPRA = VOLUMEN_COMPRA/10;
```

5. Al igual que incluimos datos en la tabla basados en los datos de otra tabla, podemos también alterar datos de esta misma manera. Digita e ejecuta:

```SQL
USE ventas_jugos;

UPDATE tb_vendedor A
INNER JOIN
jugos_ventas.tabla_de_vendedores B
ON A.MATRICULA = SUBSTRING(B.MATRICULA,3,3)
SET A.DE_VACACIONES = B.VACACIONES;
```

6. Es posible eliminar datos de la tabla. Antes de ello vamos a incluir nuevos registros que después serán excluidos. Digita e ejecuta:

```SQL
INSERT INTO tb_producto (CODIGO,DESCRIPCION,SABOR,TAMANO,ENVASE,PRECIO_LISTA) 
VALUES ('1001001','Sabor Alpino','Mango','700 ml','Botella',7.50),
         ('1001000','Sabor Alpino','Melón','700 ml','Botella',7.50),
         ('1001002','Sabor Alpino','Guanábana','700 ml','Botella',7.50),
         ('1001003','Sabor Alpino','Mandarina','700 ml','Botella',7.50),
         ('1001004','Sabor Alpino','Banana','700 ml','Botella',7.50),
         ('1001005','Sabor Alpino','Asaí','700 ml','Botella',7.50),
         ('1001006','Sabor Alpino','Mango','1 Litro','Botella',7.50),
         ('1001007','Sabor Alpino','Melón','1 Litro','Botella',7.50),
         ('1001008','Sabor Alpino','Guanábana','1 Litro','Botella',7.50),
         ('1001009','Sabor Alpino','Mandarina','1 Litro','Botella',7.50),
         ('1001010','Sabor Alpino','Banana','1 Litro','Botella',7.50),
         ('1001011','Sabor Alpino','Asaí','1 Litro','Botella',7.50);
```

7. Vamos a eliminar solamente un registro. Digita e ejecuta:

```SQL
DELETE FROM tb_producto WHERE CODIGO = '1001000';
```

8. Podemos aplicar un filtro para seleccionar datos que serán excluidos. Digita e ejecuta:

```SQL
DELETE FROM tb_producto WHERE TAMANO = '1 Litro';
```

9. Otra forma es eliminar usando la selección de datos de otra tabla. Digita e ejecuta:

```SQL
DELETE FROM tb_producto
WHERE CODIGO NOT IN (SELECT CODIGO_DEL_PRODUCTO 
FROM jugos_ventas.tabla_de_productos);
```

10. Los comandos UPDATE y DELETE pueden ser ejecutados sobre toda la tabla. Vamos entonces a crear una tabla de forma temporal para después alterarla y eliminarla. Digita y ejecuta:

```SQL
CREATE TABLE `tb_producto2` (
  `CODIGO` varchar(10) NOT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  `SABOR` varchar(50) DEFAULT NULL,
  `TAMANO` varchar(50) DEFAULT NULL,
  `ENVASE` varchar(50) DEFAULT NULL,
  `PRECIO_LISTA` float DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
);
```

11. Después, vamos a incluir datos en nuestra tabla tb_producto2:

```SQL
INSERT INTO tb_producto2
SELECT * FROM tb_producto;
```

12. Altera los datos para toda la tabla:

```SQL
UPDATE tb_producto2 SET PRECIO_LISTA = PRECIO_LISTA* 1.15;
```

13. El siguiente comando elimina todos los registros de la tabla. Digita el siguiente comando e ejecútalo para eliminar todos los datos de la tabla:

```SQL
DELETE FROM tb_producto2;
```

14. Vamos a iniciar una transacción. Digita el siguiente comando e ejecútalo para crear una transacción:

```SQL
START TRANSACTION;
```

15. Vamos a insertar 3 registros en la tb_vendedor:

```SQL
INSERT INTO `ventas_jugos`.`tb_vendedor`
(`MATRICULA`,
`NOMBRE`,
`BARRIO`,
`COMISION`,
`FECHA_ADMISION`,
`DE_VACACIONES`)
VALUES
('256',
'Fernando Ruiz',
'Oblatos',
0.1,
'2015-06-14',
0);
INSERT INTO `ventas_jugos`.`tb_vendedor`
(`MATRICULA`,
`NOMBRE`,
`BARRIO`,
`COMISION`,
`FECHA_ADMISION`,
`DE_VACACIONES`)
VALUES
('257',
'Fernando Rojas',
'Oblatos',
0.1,
'2015-06-14',
0);

INSERT INTO `ventas_jugos`.`tb_vendedor`
(`MATRICULA`,
`NOMBRE`,
`BARRIO`,
`COMISION`,
`FECHA_ADMISION`,
`DE_VACACIONES`)
VALUES
('258',
'David Rojas',
'Del Valle',
0.15,
'2015-06-14',
0);
```

16. Modifica los datos referentes a la comisión. Digita y ejecuta:

```SQL
UPDATE tb_vendedor SET COMISION = COMISION * 1.05;
```

17. Vamos a rechazar los anteriores comandos. Digita y ejecuta:

```SQL
ROLLBACK;
```

18. Verifica la tabla. Digita y ejecuta:

```SQL
SELECT * FROM tb_vendedores;
```

¿Cuántos vendedores hay en tu tabla?

19. Vamos a repetir la modificación iniciando una nueva transacción. Digita y ejecuta:

```SQL
START TRANSACTION;

INSERT INTO `ventas_jugos`.`tb_vendedor`
(`MATRICULA`,
`NOMBRE`,
`BARRIO`,
`COMISION`,
`FECHA_ADMISION`,
`DE_VACACIONES`)
VALUES
('257',
'Fernando Rojas',
'Oblatos',
0.1,
'2015-06-14',
0);

INSERT INTO `ventas_jugos`.`tb_vendedor`
(`MATRICULA`,
`NOMBRE`,
`BARRIO`,
`COMISION`,
`FECHA_ADMISION`,
`DE_VACACIONES`)
VALUES
('258',
'David Rojas',
'Del Valle',
0.15,
'2015-06-14',
0);

UPDATE tb_vendedor SET COMISION = COMISION * 1.05;

SELECT * FROM tb_vendedor;
```

20. Ahora, confirmaremos la inclusión de estos datos. Para ello digita:

```SQL
COMMIT;
```

21. Verifica nuevamente la tabla. Para ello digita:

```SQL
SELECT * FROM tb_vendedor;
```

### Lo que aprendimos

Lo que aprendimos en esta aula:

- A alterar y a excluir datos de una tabla, a través de comando o en lotes;
- Vimos que podemos alterar o excluir todos los datos de una tabla;
- Lo que es una transacción y como podemos deshacer modificaciones efectuadas anteriormente en la base de datos.

### Proyecto del aula anterior

¿Comenzando en esta etapa? Aquí puedes descargar los archivos del proyecto que hemos avanzado hasta el aula anterior.

[Descargue los archivos en Github](https://github.com/alura-es-cursos/1831-comandos-dml-manipulacion-de-datos-con-mysql/blob/aula-5/comandos.sql "Descargue los archivos en Github") o haga clic [aquí](https://github.com/alura-es-cursos/1831-comandos-dml-manipulacion-de-datos-con-mysql/archive/refs/heads/aula-5.zip "aquí") para descargarlos directamente.

### Valor de la secuencia

¿Cuál será el valor final de la secuencia tras la ejecución de los siguientes comandos?

```SQL
CREATE TABLE TAB_IDENTITY2 (ID INT AUTO_INCREMENT, DESCRIPTOR VARCHAR(20), PRIMARY KEY(ID));
INSERT INTO TAB_IDENTITY2 (DESCRIPTOR) VALUES ('CLIENTE1');
INSERT INTO TAB_IDENTITY2 (DESCRIPTOR) VALUES ('CLIENTE2');
INSERT INTO TAB_IDENTITY2 (DESCRIPTOR) VALUES ('CLIENTE3');
INSERT INTO TAB_IDENTITY2 (ID, DESCRIPTOR) VALUES (NULL, 'CLIENTE4');
DELETE FROM TAB_IDENTITY2 WHERE ID = 3;
INSERT INTO TAB_IDENTITY2 (ID, DESCRIPTOR) VALUES (NULL, 'CLIENTE6');
INSERT INTO TAB_IDENTITY2 (ID, DESCRIPTOR) VALUES (NULL, 'CLIENTE7');
DELETE FROM TAB_IDENTITY2 WHERE ID = 2;
```

El valor final de la secuencia será 6.

### Calculando la edad del cliente

El siguiente comando SQL calcula la edad actual del cliente:

```SQL
SELECT DNI, EDAD, FECHA_NACIMIENTO, timestampdiff(YEAR, FECHA_NACIMIENTO, NOW()) AS ANOS FROM tb_clientes;
```

Construye un TRIGGER (Lo llamaremos TG_EDAD_CLIENTES_INSERT) que actualiza las edades de los clientes, en la tabla de clientes, siempre que la tabla sufra una inclusión.

```SQL
DELIMITER //
CREATE TRIGGER TG_EDAD_CLIENTES_INSERT 
BEFORE INSERT ON tb_clientes
FOR EACH ROW BEGIN
SET NEW.EDAD = timestampdiff(YEAR, NEW.FECHA_NACIMIENTO, NOW());
END//
```
