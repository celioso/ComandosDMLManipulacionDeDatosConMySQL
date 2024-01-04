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

