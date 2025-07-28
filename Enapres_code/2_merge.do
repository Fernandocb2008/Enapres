
* Fusionando las bases de datos por años


{

forvalues x=2016/2024 {
	use "${intdata}\Enapres\\clean\\`x'\\`x'_libros" , clear
	merge 1:1 id using "${intdata}\Enapres\\clean\\`x'\\`x'_edu"
	drop if _merge ==2
	drop _merge
	drop if p800a_c==99

if `x'==2016 {
	merge 1:1 id using "${intdata}\Enapres\\clean\\`x'\\`x'_estrato"
	drop if _merge==2
	drop _merge
	
}


if `x'==2018 {
	replace p300c = "12" if p300c =="12A"
	replace p300c = "15" if p300c =="12B"
	destring p300c, replace
	replace p301a = "0" if p301a =="1A"
	destring p301a, replace
	
}

if `x'==2019 {
	
	replace p300c = "12" if p300c =="12A"
	replace p300c = "15" if p300c =="12A"
	destring p300c, replace
	replace p301a = "0" if p301a =="1A"
	destring p301a, replace
	
}


if `x'==2022 {
	
	rename p300z  p300c 
	*destring p300c, replace
	rename p301b p301a
	
}


if `x'==2023 {
	
	rename p300z  p300c 
	*destring p300c, replace
	rename p301b p301a
	
}


if `x'==2024 {
	
	rename p307  p300c 
	*destring p300c, replace
	rename p308 p301a
	rename p312 p319
	
}


	save "${intdata}\Enapres\merge\\\anio_`x'", replace
}

}

