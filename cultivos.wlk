import wollok.game.*
import estados.*

class Maiz {
	var property position
	var estado = maizBebe

	method image() {
		return estado.image()
	}

	method serSembrada() {
		game.addVisual(self)
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
	var evolucion = trigoEvolucion1

	method image() {
		return evolucion.image()
	}
	method serSembrada() {
		game.addVisual(self)
	}
	method serRegada() {
		evolucion = evolucion.siguiente()
	}
	method estaLista() {
		return evolucion.estaLista()
	}

	method valor() {
		return evolucion.valor()
	}

}


class Tomaco {
	var property position

	method image() {
		return "tomaco.png"
	}

	method serSembrada() {
		game.addVisual(self)
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

class Aspersor {
	var property position

	method image() {
		return "aspersor.png"
	} 

	method colocarAspersor() {
		game.addVisual(self)
	} 

	method iniciarRiego() {
		game.onTick(1000, "regar_" + position.x().toString() + "_" + position.y().toString() , { self.regar() })
	}

	method regar() {
  		const parcelasVecinas = [
    game.at(position.x() + 1, position.y()),
    game.at(position.x() - 1, position.y()),
    game.at(position.x(), position.y() + 1),
    game.at(position.x(), position.y() - 1)
  ]
  	parcelasVecinas.forEach({ parcela => game.getObjectsIn(parcela).forEach({ p => p.serRegada() })
  })
}
}

class Mercado {
	var property position 
	var property monedas = 0
	const mercaderiaPorVender = []

	method image() {
		return "mercado.png" 
	}

	method puedeComprar(precio) {
		return monedas  >= precio
	}

	method comprar(mercaderia, dinero) {
		self.validarSiTieneDinero(dinero)
		monedas = monedas - dinero
		mercaderiaPorVender.addAll(mercaderia)
	}

	method validarSiTieneDinero(dinero) {
		if (not self.puedeComprar(dinero)) {
			self.error("No tiene dinero suficiente")
		}
	}
}