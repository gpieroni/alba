SET CHARACTER SET utf8;
SET FOREIGN_KEY_CHECKS = 0;


DROP TABLE IF EXISTS `informe`;


CREATE TABLE `informe`
(
    `id` INTEGER  NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(128)  NOT NULL,
    `descripcion` VARCHAR(255),
    `fk_adjunto_id` INTEGER(11)  NOT NULL,
    `fk_tipoinforme_id` INTEGER(11)  NOT NULL,
    `listado` INTEGER default 0 NOT NULL,
    `variables` VARCHAR(128),
    PRIMARY KEY (`id`),
    INDEX `informe_FI_1` (`fk_adjunto_id`),
    CONSTRAINT `informe_FK_1`
        FOREIGN KEY (`fk_adjunto_id`)
        REFERENCES `adjunto` (`id`),
    INDEX `informe_FI_2` (`fk_tipoinforme_id`),
    CONSTRAINT `informe_FK_2`
        FOREIGN KEY (`fk_tipoinforme_id`)
        REFERENCES `tipoinforme` (`id`)
)Type=InnoDB;

#-----------------------------------------------------------------------------
#-- tipoinforme
#-----------------------------------------------------------------------------

DROP TABLE IF EXISTS `tipoinforme`;


CREATE TABLE `tipoinforme`
(
    `id` INTEGER  NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(128)  NOT NULL,
    `descripcion` VARCHAR(255),
    PRIMARY KEY (`id`)
)Type=InnoDB;

ALTER TABLE anio ADD COLUMN `orden` INTEGER DEFAULT 0; 

ALTER TABLE `docente` ADD `estado_civil` CHAR( 1 ) NOT NULL AFTER `sexo` ;

ALTER TABLE `docente` ADD `observacion` TEXT NULL AFTER `psicofisico`;


--CREATE SEQUENCE "carrera_seq"; // esto es para postgres
CREATE TABLE "carrera"
(
    "id" INTEGER  NOT NULL,
    "fk_establecimiento_id" INTEGER default 0 NOT NULL,
    "descripcion" VARCHAR(255)  NOT NULL,
    "orden" INTEGER default 0,
    PRIMARY KEY ("id")
);

ALTER TABLE "carrera" ADD CONSTRAINT "carrera_FK_1" FOREIGN KEY ("fk_establecimiento_id") REFERENCES "establecimiento" ("id");

ALTER TABLE "anio" ADD "fk_carrera_id" INTEGER default 0 NOT NULL;
ALTER TABLE "anio" ADD CONSTRAINT "anio_FK_2" FOREIGN KEY ("fk_carrera_id") REFERENCES "carrera" ("id")


# This restores the fkey checks, after having unset them earlier
SET FOREIGN_KEY_CHECKS = 1;
