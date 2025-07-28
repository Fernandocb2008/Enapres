/********************************************************************************
* Proyecto: 	Encuesta Nacional de Programas Presupuestales (Enapres)                           
* TITULO: 		Master Do File
* Año:			2025
* Autor: 		Fernando Cuyutupac Borja
*********************************************************************************

*** Outline:
	0. Set initial configurations and globals
	1. Extracción
	2. Limpieza
	3. Fusión
	4. Construcción
	5. Automatización

*********************************************************************************
*** PART 0: Set initial configurations and globals
********************************************************************************/


*** 0.1 Setting up users	

	if ("`c(username)'" == "LEGION") {
				global project 				"F:\Backup\"
	}
	
	

display as error in smcl "Se esta trabajando en el usuario de `c(username)'"
	
		
		
*** 0.2 Configuración de carpetas

	// Dinámicos 
	global codes					"${project}\BBCC\" 
	global data						"${project}\BBDD\"
	global outputs 					"${project}\BBFF\"
	
		
	// limpieza
	global rawdata					"${data}\ENAPRES\"
	global intdata					"${outputs}\intermediate\"
	global enapres					"${intdata}\Enapres\"
	global codes_1					"${codes}\Enapres\"

*** 0.3 Setting up execution
	
	global extraer_data		0 
	global limpieza_data	0
	global merge_data		0
	global constuct_data	0
	global automate_data	0
	
********************************************************************************
***	Parte 1: extracción de datos
********************************************************************************

		if (${extraer_data} == 1) {
		do "${codes_1}/extraer.do"

	} 
	
********************************************************************************
***	Parte 2: limpieza de datos 
********************************************************************************	
	
	
	
	if (${limpieza_data} == 1) {
		do "${codes_1}/1_clean_300.do"
		do "${codes_1}/1_clean_800a.do"
		do "${codes_1}/1_clean_600.do"
		
	} 
	

********************************************************************************
***	Parte 3: Fusión y adjunte de base de datos
********************************************************************************	
	
	
		if (${merge_data} == 1) {
		do "${codes_1}/2_merge.do"
		do "${codes_1}/2_append.do"
	} 

	
********************************************************************************
***	Parte 3: Etiqueta y construcción de datos
********************************************************************************	
		
		if (${constuct_data} == 1) {
		do "${codes_1}/3_start.do"
		do "${codes_1}/3_other.do"
		do "${codes_1}/3_impresos.do"
		do "${codes_1}/3_digitales.do"
		do "${codes_1}/3_ferias.do"
		do "${codes_1}/3_bibliotecas.do"
		do "${codes_1}/3_end.do"
	} 
	
	
********************************************************************************
***	Parte 4: Automatizando outputs
********************************************************************************	
		if (${automate_data} == 1) {
		do "${codes_1}/automate.do"

	} 
