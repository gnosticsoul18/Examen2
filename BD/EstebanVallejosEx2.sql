USE [master]
GO
/****** Object:  Database [EstebanVallejosEx2]    Script Date: 19/11/2023 23:58:04 ******/
CREATE DATABASE [EstebanVallejosEx2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EstebanVallejosEx2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\EstebanVallejosEx2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EstebanVallejosEx2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\EstebanVallejosEx2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [EstebanVallejosEx2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EstebanVallejosEx2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EstebanVallejosEx2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EstebanVallejosEx2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EstebanVallejosEx2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EstebanVallejosEx2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EstebanVallejosEx2] SET ARITHABORT OFF 
GO
ALTER DATABASE [EstebanVallejosEx2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EstebanVallejosEx2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EstebanVallejosEx2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EstebanVallejosEx2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EstebanVallejosEx2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EstebanVallejosEx2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EstebanVallejosEx2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EstebanVallejosEx2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EstebanVallejosEx2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EstebanVallejosEx2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EstebanVallejosEx2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EstebanVallejosEx2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EstebanVallejosEx2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EstebanVallejosEx2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EstebanVallejosEx2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EstebanVallejosEx2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EstebanVallejosEx2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EstebanVallejosEx2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EstebanVallejosEx2] SET  MULTI_USER 
GO
ALTER DATABASE [EstebanVallejosEx2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EstebanVallejosEx2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EstebanVallejosEx2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EstebanVallejosEx2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EstebanVallejosEx2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EstebanVallejosEx2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EstebanVallejosEx2] SET QUERY_STORE = ON
GO
ALTER DATABASE [EstebanVallejosEx2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [EstebanVallejosEx2]
GO
/****** Object:  Table [dbo].[asignaciones]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[asignaciones](
	[asignacionid] [int] IDENTITY(1,1) NOT NULL,
	[reparacionid] [int] NULL,
	[tecnicoid] [int] NULL,
	[fechaAsignacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[asignacionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detallesReparacion]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detallesReparacion](
	[detallesid] [int] IDENTITY(1,1) NOT NULL,
	[reparacionid] [int] NULL,
	[descripcion] [varchar](50) NULL,
	[fechaInicio] [datetime] NULL,
	[fechaFin] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[detallesid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[equipos]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[equipos](
	[equipoid] [int] IDENTITY(1,1) NOT NULL,
	[tipoEquipo] [varchar](50) NOT NULL,
	[modelo] [varchar](50) NULL,
	[usuarioid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[equipoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reparaciones]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reparaciones](
	[reparacionid] [int] IDENTITY(1,1) NOT NULL,
	[equipoid] [int] NULL,
	[fechaSolicitud] [datetime] NULL,
	[estado] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[reparacionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tecnicos]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tecnicos](
	[tecnicoid] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[especialidad] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[tecnicoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[usuarioid] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[correoElectronico] [varchar](50) NOT NULL,
	[telefono] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[usuarioid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[correoElectronico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[asignaciones]  WITH CHECK ADD  CONSTRAINT [fk_reparacionid1] FOREIGN KEY([reparacionid])
REFERENCES [dbo].[reparaciones] ([reparacionid])
GO
ALTER TABLE [dbo].[asignaciones] CHECK CONSTRAINT [fk_reparacionid1]
GO
ALTER TABLE [dbo].[asignaciones]  WITH CHECK ADD  CONSTRAINT [fk_tecnicoid1] FOREIGN KEY([tecnicoid])
REFERENCES [dbo].[tecnicos] ([tecnicoid])
GO
ALTER TABLE [dbo].[asignaciones] CHECK CONSTRAINT [fk_tecnicoid1]
GO
ALTER TABLE [dbo].[detallesReparacion]  WITH CHECK ADD  CONSTRAINT [fk_reparacionid] FOREIGN KEY([reparacionid])
REFERENCES [dbo].[reparaciones] ([reparacionid])
GO
ALTER TABLE [dbo].[detallesReparacion] CHECK CONSTRAINT [fk_reparacionid]
GO
ALTER TABLE [dbo].[equipos]  WITH CHECK ADD  CONSTRAINT [fk_usuarioid] FOREIGN KEY([usuarioid])
REFERENCES [dbo].[usuarios] ([usuarioid])
GO
ALTER TABLE [dbo].[equipos] CHECK CONSTRAINT [fk_usuarioid]
GO
ALTER TABLE [dbo].[reparaciones]  WITH CHECK ADD  CONSTRAINT [fk_equipoid] FOREIGN KEY([equipoid])
REFERENCES [dbo].[equipos] ([equipoid])
GO
ALTER TABLE [dbo].[reparaciones] CHECK CONSTRAINT [fk_equipoid]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarAsignacion]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- actualizar asignación
CREATE PROCEDURE [dbo].[ActualizarAsignacion]
   @AsignacionID INT,
   @ReparacionID INT,
   @TecnicoID INT,
   @FechaAsignacion DATETIME
AS 
BEGIN 
   UPDATE asignaciones SET reparacionid = @ReparacionID, tecnicoid = @TecnicoID, fechaAsignacion = @FechaAsignacion WHERE asignacionid = @AsignacionID
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarDetallesReparacion]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- actualizar detalles de reparación
CREATE PROCEDURE [dbo].[ActualizarDetallesReparacion]
   @DetallesID INT,
   @ReparacionID INT,
   @Descripcion VARCHAR(50),
   @FechaInicio DATETIME,
   @FechaFin DATETIME
AS 
BEGIN 
   UPDATE detallesReparacion SET reparacionid = @ReparacionID, descripcion = @Descripcion, fechaInicio = @FechaInicio, fechaFin = @FechaFin WHERE detallesid = @DetallesID
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarEquipo]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- actualizar equipo
CREATE PROCEDURE [dbo].[ActualizarEquipo]
   @EquipoID INT,
   @TipoEquipo VARCHAR(50),
   @Modelo VARCHAR(50),
   @UsuarioID INT
AS 
BEGIN 
   UPDATE equipos SET tipoEquipo = @TipoEquipo, modelo = @Modelo, usuarioid = @UsuarioID WHERE equipoid = @EquipoID
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarReparacion]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- actualizar reparación
CREATE PROCEDURE [dbo].[ActualizarReparacion]
   @ReparacionID INT,
   @EquipoID INT,
   @FechaSolicitud DATETIME,
   @Estado CHAR(1)
AS 
BEGIN 
   UPDATE reparaciones SET equipoid = @EquipoID, fechaSolicitud = @FechaSolicitud, estado = @Estado WHERE reparacionid = @ReparacionID
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarTecnico]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- actualizar técnico
CREATE PROCEDURE [dbo].[ActualizarTecnico]
   @TecnicoID INT,
   @Nombre VARCHAR(50),
   @Especialidad VARCHAR(50)
AS 
BEGIN 
   UPDATE tecnicos SET nombre = @Nombre, especialidad = @Especialidad WHERE tecnicoid = @TecnicoID
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarUsuario]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--actualizar usuario
CREATE PROCEDURE [dbo].[ActualizarUsuario]
   @UsuarioID INT,
   @Nombre VARCHAR(50),
   @CorreoElectronico VARCHAR(50),
   @Telefono VARCHAR(15)
AS 
BEGIN 
   UPDATE usuarios SET nombre = @Nombre, correoElectronico = @CorreoElectronico, telefono = @Telefono WHERE usuarioid = @UsuarioID
END
GO
/****** Object:  StoredProcedure [dbo].[AgregarAsignacion]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- PROCEDIMIENTOS ASIGNACIONES
-- agregar asignación
CREATE PROCEDURE [dbo].[AgregarAsignacion]
   @ReparacionID INT,
   @TecnicoID INT,
   @FechaAsignacion DATETIME
AS 
BEGIN 
   INSERT INTO asignaciones (reparacionid, tecnicoid, fechaAsignacion) VALUES (@ReparacionID, @TecnicoID, @FechaAsignacion)
END
GO
/****** Object:  StoredProcedure [dbo].[AgregarDetallesReparacion]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- PROCEDIMIENTOS DETALLESREPARACION
-- agregar detalles de reparación
CREATE PROCEDURE [dbo].[AgregarDetallesReparacion]
   @ReparacionID INT,
   @Descripcion VARCHAR(50),
   @FechaInicio DATETIME,
   @FechaFin DATETIME
AS 
BEGIN 
   INSERT INTO detallesReparacion (reparacionid, descripcion, fechaInicio, fechaFin) VALUES (@ReparacionID, @Descripcion, @FechaInicio, @FechaFin)
END
GO
/****** Object:  StoredProcedure [dbo].[AgregarEquipo]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- PROCEDIMIENTOS EQUIPOS
-- agregar equipo
CREATE PROCEDURE [dbo].[AgregarEquipo]
   @TipoEquipo VARCHAR(50),
   @Modelo VARCHAR(50),
   @UsuarioID INT
AS 
BEGIN 
   INSERT INTO equipos (tipoEquipo, modelo, usuarioid) VALUES (@TipoEquipo, @Modelo, @UsuarioID)
END
GO
/****** Object:  StoredProcedure [dbo].[AgregarReparacion]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- PROCEDIMIENTOS REPARACIONES
-- agregar reparación
CREATE PROCEDURE [dbo].[AgregarReparacion]
   @EquipoID INT,
   @FechaSolicitud DATETIME,
   @Estado CHAR(1)
AS 
BEGIN 
   INSERT INTO reparaciones (equipoid, fechaSolicitud, estado) VALUES (@EquipoID, @FechaSolicitud, @Estado)
END
GO
/****** Object:  StoredProcedure [dbo].[AgregarTecnico]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- PROCEDIMIENTOS TECNICOS
-- agregar técnico
CREATE PROCEDURE [dbo].[AgregarTecnico]
   @Nombre VARCHAR(50),
   @Especialidad VARCHAR(50)
AS 
BEGIN 
   INSERT INTO tecnicos (nombre, especialidad) VALUES (@Nombre, @Especialidad)
END
GO
/****** Object:  StoredProcedure [dbo].[AgregarUsuario]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDIMIENTOS USUARIO
--agregar usuario
CREATE PROCEDURE [dbo].[AgregarUsuario]
   @Nombre VARCHAR(50),
   @CorreoElectronico VARCHAR(50),
   @Telefono VARCHAR(15)
AS 
BEGIN 
   INSERT INTO usuarios (nombre, correoElectronico, telefono) VALUES (@Nombre, @CorreoElectronico, @Telefono)
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarAsignaciones]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- consultar todas las asignaciones
CREATE PROCEDURE [dbo].[ConsultarAsignaciones]
AS 
BEGIN 
   SELECT * FROM asignaciones
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarAsignacionPorID]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- consultar por ID (filtro)
CREATE PROCEDURE [dbo].[ConsultarAsignacionPorID]
   @AsignacionID INT
AS 
BEGIN 
   SELECT * FROM asignaciones WHERE asignacionid = @AsignacionID
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarDetallesReparacion]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- consultar todos los detalles de reparación
CREATE PROCEDURE [dbo].[ConsultarDetallesReparacion]
AS 
BEGIN 
   SELECT * FROM detallesReparacion
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarDetallesReparacionPorID]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- consultar por ID (filtro)
CREATE PROCEDURE [dbo].[ConsultarDetallesReparacionPorID]
   @DetallesID INT
AS 
BEGIN 
   SELECT * FROM detallesReparacion WHERE detallesid = @DetallesID
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarEquipoPorID]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- consultar por ID (filtro)
CREATE PROCEDURE [dbo].[ConsultarEquipoPorID]
   @EquipoID INT
AS 
BEGIN 
   SELECT * FROM equipos WHERE equipoid = @EquipoID
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarEquipos]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- consultar todos los equipos
CREATE PROCEDURE [dbo].[ConsultarEquipos]
AS 
BEGIN 
   SELECT * FROM equipos
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarReparaciones]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- consultar todas las reparaciones
CREATE PROCEDURE [dbo].[ConsultarReparaciones]
AS 
BEGIN 
   SELECT * FROM reparaciones
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarReparacionPorID]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- consultar por ID (filtro)
CREATE PROCEDURE [dbo].[ConsultarReparacionPorID]
   @ReparacionID INT
AS 
BEGIN 
   SELECT * FROM reparaciones WHERE reparacionid = @ReparacionID
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarTecnicoPorID]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- consultar por ID (filtro)
CREATE PROCEDURE [dbo].[ConsultarTecnicoPorID]
   @TecnicoID INT
AS 
BEGIN 
   SELECT * FROM tecnicos WHERE tecnicoid = @TecnicoID
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarTecnicos]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- consultar todos los técnicos
CREATE PROCEDURE [dbo].[ConsultarTecnicos]
AS 
BEGIN 
   SELECT * FROM tecnicos
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarUsuarioPorID]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--consultar por ID (filtro)
CREATE PROCEDURE [dbo].[ConsultarUsuarioPorID]
   @UsuarioID INT
AS 
BEGIN 
   SELECT * FROM usuarios WHERE usuarioid = @UsuarioID
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarUsuarios]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--consultar todos los usuarios
CREATE PROCEDURE [dbo].[ConsultarUsuarios]
AS 
BEGIN 
   SELECT * FROM usuarios
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarAsignacion]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- eliminar asignación
CREATE PROCEDURE [dbo].[EliminarAsignacion]
   @AsignacionID INT
AS 
BEGIN 
   DELETE asignaciones WHERE asignacionid = @AsignacionID
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarDetallesReparacion]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- eliminar detalles de reparación
CREATE PROCEDURE [dbo].[EliminarDetallesReparacion]
   @DetallesID INT
AS 
BEGIN 
   DELETE detallesReparacion WHERE detallesid = @DetallesID
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarEquipo]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- eliminar equipo
CREATE PROCEDURE [dbo].[EliminarEquipo]
   @EquipoID INT
AS 
BEGIN 
   DELETE equipos WHERE equipoid = @EquipoID
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarReparacion]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- eliminar reparación
CREATE PROCEDURE [dbo].[EliminarReparacion]
   @ReparacionID INT
AS 
BEGIN 
   DELETE reparaciones WHERE reparacionid = @ReparacionID
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarTecnico]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- eliminar técnico
CREATE PROCEDURE [dbo].[EliminarTecnico]
   @TecnicoID INT
AS 
BEGIN 
   DELETE tecnicos WHERE tecnicoid = @TecnicoID
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarUsuario]    Script Date: 19/11/2023 23:58:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--eliminar usuario
CREATE PROCEDURE [dbo].[EliminarUsuario]
   @UsuarioID INT
AS 
BEGIN 
   DELETE usuarios WHERE usuarioid = @UsuarioID
END
GO
USE [master]
GO
ALTER DATABASE [EstebanVallejosEx2] SET  READ_WRITE 
GO
