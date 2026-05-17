import cultivos.*
import wollok.game.*

object padme {
	var property position = game.center()
	const property image = "fplayer.png"
	const plantasCosechadas = []


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
		if( not game.colliders(self).isEmpty()) {
			self.error("No tengo nada para cosechar")
		}
	}


}