//
//  Diagrama.swift
//  conjuntos
//
//  Created by Mario Díaz on 4/12/16.
//  Copyright © 2016 Mario Díaz. All rights reserved.
//

import UIKit

class Diagrama: NSObject {
    var conjuntos = [Conjunto]()
    
    init(numConjuntos num: Int) {
        let c1 : Conjunto = Conjunto()
        let c2 : Conjunto = Conjunto()
        let c3 : Conjunto = Conjunto()
        
        for i in 0...4 {
            c1.datos[i] = i
            c2.datos[i] = i+1
            c3.datos[i] = i*2
        }
        
        if num == 2 {
            conjuntos.append(c1)
            conjuntos.append(c2)
        } else {
            conjuntos.append(c1)
            conjuntos.append(c2)
            conjuntos.append(c3)
        }
    }
    
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
    
}

