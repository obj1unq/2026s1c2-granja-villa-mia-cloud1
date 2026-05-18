import cultivos.*
import wollok.game.*

object padme {
	var property position = game.center()
	const property image = "fplayer.png"
	const plantasCosechadas = []
	var dinero = 0


	method sembrarMaiz() {
		self.validarSiHayPlanta() 
		game.addVisual(new Maiz(position = self.position()))
	}

	method sembrarTrigo() {
		self.validarSiHayPlanta() 
		game.addVisual(new Trigo(position = self.position()))
	}

	method sembrarTomaco() {
		self.validarSiHayPlanta() 
		game.addVisual(new Tomaco(position = self.position()))
	}

	method regar() {
		const planta = game.uniqueCollider(self)
		self.validarSiHayPlantaParaRegar() 
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

	method vender() {
		if(not plantasCosechadas.isEmpty()) {
			dinero = dinero + self.valorPlantasCosechadas()
			plantasCosechadas.clear()
		}
	}

	method informar() {
		game.say( self, "Tengo " + dinero.toString() + " monedas, y " + plantasCosechadas.size().toString() + " plantas para vender")
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


}