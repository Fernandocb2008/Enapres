
* Asistencia a bibliotecas y/o salas de lectura

* Asistencia

recode		p800a_8_8 (1 = 1 "Si")  (2 = 0 "No"), gen(biblioteca)
drop		p800a_8_8 
label		variable biblioteca "Asistio a biblioteca"

* Frecuencia de asistencia: Biblioteca y/o sala de lectura
recode		p800a_9_8 (1 = 1 "Semanal")  (2 = 2 "Mensual") (3 = 3 "Trimestral") (4 = 4 "Semestral")  (5 = 5 "Anual")  (6 = 6 "Otra"), generate(frec_biblio)
label		variable frec_biblio "Frecuencia asistencia biblioteca"
drop		p800a_9_8

*** Razón de no asistencia: Biblioteca y/o sala de lectura
recode		p800a_12_8 (1 = 1 "Falta de tiempo")  (2 = 2 "Falta de interes") (3 = 3 "Falta de dinero") (4 = 4 "No tiene informacion Oportuna")  (5 = 5 "No hay oferta")  (6 = 6 "Otra"), generate(razon_biblio)
label		variable razon_biblio "Razon de no asistencia biblioteca"
drop		p800a_12_8