CREATE DATABASE periquito;
use periquito;
CREATE TABLE Centro_de_costo (
  ID_centro_de_costo INT PRIMARY KEY NOT NULL,
  Nombre VARCHAR(20) NOT NULL,
  Descripcion VARCHAR(50) NOT NULL,
  Encargado varchar(50),
  Ubicacion varchar(50)
);
CREATE TABLE EmpleadoCentroDeCosto (
  EmpleadoID INT NOT NULL,
  CentroDeCostoID int NOT NULL,
  primary key(empleadoID ,CentroDeCostoID),
  FOREIGN KEY (CentroDeCostoID) REFERENCES Centro_de_costo(ID_centro_de_costo),
  FOREIGN KEY (EmpleadoID) REFERENCES empleados(empleadoID)
);
CREATE TABLE empleados (
  empleadoID INT PRIMARY KEY NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  Correo VARCHAR(100) NOT NULL,
  Identificacion INT NOT NULL,
  Fecha_nacimiento DATE NOT NULL,
  Telefono INT,
  FechaIngreso DATE NOT NULL,
  Salario int NOT NULL,
  estado VARCHAR(20),
  usuario VARCHAR(20),
  clave varchar(50) NOT NULL,
  Rol VARCHAR(20)
);
CREATE TABLE Proveedores (
  proveedorID INT PRIMARY KEY NOT NULL,
  Nombre VARCHAR(20) NOT NULL,
  Telefono INT,
  Direccion VARCHAR(20)
);
CREATE TABLE Articulos (
  Serializado INT PRIMARY KEY NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  porcentajeImpuesto int NOT NULL,
  Descripcion VARCHAR(500) NOT NULL,
  Categoria VARCHAR(20) NOT NULL,
  VidaUtil int NOT NULL
);

CREATE TABLE EmpleadoArticulo(
  Serializado INT,
  empleadoID INT,
  fecha_entrega VARCHAR(50),
  primary key(empleadoID ,Serializado),
  FOREIGN KEY (Serializado) REFERENCES  Articulos(Serializado),
  FOREIGN KEY (empleadoID) REFERENCES Empleados(empleadoID)
  );
CREATE TABLE EmpleadoArticuloDevolucion(
  Serializado INT,
  empleadoID INT,
  fecha_devolucion VARCHAR(50),
  primary key(empleadoID ,Serializado),
  FOREIGN KEY (Serializado) REFERENCES  Articulos(Serializado),
  FOREIGN KEY (empleadoID) REFERENCES Empleados(empleadoID)
  );
CREATE TABLE compra (
  Numero_de_factura INT PRIMARY KEY NOT NULL,
  cantidad INT NOT NULL,
  Valor_de_compra REAL NOT NULL,
  impuesto REAL NOT NULL,
  total_pagar REAL NOT NULL,
  Fecha_de_compra DATE NOT NULL,
  Serializado INT,  
  proveedorID INT,
  FOREIGN KEY (Serializado) REFERENCES  Articulos(Serializado),
  foreign key (proveedorID) references proveedores(proveedorID)
);

-- Inserts for Centro_de_costo
INSERT INTO Centro_de_costo (ID_centro_de_costo, Nombre, Descripcion, Encargado, Ubicacion)
VALUES 

(2, 'Centro2', 'Descripción Centro2', 'Encargado2', 'Ubicacion2'),
(3, 'Centro3', 'Descripción Centro3', 'Encargado3', 'Ubicacion3'),
(4, 'Centro4', 'Descripción Centro4', 'Encargado4', 'Ubicacion4'),
(5, 'Centro5', 'Descripción Centro5', 'Encargado5', 'Ubicacion5'),
(6, 'Centro6', 'Descripción Centro6', 'Encargado6', 'Ubicacion6'),
(7, 'Centro7', 'Descripción Centro7', 'Encargado7', 'Ubicacion7'),
(8, 'Centro8', 'Descripción Centro8', 'Encargado8', 'Ubicacion8'),
(9, 'Centro9', 'Descripción Centro9', 'Encargado9', 'Ubicacion9'),
(10, 'Centro10', 'Descripción Centro10', 'Encargado10', 'Ubicacion10');

