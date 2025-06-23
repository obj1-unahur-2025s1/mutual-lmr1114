class Actividad {
  const property idiomas


  method esInteresante() = idiomas.size() >= 2
  method sirveParaBroncearse() = true
  method dias()
  method implicaEsfuerzo()

}

class ViajeDePlaya inherits Actividad {
  var largo
  override method dias() = largo / 500
  override method implicaEsfuerzo() = largo > 1200

}

class ExcursionACiudad inherits Actividad {
  const property cantidadAtracciones


  override method esInteresante() = super() || cantidadAtracciones.size() == 5
  override method dias() = cantidadAtracciones.size() / 2
  override method sirveParaBroncearse() = false
  override method implicaEsfuerzo() = cantidadAtracciones.size().between(5, 8)
}


class ExcursionTropical inherits ExcursionACiudad {
  override method dias() = super() + 1
  override method sirveParaBroncearse() = true
}

class SalidaTrekking inherits Actividad {
  var kms
  var diasDeSol

  override method esInteresante() = super() && diasDeSol > 140

  override method dias() = kms / 10
  override method implicaEsfuerzo() = kms > 80
  override method sirveParaBroncearse() {
    return
    diasDeSol > 200 ||
    (diasDeSol.between(100, 200) && kms > 120)
  }
}

class ClaseDeGimnasia inherits Actividad {
  method initialize() {
    idiomas.clear()
    idiomas.add("espaniol")
  }

  method validaddor() {
    if(idiomas == #{"espaniol"}) {
      self.error("el unico idioma disponible es espaniol")
    }
  }

  override method dias() = 1
  override method sirveParaBroncearse() = false
  override method implicaEsfuerzo() = true
}


class Socio {
  var edad
  var maximoActividades
  const property idiomas = #{}
  const property actividades = []


  method actividadesEsforzadas() = actividades.filter({a => a.implicaEsfuerzo()})
  
  method esAdoradorDelSol() = actividades.all({a => a.sirveParaBroncearse()})
  
  method registrarActividad(unaActividad) {
    if(actividades.size() == maximoActividades ){
      self.error("Ha superado el maximo de actividades permitidas")
    }

    actividades.add(unaActividad)
  }
  
  method leAtrae(unaActividad)
  
}

class SocioTraquilo inherits Socio {
  
}