CREATE DATABASE IF NOT EXISTS CampusPizza;

USE CampusPizza;

CREATE TABLE IF NOT EXISTS Productos(
	Id_Producto int primary key auto_increment,
    Nombre varchar(50),
    Descripcion text,
    Precio float not null,
    Categoria enum("pizza", "panzerotti", "bebida", "postre", "otro")
);


CREATE TABLE IF NOT EXISTS Ingredientes(
	Id_Ingrediente int primary key auto_increment,
    Nombre varchar(50) not null
);

CREATE TABLE IF NOT EXISTS ProductoIngrediente(
	Id_Producto int,
    Id_Ingrediente int,
    PRIMARY KEY (Id_Producto, Id_Ingrediente),
    FOREIGN KEY (Id_Ingrediente) REFERENCES Ingredientes(Id_Ingrediente),
    FOREIGN KEY (Id_Producto) REFERENCES Productos(Id_Producto)
);

CREATE TABLE IF NOT EXISTS Adicionales(
	Id_Adicional int primary key auto_increment,
    Nombre varchar(50) not null,
    Precio FLOAT not null
);


CREATE TABLE IF NOT EXISTS Combos(
	Id_Combo int primary key auto_increment,
    Nombre varchar(50),
    Descripcion text,
    Precio float not null,
    Id_Producto int,
	FOREIGN KEY (Id_Producto) REFERENCES Productos(Id_Producto)
);

CREATE TABLE IF NOT EXISTS ComboProducto(
	Id_Producto int,
    Id_Combo int,
    Cantidad int not null,
	PRIMARY KEY (Id_Producto, Id_Combo),
	FOREIGN KEY (Id_Producto) REFERENCES Productos(Id_Producto),
    FOREIGN KEY (Id_Combo) REFERENCES Combos(Id_Combo)
);

CREATE TABLE IF NOT EXISTS Clientes(
	Id_Cliente int primary key auto_increment,
    Nombre varchar(50),
    Telefono INT NOT NULL,
    Email varchar(50)
);


 
CREATE TABLE IF NOT EXISTS Pedidos(
	Id_Pedido int primary key auto_increment,
	NumeroPedido INT NOT NULL,
    FechaPedido DATE NOT NULL,
    Tipo enum("consumir", "recoger"),
    Estado enum("pendiente", "preparando", "listo"),
    Id_Cliente INT,
    Total FLOAT NOT NULL,
    FOREIGN KEY (Id_Cliente) REFERENCES Clientes(Id_Cliente)
);

CREATE TABLE IF NOT EXISTS DetallesPedidos(
	Id_DetallePedido int primary key auto_increment,
    Id_Pedido int,
    Id_Producto int,
    Id_Combo int,
    cantidad int not null,
    precioUnitario float not null,
    FOREIGN KEY (Id_Pedido) REFERENCES Pedidos(Id_Pedido),
    FOREIGN KEY (Id_Producto) REFERENCES Productos(Id_Producto),
    FOREIGN KEY (Id_Combo) REFERENCES Combos(Id_Combo)
);

CREATE TABLE IF NOT EXISTS PedidoAdicion(
	Id_DetallePedido int,
    Id_Adicional int,
    primary key(Id_DetallePedido, Id_Adicional),
    FOREIGN KEY (Id_DetallePedido) REFERENCES DetallesPedidos(Id_DetallePedido),
    FOREIGN KEY (Id_Adicional) REFERENCES Adicionales(Id_Adicional)
);

CREATE TABLE IF NOT EXISTS Menu(
	Id_Menu int primary key auto_increment,
	Id_Producto int,
    Id_Combo int,
    Disponibilidad boolean,
    FOREIGN KEY (Id_Producto) REFERENCES Productos(Id_Producto),
    FOREIGN KEY (Id_Combo) REFERENCES Combos(Id_Combo)
);