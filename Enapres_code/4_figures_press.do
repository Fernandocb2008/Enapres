
* Preview
generate impreso_100 = 100 if impreso ==1
replace impreso_100 = 0 if impreso ==0

* Figuras Enapres

graph set window fontface "Arial"


*F1

	graph bar impreso_100  [aw=expansion],  ///
	bargap(0.2) over(anio, gap(80) label(labsize(vsmall))) ///
	blabel(total, format(%3,1f) size(vsmall) color(black)) ///
	bar(1, fcolor("58 87 121") lcolor(black) lwidth(vvthin)) ///
	legend(  row(1)  size(small) pos(6) ) ///
	plotregion(style(none)) yscale(off) ylabel( , nogrid)  graphregion(color(white)) ///
	    title("{bf:Figura 1}", size(small) color(black)) ///
    subtitle("{it:Perú: porcentaje de la población de 14 y más años que obtuvo o adquirió libros impresos, 2016-2024}", size(vsmall) color(black))  ///
    note("Nota. Adaptado de Encuesta Nacional de Programas Presupuestales (Enapres), por INEI, 2016-2024.", size(vsmall) color(black))
	
		 forval i=1/`.Graph.plotregion1.barlabels.arrnels' {
    gr_edit .plotregion1.barlabels[`i'].text[1]="`.Graph.plotregion1.barlabels[`i'].text[1]' %"
}
	
		graph export Figura_1.pdf, replace


* F2	


linewrap , longstring("Perú: Perú: porcentaje de la población de 14 y más años que no obtuvo o adquirió libros impresos según el tipo de razón principal y área de residencia, 2016-2024") maxlength(85)

return list

graph bar   [aw=expansion],  over(razon_impreso) over(anio) stack asyvars percentage ///
ylab(, glpattern(solid) glcolor(gs15)) /// add vertical solid light gray lines
blabel(bar, pos(center) format(%3,1f) size(vsmall) color(black)) ///
graphregion(margin(vsmall)) ///
plotregion(style(none)) yscale(off) ylabel( , nogrid)  graphregion(color(white)) ///
legend(region(color(white))) ///
xsize(6.5) ysize(4.5) /// graph dimensions
bar(1, fintensity(100) fcolor("58 87 121") lcolor(black) lwidth(vthin)) ///
bar(2, fintensity(100) fcolor("93 138 155") lcolor(black) lwidth(vthin)) ///
bar(3, fintensity(100) fcolor("194 211 198") lcolor(black) lwidth(vthin)) ///
bar(4, fintensity(100) fcolor("237 230 203") lcolor(black) lwidth(vthin)) ///
	    title("{bf:Figura 2}", size(small) color(black)) ///
    subtitle({it:"`r(line1)'" "`r(line2)'"}, size(ssmall) color(black))  ///
    note("Nota. Adaptado de Encuesta Nacional de Programas Presupuestales (Enapres), por INEI, 2016-2024.", size(vsmall) color(black))
	
		 forval i=1/`.Graph.plotregion1.barlabels.arrnels' {
    gr_edit .plotregion1.barlabels[`i'].text[1]="`.Graph.plotregion1.barlabels[`i'].text[1]' %"
}

graph export Figura_2.pdf, replace
