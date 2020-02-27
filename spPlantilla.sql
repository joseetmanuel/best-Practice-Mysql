USE `mi_esquema`;
DROP procedure IF EXISTS `action_tabla_sp`;

DELIMITER $$
USE `mi_esquema`$$
CREATE DEFINER=`root`@`%` PROCEDURE `action_tabla_sp`(

)
BEGIN
    # variables 
   
	
    # manejo de errores
    DECLARE exit handler for SQLEXCEPTION
    BEGIN
	GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
	SELECT @full_error as err;
	ROLLBACK;
    END;
    SET autocommit=0;
	
    # insersión de datos
    START TRANSACTION;
		
        
    COMMIT;  
END$$
DELIMITER ;	
