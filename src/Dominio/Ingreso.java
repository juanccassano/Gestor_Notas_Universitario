package Dominio;


import java.time.LocalDate;
import java.time.LocalDateTime;

public class Ingreso {
	

	int Legajo;
	LocalDate ingreso;
	
	public int getLegajo() {
		return Legajo;
	}
	public void setLegajo(int legajo) {
		Legajo = legajo;
	}
	public LocalDate getIngreso() {
		return ingreso;
	}
	public void setIngreso(LocalDate ingreso) {
		this.ingreso = ingreso;
	}
	

}
