USE ventas_jugos;

CREATE TABLE tb_items_facturas(
NUMERO VARCHAR(5) NOT NULL,
CODIGO VARCHAR(10) NOT NULL,
CANTIDAD INT,
PRECIO FLOAT,
PRIMARY KEY (NUMERO, CODIGO)
);

ALTER TABLE tb_items_facturas ADD CONSTRAINT FK_FACTURA
FOREIGN KEY (NUMERO) REFERENCES tb_factura(NUMERO);

ALTER TABLE tb_items_facturas ADD CONSTRAINT FK_PRODUCTO
FOREIGN KEY (CODIGO) REFERENCES tb_producto(CODIGO);

/* Solucion del profe*/
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