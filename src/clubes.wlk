class Predio {
  const property rutinasDisponibles

  method caloriasTotalesQuemadasPor(persona) = rutinasDisponibles.sum{rutina => self.caloriasQueQuema(rutina, persona)}

  method quemaAlMenos500Calorias(persona) = rutinasDisponibles.any{ rutina => self.caloriasQueQuema(rutina, persona) < 500}

  method rutinaMasExigentePara(persona) = rutinasDisponibles.max{rutina => self.caloriasQueQuema(rutina, persona)}

  method caloriasQueQuema(rutina, persona) = rutina.caloriasQuemadas(persona.tiempoDeEjercitacion())
}

class Club {
  const predios

  method mejorPredioPara(persona) = predios.max{predio => predio.caloriasTotalesQuemadasPor(persona)}

  method prediosTranquisPara(persona) = predios.filter{predio => predio.quemaAlMenos500Calorias(persona)}

  method rutinasMasExigentesPara(persona) = predios.map{predio => predio.rutinaMasExigentePara(persona)}.asSet()
}