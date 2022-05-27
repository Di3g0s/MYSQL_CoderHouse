CREATE DATABASE MTTO;
USE MTTO;

select * FROM checklists;
select * FROM ordenes_de_trabajo;

CREATE TABLE IF NOT EXISTS Checklists (
	  Id_checklist 		INT NOT NULL 
	, Id_EQ				INT NOT NULL 
	, Tipo_de_MTTO		VARCHAR(30) NOT NULL
	, Descripcion		VARCHAR(50)	NOT NULL
    , PRIMARY KEY (Id_checklist)
);


CREATE TABLE IF NOT EXISTS MTTO.Notificaciones (
	  Id_notificacion			INT NOT NULL 
	, Id_EQ			INT	NOT NULL
	, Id_checklist		INT
	, SERVICE_START_DT	DATE 
	, Componente	VARCHAR(50) 
	, PRIMARY KEY (Id_notificacion)
);


CREATE TABLE IF NOT EXISTS MTTO.Ordenes_de_trabajo (
	  Id_orden			INT NOT NULL 
	, Id_EQ			INT	NOT NULL
	, Id_notificacion		INT
	, Descripcion	VARCHAR(60) NOT NULL
	, Costo	decimal(10,2)
	, Estado		VARCHAR(50) NOT NULL
	, PRIMARY KEY (Id_orden)
);

CREATE TABLE IF NOT EXISTS MTTO.Pendientes_taller (
	  Id_pendiente			INT NOT NULL 
	, Id_orden			INT	NOT NULL
	, Inicio_trabajo		DATETIME
    , Fin_trabajo DATETIME
	, Lugar	VARCHAR(60) NOT NULL
	, Id_tecnico	INT
    , Id_Supervisor	INT
	, Comentarios		VARCHAR(50) NOT NULL
	, PRIMARY KEY (Id_pendiente)
);

CREATE TABLE IF NOT EXISTS MTTO.Personal (
	  Id_empleado			INT NOT NULL 
	, Posicion	VARCHAR(60) NOT NULL
	, Nombre	VARCHAR(60) NOT NULL
	, Apellido	VARCHAR(60) NOT NULL
	, PRIMARY KEY (Id_empleado)
);

CREATE TABLE IF NOT EXISTS MTTO.Estado_eq (
	  Id_EQ			INT NOT NULL 
	, Estado	VARCHAR(60) NOT NULL
    , primary key (Id_EQ)
);

Drop table Uso_repuestos;

CREATE TABLE IF NOT EXISTS MTTO.Uso_repuestos (
	  Id_repuesto			INT NOT NULL 
	, Id_orden			BIGINT 
    , Fecha DATE
    , Cantidad INT
);

CREATE TABLE IF NOT EXISTS MTTO.Repuestos (
	  Id_repuesto			INT NOT NULL 
	, Costo Decimal(10,2)
    , primary key (id_repuesto)
);

CREATE TABLE IF NOT EXISTS MTTO.Equipos (
	  Id_EQ			INT NOT NULL 
	, Tipo_EQ VARCHAR(30)
	, Dominio VARCHAR(30)
    , primary key (Id_EQ)
);





