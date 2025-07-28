

* Obtención o adquisición de libros digitales 

// Adquisición libro digital //
recode		p800a_13_4 (1 = 1 "Si")  (2 = 0 "No"), gen(digital)
drop		p800a_13_4
label		variable digital "Adquirio libro digital" 

* Frecuencia de adquisición: libro digital
recode 		p800a_14_4 (1 = 7 "Diaria")  (2 = 6 "Interdiaria") (3 = 5 "Semanal") (4 = 4 "Quincenal")  (5 = 3 "Mensual")  (6 = 2 "Trimestral")  (7 = 1 "Anual")  (8 = 8 "otra") , generate(frec_digital)
label		variable frec_digital "Frecuencia aquisicion de libro digital"
drop		p800a_14_4 

/* Cómo lo obtuvo: libro digital
recode		p800a_15_4 (1 = 1 "Comprado")  (2 = 2 "Regalado o pagado por otra persona") (3 = 3 "Prestado") (4 = 4 "No gasto")  (5 = 5 "Otra forma"), generate(modo_digital)
label		variable modo_digital "Forma aquisicion libro digital"
drop		p800a_15_4*/

* Razón de no adqusición: libro digital
recode		p800a_18_4 (2 = 1 "Falta de interés")  (6 = 2 "Nunca utiliza internet") (1 = 3 "Falta de tiempo") (3 4 5 7 = 5 "Otra"), generate(razon_digital)
label		variable razon_digital "Razon de no aquisicion de libro digital"
drop 		p800a_18_4