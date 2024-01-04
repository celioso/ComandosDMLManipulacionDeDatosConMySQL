USE ventas_jugos;

CREATE TABLE tb_vendesor(
MATRICULA VARCHAR(5) NOT NULL,
NOMBRE VARCHAR(100) NULL,
BARRIO VARCHAR(50) NULL,
COMISION FLOAT NULL,
FECHA_ADMISION DATE NULL,
DE_VACACIONES BIT(1) NULL,
PRIMARY KEY (MATRICULA)
);

CREATE TABLE tb_producto(
CODIGO VARCHAR(10) NOT NULL,
DESCRIPCION VARCHAR(100) NULL,
SABOR VARCHAR(50) NULL,
TAMAÑO VARCHAR(50) NULL,
ENVASE VARCHAR(50) NULL,
PRECIO_LISTA FLOAT NULL,
PRIMARY KEY (CODIGO)
);

CREATE TABLE cliente(
DNI VARCHAR(11) NOT NULL,
NOMBRE VARCHAR(100) DEFAULT NULL,
DIRECCION VARCHAR(150) DEFAULT NULL,
BARRIO VARCHAR(50) DEFAULT NULL,
ESTADO VARCHAR(50) DEFAULT NULL,
CP VARCHAR(8) DEFAULT NULL,
FECHA_NACIMIENTO DATE DEFAULT NULL,
EDAD INT(2) DEFAULT NULL,
SEXO VARCHAR(1) DEFAULT NULL,
LIMITE_CREDITO FLOAT DEFAULT NULL,
VOLUMEN_COMPRA FLOAT DEFAULT NULL,
PRIMERA_COMPRA BIT(1) DEFAULT NULL,
PRIMARY KEY(DNI)
);

drop table tb_cliente;