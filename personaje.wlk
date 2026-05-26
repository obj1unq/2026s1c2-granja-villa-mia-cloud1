import cultivos.*
import wollok.game.*

object padme {
	var property position = game.center()
	const property image = "fplayer.png"
	const plantasCosechadas = []
	var property dinero = 0


	method sembrar(planta) {
		self.validarSiHayPlanta()
		planta.serSembrada()
	}

	method regar() {
		self.validarSiHayPlantaParaRegar() 
		const planta = game.uniqueCollider(self)
        planta.serRegada()
	}


	method cosechar() {
		self.validarSiHayPlantaParaCosechar() 
		const planta = game.uniqueCollider(self)
		if (planta.estaLista()) {
            plantasCosechadas.add(planta)
            game.removeVisual(planta)
        }
    
	}

	method plantasCosechadas() { return plantasCosechadas }

	method vender() {
		self.validarSiTienePlantas()
		self.validarSiEstaEnMercado()
		const mercado = game.uniqueCollider(self)
		const totalACobrar = self.valorPlantasCosechadas()
		mercado.comprar(plantasCosechadas, totalACobrar)
		dinero = dinero + totalACobrar
		plantasCosechadas.clear()
	}

	method informar() {
		game.say( self, "Tengo " + dinero.toString() + " monedas, y " + plantasCosechadas.size().toString() + " plantas para vender")
	}
	
	method serRegada() {
		
	}

	method dejarAspersor() {
		const aspersor = new Aspersor(position = position)
		aspersor.colocarAspersor()
		aspersor.iniciarRiego()
	}

	method valorPlantasCosechadas() {
		return plantasCosechadas.sum( {planta => planta.valor()})
	}

	

	method validarSiHayPlantaParaRegar() {
		if( game.colliders(self).isEmpty()) {
			self.error("No tengo nada para regar")
		}
	}

	method validarSiHayPlanta() {
		if( not game.colliders(self).isEmpty()) {
			self.error("Ya hay una planta aca")
		}
	}

	method validarSiHayPlantaParaCosechar() {
		if( game.colliders(self).isEmpty()) {
			self.error("No tengo nada para cosechar")
		}
	}

	method validarSiTienePlantas() {
		if( plantasCosechadas.isEmpty()) {
			self.error("No tengo plantas para vender")
		}
	}

	method validarSiEstaEnMercado() {
        if (game.colliders(self).isEmpty()) {
            self.error("No hay ningun mercado aca")
        }
    }

}