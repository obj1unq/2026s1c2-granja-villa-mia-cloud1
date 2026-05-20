import wollok.game.*

class Maiz {
	var property position
	var estado = maizBebe

	method image() {
		return estado.image()
	}
	method serRegada() {
		estado = maizAdulto
	}

	method estaLista() {
		return estado.estaLista()
	}

	method valor() {
		return 150
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

	method valor() {
		return (evolucion - 1) * 100
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
	method valor() {
		return 80
	}
}	


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
