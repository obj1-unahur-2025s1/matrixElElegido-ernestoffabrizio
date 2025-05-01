object neo{
    var energiaTotal = 100
    method saltar(){
        energiaTotal = energiaTotal/2
    }
    method energia(){
        return(energiaTotal)
    }
    method vitalidad(){
        return(
            energiaTotal*0.1
        )
    }
    method esElegido(){
        return(true)
    }
}
object morfeo{
    var vitalidadTotal = 8
    var descanso = true 
    method estaDescansado(){
        return(
            descanso
        )
    }
    method saltar(){
        if (not(self.estaDescansado())){
            descanso = true
        }
        vitalidadTotal = vitalidadTotal-1
    }
    method vitalidad(){
        return(vitalidadTotal)
    }
    method esElegido(){
        return(false)
    }
}
object trinity{
    method vitalidad(){
        return(0)
    }
    method saltar(){}
    method esElegido(){
        return(false)
    }
}
object nave{
    const listaPasajeros = []
    method subirPasajero(unPasajero){
        listaPasajeros.add(unPasajero)
    }    
    method pasajeros(){
        return(listaPasajeros)
    }
    method bajarPasajero(unPasajero){
        listaPasajeros.remove(unPasajero)
    }
    method pasajeroDeMayorVitalidad(){
        var mayorVitalidad = listaPasajeros.first()
            listaPasajeros.forEach{ pasajero =>
    if (pasajero.vitalidad() > mayorVitalidad.vitalidad()) {
      mayorVitalidad = pasajero 
      }
  }
        return (mayorVitalidad)
    }
    method estaEquilibrada(){
        var pasajeroConMasVitalidad = self.pasajeroDeMayorVitalidad()
        var estaEquilibrado = true
            listaPasajeros.forEach{ pasajero =>
        if (pasajeroConMasVitalidad.vitalidad() > pasajero.vitalidad()*2) {
            estaEquilibrado = false
        }
        pasajeroConMasVitalidad = pasajero
        }
        return(estaEquilibrado)
    }
    method estaElElegido(){
        return listaPasajeros.any{
        pasajero => pasajero.esElegido()
        }
    }
    method naveChoca(){
        listaPasajeros.removeAll()
    }
    method naveAcelera(){
        listaPasajeros.forEach { pasajero => 
          if(not pasajero.esElElegido()){
            pasajero.saltar()
        }
    }
  }
}