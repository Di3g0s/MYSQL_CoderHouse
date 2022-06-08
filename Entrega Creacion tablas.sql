
CREATE DATABASE MTTO;
USE MTTO;


CREATE TABLE IF NOT EXISTS MTTO.Equipos (
	  id_eq			INT NOT NULL 
	, Tipo_EQ VARCHAR(30)
	, Dominio VARCHAR(30)
    , primary key (Id_EQ)
);

CREATE TABLE IF NOT EXISTS MTTO.JobLog (
	Pozo_etapa VARCHAR(50),
	inicio datetime,
    fin datetime,
    primary key (Pozo_etapa)
);

CREATE TABLE IF NOT EXISTS MTTO.Repuestos (
	id_repuesto INT,
    Costo DECIMAL(14,2),
    primary key(id_repuesto)
);


CREATE TABLE IF NOT EXISTS MTTO.Notificaciones (
	  id_notificacion			INT NOT NULL 
	, id_eq INT	
	, SERVICE_START_DT	DATE 
	, Componente	VARCHAR(50) 
	, PRIMARY KEY (Id_notificacion)
    , foreign key (id_eq) references Equipos(id_eq)
);

CREATE TABLE IF NOT EXISTS MTTO.Ordenes_de_trabajo (
	  id_orden			INT NOT NULL 
	, id_eq			INT	NOT NULL references Equipos (id_eq)
	, id_notificacion		INT
	, Descripcion	VARCHAR(60) NOT NULL
	, Costo	decimal(10,2)
	, Estado		VARCHAR(50) NOT NULL
	, PRIMARY KEY (Id_orden)
    , foreign key(id_eq) references Equipos(id_eq)
    , foreign key(id_notificacion) references Notificaciones(id_notificacion)
);


CREATE TABLE IF NOT EXISTS MTTO.Uso_repuestos (
	  id_repuesto			INT NOT NULL 
	, id_orden			INT 
    , Fecha DATE
    , Cantidad INT
    , foreign key (id_repuesto) references Repuestos(id_repuesto)
    , foreign key (id_orden) references Ordenes_de_trabajo (id_orden)
);

CREATE TABLE IF NOT EXISTS MTTO.Etapas_Fractura (
	Pozo_etapa VARCHAR(50) NOT NULL,
    Pozo VARCHAR(50) NOT NULL,
    Etapa INT NOT NULL,
    TiempoBombeo Decimal(14,2),
	Propante Decimal(14,2),
	Volumen Decimal(14,2),
	Prom_Presion Decimal(14,2),
	Prom_Caudal  Decimal(14,2),
	Prom_HHP Decimal(14,2),
    foreign key(Pozo_etapa) references JobLog(Pozo_etapa)
);

CREATE TABLE IF NOT EXISTS MTTO.BajasEQ (
	id_baja INT NOT NULL AUTO_INCREMENT,
    id_eq INT,
    GrupoTrabajo INT,
    TipoBaja VARCHAR(50),
    Componente VARCHAR(50),
    Motivo VARCHAR(150),
    Locacion VARCHAR(50),
    PRIMARY KEY (id_baja),
    FOREIGN KEY (id_eq) REFERENCES Equipos(id_eq)
);

CREATE TABLE IF NOT EXISTS 	PruebaEquipo (
	id_orden INT,
    id_eq INT,
    FechaHora_inicio datetime,
    FechaHora_fin datetime,
    Vuelve_Taller decimal(14,2),
    Comentarios Varchar(150),
    PRIMARY KEY (id_orden),
    FOREIGN KEY (id_eq) REFERENCES Equipos(id_eq)
);
    


-- select * FROM Ordenes_de_trabajo;
