--use prueba_betto;
go;

--crear procedimiento para insertar una tela

CREATE PROCEDURE usp_insertar_tela
@CodigoTela int, 
@NombreTela varchar(100), 
@CodigoProveedor int
AS
BEGIN
	INSERT INTO Telas (CodigoTela, NombreTela, CodigoProveedor)
	VALUES (@CodigoTela, @NombreTela, @CodigoProveedor)
END;
go;

--crear procedimiento para insertar un proveedor

CREATE PROCEDURE usp_insertar_proveedor
@CodigoProveedor int, 
@NombreProveedor varchar(100), 
@DireccionProveedor varchar(255), 
@TelefonoProveedor int, 
@CorreoProveedor varchar(100)
AS
BEGIN
	INSERT INTO proveedores(CodigoProveedor, NombreProveedor, DireccionProveedor, TelefonoProveedor, CorreoProveedor)
	VALUES(@CodigoProveedor, @NombreProveedor, @DireccionProveedor, @TelefonoProveedor, @CorreoProveedor)
END
go;

--crear procedimiento para insertar un cliente

CREATE PROCEDURE usp_insertar_cliente
@CodigoCliente int, 
@NombreCliente varchar(100), 
@ApellidoCliente varchar(100), 
@DniCliente varchar(8), 
@CelularCliente varchar(9), 
@DireccionCliente varchar(255), 
@CiudadCliente varchar(100)
AS
BEGIN
	INSERT INTO clientes(CodigoCliente, NombreCliente, ApellidoCliente, DniCliente, CelularCliente, DireccionCliente, CiudadCliente)
	VALUES (@CodigoCliente, @NombreCliente,@ApellidoCliente, @DniCliente, @CelularCliente, @DireccionCliente, @CiudadCliente)
END;
go;

--crear procedimiento para insertar una categoria

CREATE PROCEDURE usp_insertar_categoria
@CodigoCategoria int,
@NombreCategoria varchar(100),
@DescripcionCategoria varchar (199)
AS
BEGIN 
	INSERT INTO categorias(CodigoCategoria, NombreCategoria, DescripcionCategoria)
	VALUES(@CodigoCategoria, @NombreCategoria, @DescripcionCategoria)
END;
GO;

--crear procedimiento para insertar un pedido

CREATE PROCEDURE usp_insertar_pedido
@CodigoPedido int,
@FechaInicio date,
@FechaEntrega date,
@CodigoCliente int
AS
BEGIN
	INSERT INTO pedidos(CodigoPedido, FechaInicio, FechaEntrega, CodigoCliente)
	VALUES (@CodigoPedido, @FechaInicio, @FechaEntrega, @CodigoCliente)
END;						 
GO;						   

--crear procedimiento para insertar un producto

CREATE PROCEDURE usp_insertar_producto
@CodigoProducto int,
@NombreProducto varchar(100),
@ColorProducto varchar(100),
@TallaProducto varchar(5),
@CostoBase float,
@CodigoCategoria int,
@StockDisponible int,
@FechaEntrega date
AS
Begin
	iNSERT INTO Productos(CodigoProducto, NombreProducto, ColorProducto, TallaProducto, CostoBase, CodigoCategoria,
	StockDisponible, FechaIngreso)
	VALUES(@CodigoProducto, @NombreProducto,@ColorProducto, @TallaProducto, @CostoBase, @CodigoCategoria, 
	@StockDisponible,@FechaEntrega)
End;
GO;

--crear procedimeinto para insertar las telas por producto

CREATE PROCEDURE usp_insertar_tela_por_producto
@CodigoTela int,
@CodigoProducto int,
@Porcentaje float
AS
Begin
	INSERT INTO telas_productos(CodigoTela, CodigoProducto, Porcentaje)
	VALUES(@CodigoTela, @CodigoProducto, @Porcentaje)
End;
GO;

--crear procedimiento para insertar un detalle de pedido

CREATE PROCEDURE usp_insertar_detalle_pedido
@CodigoProducto int,
@CodigoPedido int,
@Cantidad int,
@PrecioUnitario float,
@Descuento float
AS
BEGIN
	INSERT INTO detalles_pedidos(CodigoProducto, CodigoPedido, Cantidad, PrecioUnitario, Descuento)
	VALUES(@CodigoProducto, @CodigoPedido, @Cantidad, @PrecioUnitario, @Descuento)
END;
GO;

--crear procedimiento para insertar un estado

CREATE PROCEDURE usp_insertar_estado
@CodigoEstado int,
@DescripcionEstado varchar(125)
AS
BEGIN 
	INSERT INTO estados(CodigoEstado, DescripcionEstado)
	VALUES(@CodigoEstado, @DescripcionEstado)
END;
GO;

--crear procedimiento para insertar un seguimiento

CREATE PROCEDURE usp_insertar_seguimiento
@CodigoEstado int,
@FechaRegistro date,
@CodigoProducto int,
@CodigoPedido int
AS
BEGIN
	INSERT INTO seguimientos(CodigoEstado, FechaRegistro, CodigoProducto, CodigoPedido)
	Values(@CodigoEstado, @FechaRegistro, @CodigoProducto, @CodigoPedido)
END
GO;
