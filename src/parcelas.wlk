import plantas.*
import inta.*

class Parcelas {
	var property ancho
	var property largo
	var property horasDeSol
	var property plantas = #{}	
	
	method superficie() { return ancho * largo 
		
	}
	
	method cantidadMaxima() { if ( ancho > largo ) return self.superficie() / 5
		else return self.superficie() / 3 + largo 
	}
	
	method tieneComplicaciones() { 
		return plantas.any( { planta => planta.horasDeSolQueTolera() < horasDeSol})
		
	}
	
	method plantarPlanta(planta) { 
		if ( ( self.cantidadMaxima() > plantas.size() ) or
		( ( horasDeSol - planta.horasDeSolQueTolera() ) > 2 ) ) return { self.error("Esta planta no sera plantada")}
		else  return  plantas.add(planta) 
		
		
	}	
	
}

class ParcelaEcologica inherits Parcelas {
	
	method seAsociaBien(planta) { 
		return not self.tieneComplicaciones() and planta.parecelaIdeal(self)
	 }
	 
	method porcentajeAsociadas() {
		 return ( plantas.filter( { planta => self.seAsociaBien(planta) } ).size() * self.plantas().size() ) / self.plantas().size()
		 
	}

}

class ParcelaIndustrial inherits Parcelas {
	
	method seAsociaBien(planta) { return plantas.size() <= 2 and planta.esFuerte() }
	
	method porcentajeAsociadas() {
		 return ( plantas.filter( { planta => self.seAsociaBien(planta) } ).size() * 100 ) / self.plantas().size()
		 
	}
}

