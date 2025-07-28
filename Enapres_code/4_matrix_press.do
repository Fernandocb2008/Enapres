

use "${intdata}\Enapres\final\\consolidada24", clear


svyset [pweight = expansion], psu(conglome) singleunit(missing) vce(linearized) 


* Figura 1
	
	matrix define results=J(9,1,.) 

svy: mean impreso, over (anio) cformat(%9.1fc)
		matrix define A	= e(b)'

		forvalues r = 1/9 {
	    
		matrix results [0+`r',1]=A[0+`r',1]

	}
		
		putexcel set  "${results}\ComoVamos2016-2024.xlsx", sheet("Figura 1") modify 
		putexcel C7 = matrix(results),nformat(0.0%) right
		
* Figura 2

	matrix define results=J(9,4,.) 

svy: proportion razon_impreso, over(anio) percent cformat(%9.1fc)
		matrix define A	= e(b)'	

	
forvalues c = 0/3 { 
    forvalues r = 1/9 { 
        matrix results[`r', `c' + 1] = A[`c' * 9 + `r', 1]
    }
}	

		putexcel set  "${results}\ComoVamos2016-2024.xlsx", sheet("Figura 2") modify 
		putexcel C7 = matrix(results),nformat(0.0%) right









