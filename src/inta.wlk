import plantas.*
import parcelas.*


object inta {
	var property parcelas = #{}
	
	method promedioDePlantas() { 
		return parcelas.sum( { parcela => parcela.plantas().size() } ) / parcelas.size()
	}
	
	method laParcelaMasAutosustentable() { return 
		self.parcelasConMasDeCuatroPlantas().max( { parcela => parcela.porcentajeAsociadas() } )
		
	}
	
	method agregarParcela(parcela) { parcelas.add(parcela) }	
	
	
	method parcelasConMasDeCuatroPlantas() { 
		return parcelas.filter( { parcela => parcela.plantas().size() > 4} )
	}
	

}
