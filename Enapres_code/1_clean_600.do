


* Capítulo 600: seguridad ciudadana (para personas de 14 y más años de edad)
* Se usa en 2016 dado que en esta base se encuentra la variable estrato


use "${rawdata}\2016\CAP_600_URBANO", clear
generate	id = nselv
tostring	id, replace
replace		id = "000"+id if nselv<10
replace		id = "00"+id if nselv>=10 & nselv<100
replace		id = "0"+id if nselv>=100 & nselv<1000
drop 		nselv
rename 		id nselv

egen 		id = concat(anio mes conglomerado vivienda nselv  hogar p600_a)

keep id estrato

save "${intdata}\Enapres\clean\2016\2016_estrato", replace


