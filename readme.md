# Base de Datos de CampusPizza

El propósito de este examen es diseñar una base de datos que permita gestionar eficientemente los productos, combos, pedidos y clientes de una pizzería. 

## Tabla de contenido 📋

| Indice | Titulo          |
| ------ | --------------- |
| 1      | Intalacion      |
| 2      | Tablas          |
| 3      | FAQs            |
| 4      | Licencia        |

## 1 Instalación 📐

```bash
git clone https://github.com/Stefanyyy15/MySQL_AdrianUstariz_YuliSanchez-main.git
cd MySQL_AdrianUstariz_YuliSanchez-main
code .
```

## Tablas Explicacion


Cada tabla contiene los datos que se requirieron, siendo estos los requerimientos para lograr una adecuada gestion y ejecucion de consultas e inserciones

1. Gestión de Productos: Registro completo de pizzas, panzarottis, bebidas, postres y otros productos no elaborados. Se debe tener en cuenta los ingredientes que poseen los productos.
2. Gestión de Adiciones: Permitir a los clientes agregar adiciones (extra queso, salsas, etc.) a sus productos.
3. Gestión de Combos: Manejar combos que incluyen múltiples productos a un precio especial.
4. Gestión de Pedidos: Registro de pedidos para consumir en la pizzería o para recoger, con opción de personalización mediante adiciones.
5. Gestión del Menú: Definir y actualizar el menú con las opciones disponibles.

Se crearon las siguientes tablas:

1. Productos, esta logro relacionarse con: ingredientes, combos, clientes y adicionales
2. Ingredientes : Esta se relaciono con productos
3. Adicionales : Esta se relaciono con combos y pedidos
4. Combos : Se relaciono con productos, pedidos y clientes
5. Pedidos : Se relacion con clientes, productos y combos
6. Clientes : Se relaciono con pedidos

Las cuales lograron relaciones ayudadas por estas tablas intermedias:

1. ProductoIngrediente
2. ComboProducto
3. DetallesPedidos
4. Menu


## 3 FAQs ❔

Lista de preguntas frecuentes:

1. ¿Cómo puedo contribuir al proyecto?
   _Puedes contribuir creando un fork del repositorio y enviando un pull request._

2. ¿Este proyecto está abierto a contribuciones?
   | Tipo de contribución | Aceptado | Comentarios |
   |:---------------------|:--------:|------------:|
   | Reporte de errores | Sí | Utiliza la sección de issues en GitHub |
   | Nuevas características| Sí | Envía un pull request con tus propuestas |

## 4  Licencia 🖍

Este proyecto está licenciado bajo la Licencia MIT.
