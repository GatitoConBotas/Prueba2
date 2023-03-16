CREATE SCHEMA minimarket;     #creamos el esquema

USE minimarket;        #usamos este comando para poder ingresar a la tabla

CREATE TABLE Producto (                                 #Tabla de los productos
	producto_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(25),
    precioCompra MEDIUMINT,
    categoria_id INTEGER NOT NULL
    );
    
    
    
    CREATE TABLE Proveedor (
	proveedor_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(25),
    direcion VARCHAR (50),
    comuna VARCHAR (20),
    telefono INTEGER,
    rut INTEGER NOT NULL
    );
    
    
    #primero se deben crear las tablas producto y proveedor para poder crear esta tabla
    CREATE TABLE ProductoProveedor (   
	ProductoProveedor_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    producto_id INTEGER NOT NULL,
    proveedor_id INTEGER NOT NULL
    
);



    CREATE TABLE FechaDeVisita (   
	fechaDeVisita_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	proveedor_id INTEGER NOT NULL,
	fecha  DATE

);



    CREATE TABLE Cliente (
	cliente_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(25),
    direcion VARCHAR (50),
    comuna VARCHAR (20),
    telefono INTEGER,
    rut INTEGER
    );
    
    
	CREATE TABLE Boleta(
	boleta_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nro_boleta MEDIUMINT,
	fecha_hora DATETIME,
	total DOUBLE,
    cliente_id INTEGER NOT NULL
);


	CREATE TABLE inventario(
	inventario_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	producto_id INTEGER NOT NULL,
	stock SMALLINT,
	precio_venta DOUBLE
);

	CREATE TABLE Categoria(
	categoria_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nombre VARCHAR(25)
    );
	
ALTER TABLE Producto ADD categoria_id INTEGER NOT NULL;



#Ya creadas las tablas podemos continuar con las foreign key 

ALTER TABLE ProductoProveedor
ADD FOREIGN KEY (producto_id) REFERENCES Producto (producto_id);

ALTER TABLE ProductoProveedor
ADD FOREIGN KEY (proveedor_id)  REFERENCES Proveedor (proveedor_id);

ALTER TABLE FechaDeVisita
ADD FOREIGN KEY (proveedor_id)  REFERENCES Proveedor (proveedor_id);

ALTER TABLE Boleta
ADD FOREIGN KEY (cliente_id)  REFERENCES Cliente (cliente_id);

ALTER TABLE inventario
ADD FOREIGN KEY (producto_id)  REFERENCES producto (producto_id);

ALTER TABLE Producto
ADD FOREIGN KEY (categoria_id)  REFERENCES Categoria (categoria_id);

#Comenzamos a llenar las tablas

INSERT INTO Categoria ( nombre)
VALUES("frutas"), ("verduras") ,("snacks"), ("bebidas"),("congelados");

INSERT INTO Producto (nombre, precioCompra,categoria_id) 
VALUES("malla de tomates", 580, 2) ,("malla de paltas", 2400, 2) ,("mani chico 200g", 980, 3) ,("pepsi 1.5L", 990, 4) ,("pap 1.5L", 990, 4) ,("nordic 1.5L", 1080, 4);

INSERT INTO Proveedor(nombre,direcion,comuna, telefono, rut) 
VALUES("distribuidora_juana","macul 3030", "macul",98833529, 823944432),("distribuidora_diego", "avenida la paz 3030", "recoleta",988445294, 825244112) ,("comercializadora_santiago","grecia 1515","nunoa",988005334,741244110);

INSERT INTO ProductoProveedor (producto_id, proveedor_id)
VALUES(1, 2) ,(2, 3) ,(3,1) ,(4,2) ,(5,2) ,(6,2);

INSERT INTO cliente (nombre, direcion, comuna, telefono, rut )
VALUES("juan munoz", "grecia 1010", "nunoa", 955447182, 197832932 ) ,("esteban garcia", "macul 1212", "macul", 955337182, 199992932 ), ("gabriela sepulveda", "avenida la florida 0808", "la florida", 955333332, 219992932 ), ("felipe perez", "las estrellas 2020", "la florida", 944311332, 208892932 ), ("javiera gomez", "antonio varas 2233", "providencia", 966774253, 187724444-2 )

INSERT INTO inventario (producto_id,stock,  precio_venta)
VALUES(1, 12,1600) ,(2, 5,5000) ,(3,5,2000 ) ,(4,4,2000) ,(5,10,2000) ,(6,6,2000);


# consulta para revisar el inventario
SELECT * FROM inventario;

# consulta para revisar proveedores
SELECT * FROM Proveedor;

# consulta con join de tabla de precio de compra y precio de venta junto a su stock
SELECT producto.precioCompra, producto.nombre, inventario.precio_venta,inventario.stock
FROM producto JOIN inventario ON producto.producto_id = inventario.producto_id ;

#con el join anterior tambien se pueden sacar las ganacias de cada producto para obtener las ganancias anuales 






    



    
    
    