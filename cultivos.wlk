import wollok.game.*

class Maiz {
	var property position
	var estado = bebe

	method image() {
		return estado.image()
	}

	method serRegada() {
		estado = adulto
	}

	method estaLista() {
		return estado.estaLista()
	}
}


class Trigo {
	var property position
	var evolucion = 0

	method image() {
		return "wheat_" + evolucion.toString() + ".png"
	}

	method serRegada() {
		if(evolucion == 3) {
			evolucion = 0 
		} else {
			evolucion = evolucion + 1
		}
	}
	method estaLista() {
		return evolucion >= 2
	}

}


class Tomaco {
	var property position

	method image() {
		return "tomaco.png"
	}

	method serRegada() {
        if (self.position().y() == game.height() - 1) {
			self.position(game.at(self.position().x(), 0))
        } else {
            self.position(self.position().up(1))
        }
    }

		method estaLista() {
			return true
	}
}	


object bebe {
	method image() {
		return "corn_baby.png"
	}

	method estaLista() {
		return false 
	}
}

object adulto {
	method image() {
		return "corn_adult.png"
	}

	method estaLista() {
		return true
	}
}
