//
//  Operacion.swift
//  conjuntos
//
//  Created by Mario Díaz on 4/12/16.
//  Copyright © 2016 Mario Díaz. All rights reserved.
//

import UIKit

class Operacion: NSObject {
    
    func interseccionDos(conjuntoA: Conjunto, conjuntoB: Conjunto) -> Array<Int> {
        var intersects = [Int]()
        
        
        for i in 0...(conjuntoA.datos.count - 1) {
            for x in 0...(conjuntoB.datos.count - 1) {
                if conjuntoA.datos[i] == conjuntoB.datos[x] && conjuntoA.datos[i] != nil {
                    intersects.append(conjuntoA.datos[i]!)
                }
            }
        }
        
       return intersects
    }
    
//    func interseccionTres(conjuntoA: Conjunto, conjuntoB: Conjunto) -> Array<Conjunto> {
//        
//    }
    
    func arrayToString(datos: Array<Int?>) -> String {
        var s = ""
        
        for i in 0...(datos.count - 1) {
            if datos[i] != nil {
                let intAux = datos[i]!
                if i == 0 {
                    s += String(intAux)
                } else {
                    s += " " + String(intAux)
                }
            }
        }
        return s
    }
    
}
