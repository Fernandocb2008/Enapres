


* Capítulo 800A: patrimonio, servicios y bienes culturales (persona de 14 y más años de edad) 



{

forvalues x=2016/2024 {
	use "${rawdata}\`x'\\CAP_800A_URBANO_RURAL_10.dta" , clear
	di `x'
	egen id = concat(anio mes conglomerado vivienda nselv  hogar p800a_a)
	sort id



if `x'==2016 {
	keep id anio mes area regionnatu ccdd ccpp ccdi  nombredd nombrepp nombredi p207 p208_a ///
	p800a_8_8 p800a_9_8  p800a_12_8 p800a_8_9 p800a_9_9 p800a_12_9 ///
	p800a_12_1 p800a_14_1 p800a_18_1 p800a_13_1 p800a_13_2 p800a_14_2 p800a_18_2 ///
	p800a_13_3 p800a_14_3 p800a_18_3 p800a_13_4 p800a_14_4  p800a_18_4 ///
	p800a_13_5 p800a_14_5 p800a_18_5 p800a_13_6 p800a_14_6  p800a_18_6 ///
	factor* p800a_c
	
	}


if `x'>2016 &  `x' <=2023 {
	keep id anio mes area regionnatu ccdd ccpp ccdi   nombredd nombrepp nombredi estrato  p207  p208_a ///
	p800a_8_8 p800a_9_8  p800a_12_8 p800a_8_9 p800a_9_9 p800a_12_9 ///
	p800a_12_1 p800a_14_1 p800a_18_1 p800a_13_1 p800a_13_2 p800a_14_2 p800a_18_2 ///
	p800a_13_3 p800a_14_3 p800a_18_3 p800a_13_4 p800a_14_4  p800a_18_4 ///
	p800a_13_5 p800a_14_5 p800a_18_5 p800a_13_6 p800a_14_6  p800a_18_6 ///
	factor* p800a_c							 
	

		}
		
		
if `x'==2024 {
	keep id anio mes area regionnatu ccdd ccpp ccdi   nombredd nombrepp nombredi  p207  p208_a ///
	p800a_8_8 p800a_9_8  p800a_12_8 p800a_8_9 p800a_9_9 p800a_12_9 ///
	p800a_12_1 p800a_14_1 p800a_18_1 p800a_13_1 p800a_13_2 p800a_14_2 p800a_18_2 ///
	p800a_13_3 p800a_14_3 p800a_18_3 p800a_13_4 p800a_14_4  p800a_18_4 ///
	p800a_13_5 p800a_14_5 p800a_18_5 p800a_13_6 p800a_14_6  p800a_18_6 ///
	factor* p800a_c	
	
	}

	
	save "${intdata}\Enapres\clean\\`x'\\`x'_libros", replace
	}

}






