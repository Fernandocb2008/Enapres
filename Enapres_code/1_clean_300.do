
* Capítulo 300: identidad, discapacidad, emergencias, programas sociales, educación y autoidentificación étnica (para todas las edades)

{

forvalues x=2016/2024 {
	use "${rawdata}\`x'\\CAP_300_URBANO_RURAL_5.dta" , clear



if `x'<2024 {

	egen id = concat(anio mes conglomerado vivienda nselv  hogar p300_a)
	sort id
	keep id anio conglomerado vivienda nselv  hogar p300_a  ///
	p300? p301* p301*_anio p301*_grado p301*_ce p319 p320
	
	}
		
	
	
if `x'==2024 {


	egen id = concat(anio mes conglomerado vivienda nselv hogar p300c_a)
	sort id
	keep id anio conglomerado vivienda nselv  hogar p300c_a  ///
	 p307 p307_o p308 p308_anio p308_grado p308_ce p312 p312_o p313
	
	}
	
	
	
	save "${intdata}\Enapres\\clean\\`x'\\`x'_edu", replace
}

}
