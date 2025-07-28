
* Asistencia a ferias de libro

* Asistencia
recode		p800a_8_9  (1 = 1 "Si")  (2 = 0 "No"), gen(feria)
drop		p800a_8_9
label		variable feria "Asistió a feria"

 
* Frecuencia de asistencia: Feria de libro
recode		p800a_9_9 (1 = 1 "Semanal")  (2 = 2 "Mensual") (3 = 3 "Trimestral") (4 = 4 "Semestral")  (5 = 5 "Anual")  (6 = 6 "Otra"), generate(frec_feria)
label		variable frec_feria "Frecuencia asistencia Feria"
drop		p800a_9_9  

* Razón de no asistencia: Feria de libro
recode		p800a_12_9 (1 = 1 "Falta de tiempo")  (2 = 2 "Falta de interes") (3 = 3 "Falta de dinero") (4 = 4 "No tiene informacion Oportuna")  (5 = 5 "No hay oferta")  (6 = 6 "Otra"), generate(razon_feria)
label		variable razon_feria "Razon de no asistencia Feria"
drop		p800a_12_9