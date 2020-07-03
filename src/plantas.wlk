import parcelas.*
import inta.*


class Plantas {
	
	var property anioSemilla   // se configura
	var property altura			// se configura

	
	method horasDeSolQueTolera() { return 7
		
	}
	
	method esFuerte() { return self.horasDeSolQueTolera() > 9
		
	}
	
	method daNuevasSemillas() { return self.esFuerte()
		
	}	
	

}

class Menta inherits Plantas {
	
	method parecelaIdeal(parcela) { return parcela.superficie() > 6
		
	}
	
	method espacio() {  return altura + 1   //wtf
		
	}
	
	override method daNuevasSemillas() { return super() or self.espacio() > 1.5
		
	}

}	
	
	
class Soja inherits Plantas {
	
	method parecelaIdeal(parcela) { return parcela.horasDeSol() == self.horasDeSolQueTolera()
		
	}
	
	method espacio() {  return altura / 2  
		
	}
	
	override method daNuevasSemillas() { return super() or
		( anioSemilla > 2007 and self.altura().between(0.75,0.9) )
		
	}
	
	override method horasDeSolQueTolera() {  if ( altura < 0.5 ) return  6
		if (altura > 1 ) return  12
		else  return  8 
	}		
	
}

class Quinoa inherits Plantas {
	
	var property espacio   // por la geran variedad que existe de estas plantas, se debe setear el espacio.
	
	method parecelaIdeal(parcela) { return not parcela.plantas().any( { planta => planta.altura() > 1.5 } ) 
		
	}
	
	override method daNuevasSemillas() { return super() or anioSemilla < 2005
		
	}
	
	override method horasDeSolQueTolera() {  if ( espacio < 0.3 ) return 10
		else  return super() 
	}

}	


class SojaTransgenica inherits Soja {
	
	
	override method parecelaIdeal(parcela) { return ( parcela.plantas().size() ) <= 1 
		
	}
	
	override method daNuevasSemillas() { return false }
	}

class HierbaBuena inherits Menta {
	
	override method espacio() { return super()*2 
		
	}
}


