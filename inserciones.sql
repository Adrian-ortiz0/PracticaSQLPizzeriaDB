INSERT INTO Productos (Nombre, Descripcion, Precio, Categoria) VALUES
('Pizza Margarita', 'Clásica pizza con tomate y mozzarella', 10.99, 'pizza'),
('Panzarotti de Carne', 'Panzarotti relleno de carne molida', 8.99, 'panzerotti'),
('Coca-Cola', 'Refresco de cola', 2.50, 'bebida'),
('Tiramisú', 'Postre italiano de café', 5.99, 'postre');

select * from Productos;

INSERT INTO Ingredientes (Nombre) VALUES
('Masa de pizza'), ('Salsa de tomate'), ('Mozzarella'), ('Carne molida');

INSERT INTO ProductoIngrediente (Id_Producto, Id_Ingrediente) VALUES
(1, 1), (1, 2), (1, 3), (2, 4);

INSERT INTO Adicionales (Nombre, Precio) VALUES
('Extra queso', 1.50),
('Champiñones', 1.00),
('Aceitunas', 1.00),
('Cebolla', 0.75);

INSERT INTO Combos (Nombre, Descripcion, Precio) VALUES
('Combo Familiar', '2 pizzas grandes, 1 bebida familiar y 1 postre', 29.99),
('Combo Pareja', '1 pizza mediana, 2 bebidas y 2 postres', 19.99),
('Combo Individual', '1 panzarotti, 1 bebida y 1 postre', 14.99),
('Combo Fiesta', '3 pizzas grandes, 2 bebidas familiares y 2 postres', 39.99);

INSERT INTO ComboProducto (Id_Combo, Id_Producto, Cantidad) VALUES
(1, 1, 2), (1, 3, 1), (1, 2, 1);

INSERT INTO Clientes (Nombre,Telefono,Email) VALUES
('Adrian', 317310, "dxniel7328@gmail.com"),
('Daniel', 315879, "correo@gmail.com"),
('Yuli', 315465, "correito@gmail.com"),
('Stefany', 45353, "stefany@gmail.com");

INSERT INTO Pedidos (Id_Cliente, FechaPedido, Tipo, Estado, NumeroPedido ,Total) VALUES
(1, '2024-10-04', 'consumir', 'listo', 123 ,29.99),
(2, '2024-10-04', 'recoger', 'listo', 456 ,19.99),
(3, '2024-10-04', 'consumir', 'preparando', 789 ,14.99),
(4, '2024-10-04', 'recoger', 'pendiente', 1023 ,39.99);



INSERT INTO DetallesPedidos (Id_Pedido, Id_Producto, Id_Combo, cantidad, precioUnitario) VALUES
(1, 2, 1, 1, 29.99),
(2, 1, 2, 1, 19.99),
(3, 3, 3, 1, 14.99),
(4, 1, 4, 1, 39.99);


INSERT INTO PedidoAdicion (Id_DetallePedido, Id_Adicional) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);


INSERT INTO Menu (Id_Producto, Id_Combo, Disponibilidad) VALUES
(1, 2, TRUE),
(2, 2, TRUE),
(3, 2, TRUE),
(4, 1, TRUE);