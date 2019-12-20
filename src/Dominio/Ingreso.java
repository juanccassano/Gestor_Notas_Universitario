package Dominio;


import java.time.LocalDate;
import java.time.LocalDateTime;

public class Ingreso {
	

	int Legajo;
	LocalDateTime ingreso;
	
	public int getLegajo() {
		return Legajo;
	}
	public void setLegajo(int legajo) {
		Legajo = legajo;
	}
	public LocalDateTime getIngreso() {
		return ingreso;
	}
	public void setIngreso(LocalDateTime ingreso) {
		this.ingreso = ingreso;
	}
	

}
