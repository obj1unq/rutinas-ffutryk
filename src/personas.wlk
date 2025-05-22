class Persona {
  var property peso
  const property tiempoDeEjercitacion
  const kilosPorCaloría

  method pesoAPerder(rutina) = (rutina.caloriasQuemadas(tiempoDeEjercitacion) / kilosPorCaloría)

  method ejercitar(rutina) {
    if(self.cumpleReglaDeEjercitacion(rutina)) peso -= self.pesoAPerder(rutina)
  }

  method cumpleReglaDeEjercitacion(rutina)
}

class PersonaSedentaria inherits Persona(kilosPorCaloría = 7000) {
  override method cumpleReglaDeEjercitacion(rutina) = peso > 50
}

class PersonaAtleta inherits Persona(kilosPorCaloría = 8000, tiempoDeEjercitacion = 90) {
  override method pesoAPerder(rutina) = super(rutina) - 1

  override method cumpleReglaDeEjercitacion(rutina) = rutina.caloriasQuemadas(tiempoDeEjercitacion) > 10000
}