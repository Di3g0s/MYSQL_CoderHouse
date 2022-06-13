
-- Vista 1:
-- Se quiere mostrar los motivos principales por los cuales se han tenido tiempos no productivos (NPT)
CREATE OR REPLACE VIEW Top_NPT_Events AS
SELECT Cliente, c.Nombre as Crew , ABS(TIMESTAMPDIFF(HOUR,Inicio,Fin)) as Tiempo, jl.Comentarios, Inicio as 'Inicio del evento' 
FROM joblog as jl JOIN crews c ON jl.id_crew=c.id_crew where TipoEvento='NPT' order by Tiempo DESC;

SELECT * FROM Top_NPT_Events;

-- Vista 2
-- Indica cual es el Crew (grupo de trabajo) que más horas ha bombeado
CREATE OR REPLACE VIEW Top_Pump_Time AS
SELECT c.Nombre as Crew , SUM(ABS(TIMESTAMPDIFF(HOUR,Inicio,Fin))) as Tiempo 
FROM joblog as jl JOIN crews c ON jl.id_crew=c.id_crew 
WHERE TipoEvento='Pumping' group by c.Nombre order by  Tiempo DESC;

SELECT * FROM Top_Pump_Time;

-- Vista 3
-- Equipo con los costos en MTTO
-- Se tiene el costo acumulado por equipo
CREATE OR REPLACE VIEW Equipos_Costos_Resumen AS
SELECT e.id_eq as equipo, e.Tipo_EQ, e.Dominio as Patente, SUM(o.Costo) as costo_total, COUNT(o.id_eq) As Cant_Mantenimientos FROM equipos as e
JOIN ordenes_de_trabajo o ON e.id_eq = o.id_eq GROUP BY e.id_eq ORDER BY costo_total DESC;

SElECT * FROM Equipos_Costos_Resumen;


-- Vista 4
-- Equipos que mas han sido operados en las locaciones
CREATE OR REPLACE VIEW Operaciones AS
SELECT id_eq as Equipo, COUNT(Estado) as Cant_Operaciones
FROM actividadequipos  where Estado="Frac" GROUP BY Equipo order by Cant_Operaciones DESC;

SELECT * FROM Operaciones;

-- Vista 5
-- Ver historico de ordenes sin los costos
CREATE OR REPLACE VIEW Historico_ordenes AS
SELECT id_orden, id_eq as Equipo, id_notificacion, Tipo_orden, Descripcion, Fecha, Estado 
FROM ordenes_de_trabajo order by Fecha DESC;

SELECT * FROM Historico_ordenes;