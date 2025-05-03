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
        vitalidadTotal = (vitalidadTotal-1).max(0)
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
    const pasajeros = #{neo, morfeo, trinity}
    
    method cantidadDePasajeros() = pasajeros.size()

    method pasajeroDeMayorVitalidad() = pasajeros.max{pasajero => pasajero.vitalidad()}
        
    method pasajeroDeMenorVitalidad() = pasajeros.min{pasajero => pasajero.vitalidad()}   
    
    method estaEquilibrada(){
        return
            self.pasajeroDeMayorVitalidad().vitalidad() < self.pasajeroDeMenorVitalidad().vitalidad() * 2
    }
    
    method estaElELegido() = pasajeros.any{pasajero => pasajero.esElElegido()}

    method chocar(){ 
        pasajeros.forEach{pasajero => pasajero.saltar()}
        pasajeros.clear()
    }

    method acelerar() {
        pasajeros.filter{pasajero => not pasajero.esElElegido()}.forEach{pasajero => pasajero.saltar()}
        pasajeros.remove{neo}
    }
}