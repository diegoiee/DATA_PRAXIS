/*
--Ejemplo de como crear una tabla con primary key simple o compuesta

CREATE TABLE PEPITO1(
        CAMPO1 varchar(30) not null,
        CAMPO2 varchar(20) not null,
        CAMPO3 varchar(20) not null,
        CONSTRAINT nombreConstraint PRIMARY KEY(campo1)
)

--Ejemplo de como crear una FOREIGN KEY que hace referencia a la primary key de PEPITO1

CREATE TABLE PEPITO2(
        CAMPO1 varchar(30) not null,
        CAMPO2 varchar(20) not null,
        CAMPO3 varchar(30) not null, 
        CONSTRAINT nombreConstraint2 FOREIGN KEY(CAMPO3) REFERENCES PEPITO1(CAMPO1)
)

*/

/*

--Ejemplo simple para crear Stored Procedures (SP)

CREATE PROCEDURE nombreSP
        @param1 varchar(20) --parametros
AS
BEGIN
        INSERT INTO dbo.PEPITO values(@param1,@param1,@param1)
END

--Otro ejemplo de SP usando transacciones y try catch

CREATE PROCEDURE asd
        @param1 varchar(20)
AS
BEGIN
        BEGIN TRY
                BEGIN TRANSACTION
                insert into dbo.PEPITO14 values(@param1,@param1,@param1)
                insert into dbo.PEPITO5 values(@param1,@param1,@param1)
                COMMIT
        END TRY

        BEGIN CATCH --el catch captura antes que el transaction el error, por ende si no hago el rollback en el catch quedara sin hacerse
                PRINT 'ERROR'
                ROLLBACK
        END CATCH
END


*/
