

* Adjuntando las bases de datos: 2016 - 2024

use "${intdata}\Enapres\merge\\anio_2016" , clear

{

forvalues x=2017/2024 {
	append using "${intdata}\Enapres\merge\\anio_`x'" 

	save "${intdata}\Enapres\final\\final_1624", replace
}

}
