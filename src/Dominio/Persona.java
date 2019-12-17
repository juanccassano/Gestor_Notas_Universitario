package Dominio;

public class Persona {
int Legajo;
int DNI;
String ApellidoNombre;
String Direccion;
String Localidad;
String Provincia;
String Mail;
int Telefono;
String Rol;


public int getDNI() {
	return DNI;
}
public void setDNI(int dNI) {
	DNI = dNI;
}

public String getApellidoNombre() {
	return ApellidoNombre;
}
public void setApellidoNombre(String apellidoNombre) {
	ApellidoNombre = apellidoNombre;
}
public int getLegajo() {
	return Legajo;
}
public void setLegajo(int legajo) {
	Legajo = legajo;
}

public String getDireccion() {
	return Direccion;
}
public void setDireccion(String direccion) {
	Direccion = direccion;
}
public String getLocalidad() {
	return Localidad;
}
public void setLocalidad(String localidad) {
	Localidad = localidad;
}
public String getProvincia() {
	return Provincia;
}
public void setProvincia(String provincia) {
	Provincia = provincia;
}
public String getMail() {
	return Mail;
}
public void setMail(String mail) {
	Mail = mail;
}
public int getTelefono() {
	return Telefono;
}
public void setTelefono(int telefono) {
	Telefono = telefono;
}
public String getRol() {
	return Rol;
}
public void setRol(String rol) {
	Rol = rol;
}

}
