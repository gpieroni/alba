<?php

require_once 'lib/model/om/BaseCalendariovacunacion.php';


/**
 * Skeleton subclass for representing a row from the 'calendariovacunacion' table.
 *
 * 
 *
 * You should add additional methods to this class to meet the
 * application requirements.  This class will only be generated as
 * long as it does not already exist in the output directory.
 *
 * @package model
 */	
class Calendariovacunacion extends BaseCalendariovacunacion {
    public function __toString() {
	    return $this->getNombre();
	}
				 
} // Calendariovacunacion