-- Inserts for empleados
INSERT INTO empleados (empleadoID, Nombre, Correo, Identificacion, Fecha_nacimiento, Telefono, FechaIngreso, Salario, estado, usuario, clave, Rol)
VALUES 
(3, 'Empleado3', 'empleado3@email.com', 3456, '1992-03-03', 3456, '2020-03-03', 60000, 'inactivo', 'usuario3', 'clave3', 'Rol3'),
(4, 'Empleado4', 'empleado4@email.com', 456, '1993-04-04', 4567, '2020-04-04', 65000, 'activo', 'usuario4', 'clave4', 'Rol4'),
(5, 'Empleado5', 'empleado5@email.com', 5678, '1994-05-05', 56789, '2020-05-05', 70000, 'inactivo', 'usuario5', 'clave5', 'Rol5'),
(6, 'Empleado6', 'empleado6@email.com', 6789, '1995-06-06', 6789, '2020-06-06', 75000, 'activo', 'usuario6', 'clave6', 'Rol6'),
(7, 'Empleado7', 'empleado7@email.com', 7890, '1996-07-07', 7890, '2020-07-07', 80000, 'inactivo', 'usuario7', 'clave7', 'Rol7'),
(8, 'Empleado8', 'empleado8@email.com', 8901, '1997-08-08', 89012, '2020-08-08', 85000, 'activo', 'usuario8', 'clave8', 'Rol8'),
(9, 'Empleado9', 'empleado9@email.com', 9012, '1998-09-09', 90123, '2020-09-09', 90000, 'inactivo', 'usuario9', 'clave9', 'Rol9'),
(10, 'Empleado10', 'empleado10@email.com', 1234, '1999-10-10', 1234, '2020-10-10', 95000, 'activo', 'usuario10', 'clave10', 'Rol10');

-- Inserts for Proveedores
INSERT INTO Proveedores (proveedorID, Nombre, Telefono, Direccion)
VALUES 
(2, 'Proveedor2', 2222, 'Direccion2'),
(3, 'Proveedor3', 3333, 'Direccion3'),
(4, 'Proveedor4', 4444, 'Direccion4'),
(5, 'Proveedor5', 5555, 'Direccion5'),
(6, 'Proveedor6', 6666, 'Direccion6'),
(7, 'Proveedor7', 7777, 'Direccion7'),
(8, 'Proveedor8', 888, 'Direccion8'),
(9, 'Proveedor9', 999999, 'Direccion9'),
(10, 'Proveedor10', 01010, 'Direccion10');

-- Inserts for Articulos
INSERT INTO Articulos (Serializado, nombre, porcentajeImpuesto, Descripcion, Categoria, VidaUtil)
VALUES 
(1, 'pan',10, 'Descripcion Articulo1', 'Categoria1', 8 ),
(2, 'Articulo2', 02, 'Descripcion Articulo2', 'Categoria2', 8 ),
(3, 'Articulo3', 12, 'Descripcion Articulo3', 'Categoria3', 7 ),
(4, 'Articulo4', 21, 'Descripcion Articulo4', 'Categoria4', 10),
(5, 'Articulo5',12, 'Descripcion Articulo5', 'Categoria5', 6 ),
(6, 'Articulo6', 5, 'Descripcion Articulo6', 'Categoria6', 12),
(7, 'Articulo7', 7, 'Descripcion Articulo7', 'Categoria7', 9 ),
(8, 'Articulo8', 9, 'Descripcion Articulo8', 'Categoria8', 8) ,
(9, 'Articulo9', 11, 'Descripcion Articulo9', 'Categoria9',1),
(10, 'Articulo10', 12, 'Descripcion Articulo10', 'Categoria10',1);
describe articulos;
-- Inserts for compra
INSERT INTO compra (Numero_de_factura, cantidad, Valor_de_compra, impuesto, total_pagar, Fecha_de_compra, Serializado, proveedorID)
VALUES 

