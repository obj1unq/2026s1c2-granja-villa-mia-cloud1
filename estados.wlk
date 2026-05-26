object maizBebe {
	method image() {
		return "corn_baby.png"
	}

	method estaLista() {
		return false 
	}
}

object maizAdulto {
	method image() {
		return "corn_adult.png"
	}

	method estaLista() {
		return true
	}
}

object trigoEvolucion0 {
	method image() { 
		return "wheat_0.png" 
	}
    method siguiente() { 
		return trigoEvolucion1 
	} 
    method estaLista() { 
		return false 
	}
    method valor() {
		 return 0 
	}
}
object trigoEvolucion1 {
	method image() { 
		return "wheat_1.png" 
	}
    method siguiente() { 
		return trigoEvolucion2 
	} 
    method estaLista() { 
		return false 
	}
    method valor() { 
		return 0 
	}
}

object trigoEvolucion2 {
    method image() { 
		return "wheat_2.png"
	}
    method siguiente() { 
		return trigoEvolucion3 
	} 
    method estaLista() { 
		return true 
	}
    method valor() { 
		return 100
	}
}

object trigoEvolucion3 {
    method image() { 
		return "wheat_3.png" 
	}
    method siguiente() { 
		return trigoEvolucion0 
	} 
    method estaLista() { 
		return true 
	}
    method valor() { 
		return 200 
	}
}