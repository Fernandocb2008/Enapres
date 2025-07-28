
* Creación de variables y asignación de etiquetas

* Año
destring	anio, replace

* Mes
destring	mes, replace

* ID
label		variable id "Identificador del invividuo"

* Departamento
destring ccdd, replace
rename ccdd depa
label define depa 1"Amazonas" 2"Áncash" 3"Apurímac" 4"Arequipa" 5"Ayacucho" 6"Cajamarca" 7 "Callao" 8"Cusco" 9"Huancavelica" 10"Huánuco" 11"Ica" 12"Junín" 13"La Libertad" 14"Lambayeque" 15"Lima" 16"Loreto" 17"Madre de Dios" 18"Moquegua" 19"Pasco" 20"Piura" 21"Puno" 22"San Martín" 23"Tacna" 24"Tumbes" 25 "Ucayali"
lab values depa depa 


* Area
recode		area (1 = 0 "Urbana")  (2 = 1 "Rural"), gen(area1)
drop		area
rename		area1 area
label		variable area "Area"

* Region Natural
destring	regionnatu, replace
label		define region 1 "Costa" 2 "Sierra" 3 "Selva"
label		values region region

* Zonas

generate zona = 1 if (depa == 24 | depa == 20 | depa == 14 | depa == 13 | depa == 6 | depa == 2)
replace zona = 2 if (depa == 4 | depa == 3 | depa == 8 | depa == 18 | depa == 21 | depa == 23)
replace zona = 3 if (depa == 11 | depa == 12 | depa == 5 | depa == 19 | depa == 9 | depa == 10)
replace zona = 4 if (depa == 15 | depa == 7)
replace zona = 5 if (depa == 17 | depa == 16 | depa == 22 | depa == 1 | depa == 25)

label define zona 1 "Norte" 2 "Sur" 3 "Centro" 4 "Lima"	5 "Oriente" 	
lab val zona zona


* Sexo del informante
recode		p207 (1 = 0 "Hombre")  (2 = 1 "Mujer"), gen(sexo)
drop		p207
label		define sexo 0 "Hombre" 1 "Mujer" , modify
label		variable sexo "Sexo"

* Opción 1: Grupos de edad
rename		p208_a edad
label		variable edad "Edad"

generate	gedad = .
replace		gedad = 1 if edad >=14 & edad <= 17
replace		gedad = 2 if edad >=18 & edad <= 29
replace		gedad = 3 if edad >=30 & edad <= 59
replace		gedad = 4 if edad >=60

label		define gedad 1 "14 a 17 años" 2 "18 a 29 años" 3 "30 a 59 años" 4 "60 y mas años"
label		values gedad gedad
label		variable gedad "Grupo etario"


* Opción 2: Grupos de edad

generate	gedad1 = .
replace		gedad1 = 1 if edad >=14 & edad <= 29
replace		gedad1 = 2 if edad >=30 & edad <= 44
replace		gedad1 = 3 if edad >=45 & edad <= 64
replace		gedad1 = 4 if edad >=65

label		define gedad1 1 "14 a 29 años" 2 "30 a 44 años" 3 "45 a 64 años" 4 "65 y mas años"
label		values gedad1 gedad1
label		variable gedad1 "Grupo etario"

* Lengua Materna del informate
generate	idioma = .
replace		idioma = p300c if anio ==2016 
replace		idioma = 1 if p300c ==1 & anio>=2017
replace		idioma = 2 if p300c ==2 & anio>=2017
replace		idioma = 3 if (p300c >=3 & p300c<=9) & anio>=2017
replace		idioma = 4 if p300c ==10 & anio>=2017

recode idioma (4 = 1 "Castellano") (1 = 2 "Quechua") (2 = 3 "Aimara") (3 = 4 "Otra Lengua indigena u originaria"), gen(idioma1)
drop idioma 
rename idioma1 idioma
label		variable idioma "Idioma"

* * Nivel educativo del informate
recode		p301b (7 = 0) (8 = 7 ) (9 = 8 ) (10 = 9 ) (11 = 10 ) (12 = 11 ), generate(educacion)

replace		p301a = educacion if p301a == . & anio>=2020
drop		educacion

generate	educ = . 
replace		educ = 1 if p301a>=1 & p301a<=2
replace		educ = 2 if p301a>=3 & p301a<=4
replace		educ = 3 if p301a>=5 & p301a<=6
replace		educ = 4 if p301a>=7 & p301a<=8
replace		educ = 5 if p301a>=9 & p301a<=10
replace		educ = 6 if p301a>=11 & p301a!=.

label		define educ 1 "Sin Nivel/Inicial" 2 "Primaria" 3 "Secundaria" 4 "Superior no universitaria" 5 "Superior universitaria" 6 "Posgrado"
label		values educ educ
label		variable educ "Nivel educativo"

*** Opción 2: Nivel educativo
recode		p301b (7 = 0) (8 = 7 ) (9 = 8 ) (10 = 9 ) (11 = 10 ) (12 = 11 ), generate(educacion)

replace		p301a = educacion if p301a == . & anio==2020
drop		educacion

generate	educ1 = . 
replace		educ1 = 1 if p301a>=1 & p301a<=2
replace		educ1 = 2 if p301a>=3 & p301a<=4
replace		educ1 = 3 if p301a>=5 & p301a<=6
replace		educ1 = 4 if p301a>=7 & p301a<=8
replace		educ1 = 5 if p301a>=9 & p301a<=11 & p301a!=.

label		define educ1 1 "Sin Nivel/Inicial" 2 "Primaria" 3 "Secundaria" 4 "Superior no universitaria" 5 "Superior universitaria" 
label		values educ1 educ1
label		variable educ1 "Nivel educativo"


* Autoidentificacion étnica
generate identificacion = .
replace identificacion = 1 if p319 <=3
replace identificacion = 1 if p319 == 4 & anio >=2017
replace identificacion = 2 if (p319 ==4 & anio ==2016) | (p319==5 & anio >=2017)
replace identificacion = 3  if ((p319 ==5 | p319 ==6) & anio ==2016) | ((p319==6 | p319 == 7) & anio >=2017)

label		define identificacion 1 "Originario" 2 "Afroperuano" 3 "Blanco/Mestizo" 
label		values identificacion identificacion
label		variable identificacion "Auidentificacion"

* Factor de expansion
generate	expansion = .
replace		expansion = factoranual  if anio==2016
replace		expansion = factor if anio>=2017 & anio<=2019
replace		expansion = factor_calibrado   if anio==2020 | anio ==2021
replace		expansion = factor if anio ==2022
replace		expansion = factor if anio ==2023
replace		expansion = factor if anio ==2024


* Ordenando
order		anio id regionnatu zona depa area 
sort		anio id regionnatu zona depa area 

drop		vivienda nselv  hogar p300_a p800a_c nombredd facto* p301?_anio  p301?_grado p301?_ce p300c p301a p301b p319 