(2, 30, 750.75, 37.54, 788.29, '2023-02-01', 2, 2),
(3, 40, 1200.25, 60.01, 1260.26, '2023-03-01', 3, 3),
(4, 25, 500.80, 25.04, 525.84, '2023-04-01', 4, 4),
(5, 35, 900.60, 45.03, 945.63, '2023-05-01', 5, 5),
(6, 20, 600.40, 30.02, 630.42, '2023-06-01', 6, 6),
(7, 45, 1500.90, 75.04, 1575.94, '2023-07-01', 7, 7),
(8, 28, 850.25, 42.51, 892.76, '2023-08-01', 8, 8),
(9, 32, 1100.75, 55.04, 1155.79, '2023-09-01', 9, 9),
(10, 38, 1300.50, 65.03, 1365.53, '2023-10-01', 10, 10);

-- Inserts for EmpleadoCentroDeCosto
INSERT INTO EmpleadoCentroDeCosto (EmpleadoID, CentroDeCostoID)
VALUES 

(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Inserts for EmpleadoArticulo
INSERT INTO EmpleadoArticulo (Serializado, empleadoID, fecha_entrega)
VALUES 

(2, 2, '2023-02-15'),
(3, 3, '2023-03-15'),
(4, 4, '2023-04-15'),
(5, 5, '2023-05-15'),
(6, 6, '2023-06-15'),
(7, 7, '2023-07-15'),
(8, 8, '2023-08-15'),
(9, 9, '2023-09-15'),
(10, 10, '2023-10-15');

/*inserccion de un usuario para nosotros poder iniciar sesion en las pruebas*/
INSERT INTO empleados (empleadoID, Nombre, Correo, Identificacion, Fecha_nacimiento, Telefono, FechaIngreso, Salario, estado, usuario, clave, Rol)
VALUES (1, 'ANDRES AVILA2', 'john@example.com', 1234567890, '1990-01-01', 1234567890, '2020-01-01', 50000.00, 'activo', 'juan', '123456789', 'administrador');
drop table Empleados;
SELECT EmpleadoCentroDeCosto.EmpleadoID, EmpleadoCentroDeCosto.CentroDeCostoID, empleados.Nombre AS NombreEmpleado, Centro_de_costo.Nombre AS NombreCentroDeCosto 
	FROM EmpleadoCentroDeCosto 
	INNER JOIN empleados ON EmpleadoCentroDeCosto.EmpleadoID = empleados.empleadoID 
	INNER JOIN Centro_de_costo ON EmpleadoCentroDeCosto.CentroDeCostoID = Centro_de_costo.ID_centro_de_costo;
SELECT EmpleadoArticulo.Serializado, EmpleadoArticulo.empleadoID, empleados.Nombre AS NombreEmpleado, Articulos.Nombre AS NombreArticulo, EmpleadoArticulo.fecha_entrega
	FROM EmpleadoArticulo
	INNER JOIN empleados ON EmpleadoArticulo.empleadoID = empleados.empleadoID 
	INNER JOIN Articulos ON EmpleadoArticulo.Serializado = Articulos.Serializado;
SElECT empleados.empleadoID, empleados.Nombre AS NombreEmpleado, Centro_de_costo.Nombre AS NombreCentroDeCosto,  Articulos.Nombre AS NombreArticulo, EmpleadoArticulo.fecha_entrega
   FROM Articulos
   INNER JOIN EmpleadoArticulo ON  Articulos.Serializado=EmpleadoArticulo.Serializado
   INNER JOIN empleados ON  empleados.empleadoID=EmpleadoArticulo.empleadoID 
   INNER JOIN EmpleadoCentroDeCosto ON EmpleadoCentroDeCosto.EmpleadoID = empleados.empleadoID 
   INNER JOIN Centro_de_costo ON  Centro_de_costo.ID_centro_de_costo=EmpleadoCentroDeCosto.CentroDeCostoID ;