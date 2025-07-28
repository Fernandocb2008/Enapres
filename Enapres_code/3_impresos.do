
* Obtención o adquisición de libros impresos 


* Obtención o adquisición
recode		p800a_13_1 (1 = 1 "Si")  (2 = 0 "No"), gen(impreso)
drop		p800a_13_1
label		variable impreso "Adquirio libro impreso"

* Frecuencia de adquisición: libro impreso
/*
recode 		p800a_14_1 (1 = 1 "Diaria")  (2 = 2 "Interdiaria") (3 = 3 "Semanal") (4 = 4 "Quincenal")  (5 = 5 "Mensual")  (6 = 6 "Trimestral")  (7 = 7 "Anual")  (8 = 8 "otra") , generate(frec_impreso)
label		variable frec_impreso "Frecuencia aquisicion de libro impreso"
drop		p800a_14_1
*/
recode 		p800a_14_1 (7 = 1 "Anual")  (6 = 2 "Trimestral") (5 = 3 "Mensual") (4 = 4 "Quincenal")  ( 3 = 5 "Semanal")  (1 2 8 = 6 "Otra") , generate(frec_impreso)
label		variable frec_impreso "Frecuencia aquisicion de libro impreso"
drop		p800a_14_1

/*
recode 		p800a_14_1 (3 = 1 "Semanal")  (4 = 2 "Quincenal") (5 = 3 "Mensual") (6 = 4 "Trimestral")  (7 = 5 "Anual")  (1 2 8 = 6 "Otra") , generate(frec_impreso)
label		variable frec_impreso "Frecuencia aquisicion de libro impreso"
drop		p800a_14_1
*/
/* Cómo lo obtuvo: libro impresos
recode		p800a_15_1 (1 = 1 "Comprado")  (2 = 2 "Regalado o pagado por otra persona") (3 = 3 "Prestado") (4 = 4 "No gasto")  (5 = 5 "Otra forma"), generate(modo_impreso)
label		variable modo_impreso "Forma aquisicion libro impreso"
drop		p800a_15_1*/

* Razón de no adqusición: libro impreso
recode		p800a_18_1 (1 = 2 "Falta de tiempo")  (2 = 1 "Falta de interes") (3 = 3 "Falta de dinero") (4 5 6 7= 4 "Otras respuestas"), generate(razon_impreso)
label		variable razon_impreso "Razon de no aquisicion de libro impreso"
drop		p800a_18_1

/*
* Razón de no adqusición: libro impreso
recode		p800a_18_1 (1 = 1 "Falta de tiempo")  (2 = 2 "Falta de interes") (3 = 3 "Falta de dinero") (4 = 4 "No tiene informacion")  (5 = 5 "No hay oferta")  (7 = 7 "Otra"), generate(razon_impreso)
label		variable razon_impreso "Razon de no aquisicion de libro impreso"
drop		p800a_18_1

*/