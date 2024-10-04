-- 1. Productos más vendidos (pizza, panzarottis, bebidas, etc.)

SELECT Productos.Nombre, Productos.Categoria, COUNT(*) AS Total
FROM DetallesPedidos
JOIN Productos ON DetallesPedidos.Id_Producto = Productos.Id_Producto
GROUP BY Productos.Id_Producto, Productos.Nombre ,Productos.Categoria
ORDER BY Total DESC;

-- 2. Total de ingresos generados por cada combo

SELECT Combos.Nombre, SUM(DetallesPedidos.cantidad * DetallesPedidos.precioUnitario) AS TotalIngreso
FROM DetallesPedidos
JOIN Combos ON DetallesPedidos.Id_Combo = Combos.Id_Combo
GROUP BY Combos.Id_Combo, Combos.Nombre
ORDER BY TotalIngreso;

-- 3. Pedidos realizados para recoger vs. comer en la pizzería

SELECT Tipo, COUNT(*) AS Total
FROM Pedidos
GROUP BY Pedidos.Id_Pedido
ORDER BY Tipo;

-- 4. Adiciones más solicitadas en pedidos personalizados

SELECT Adicionales.Nombre, COUNT(*) AS VecesSolicitadas
FROM PedidoAdicion
JOIN Adicionales ON PedidoAdicion.Id_Adicional = Adicionales.Id_Adicional
GROUP BY Adicionales.Id_Adicional, Adicionales.Nombre
ORDER BY VecesSolicitadas;

-- 5. Cantidad total de productos vendidos por categoría

SELECT Productos.Categoria AS Categoria, SUM(DetallesPedidos.cantidad) AS CantidadesVendidas
FROM DetallesPedidos
JOIN Productos ON Productos.Id_Producto = DetallesPedidos.Id_Producto
GROUP BY Productos.Categoria
ORDER BY CantidadesVendidas DESC;

-- 8. Cantidad de panzarottis vendidos con extra queso

SELECT COUNT(*) AS CantidadPanzerottis
FROM DetallesPedidos
JOIN Productos ON Productos.Id_Producto = DetallesPedidos.Id_Producto
JOIN PedidoAdicion ON PedidoAdicion.Id_DetallePedido = DetallesPedidos.Id_DetallePedido
JOIN Adicionales ON PedidoAdicion.Id_Adicional = Adicionales.Id_Adicional
WHERE Productos.Categoria = "panzerotti" AND Adicionales.Nombre = "Extra queso";

-- 9. Pedidos que incluyen bebidas como parte de un combo

SELECT COUNT(Pedidos.Id_Pedido) AS PedidosConBebidas
FROM Pedidos
JOIN DetallesPedidos ON Pedidos.Id_Pedido = DetallesPedidos.Id_Pedido
JOIN ComboProducto ON DetallesPedidos.Id_Combo = ComboProducto.Id_Combo
JOIN Productos ON ComboProducto.Id_Producto = Productos.Id_Producto
WHERE Productos.Categoria = "bebida";

-- 11. Ingresos totales generados por productos no elaborados (bebidas, postres, etc.)

SELECT SUM(DetallesPedidos.cantidad * DetallesPedidos.precioUnitario) AS IngresosTotales
FROM DetallesPedidos
JOIN Productos ON DetallesPedidos.Id_Producto = Productos.Id_Producto
WHERE Productos.Categoria IN ("bebida", "postre", "otro");

-- 14. Clientes con pedidos tanto para recoger como para consumir en el lugar

SELECT Clientes.Nombre AS ClientesConAmbosTipos
FROM Clientes
JOIN Pedidos ON Pedidos.Id_Cliente = Clientes.Id_Cliente
GROUP BY Clientes.Id_Cliente, Clientes.Nombre
HAVING COUNT(distinct Pedidos.Tipo) = 2;

-- 15. Total de productos personalizados con adiciones

SELECT COUNT(*) TotalProductosConAdiciones
FROM DetallesPedidos
WHERE EXISTS (
	SELECT 1 FROM PedidoAdicion WHERE PedidoAdicion.Id_DetallePedido = DetallesPedidos.Id_Pedido);