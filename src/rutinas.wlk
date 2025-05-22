class Rutina {
  const intensidad
  
  method descanso(tiempo)
  
  method caloriasQuemadas(tiempo) = 100 * (tiempo - self.descanso(tiempo)) * intensidad
}

class Running inherits Rutina {
  override method descanso(tiempo) = if (tiempo > 20) 5 else 2
}

class Maratón inherits Running {
  override method caloriasQuemadas(tiempo) = super(tiempo) * 2
}

class Remo inherits Rutina (intensidad = 1.3) {
  override method descanso(tiempo) = tiempo / 5
}

class RemoCompetitivo inherits Remo (intensidad = 1.7) {
  override method descanso(tiempo) = (super(tiempo) - 3).max(2)
}